package com.blacksheep.mtm.service.Impl;

import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.common.jedis.JedisClient;
import com.blacksheep.mtm.common.utils.IDUtil;
import com.blacksheep.mtm.dao.TbAgreementMapper;
import com.blacksheep.mtm.pojo.manager.TbAgreement;
import com.blacksheep.mtm.pojo.manager.TbAgreementExample;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.service.AgreementService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.jms.*;
import java.util.List;

@Service
public class AgreementServiceImpl implements AgreementService {

    private final static Logger log= LoggerFactory.getLogger(AgreementServiceImpl.class);


    @Autowired
    TbAgreementMapper tbAgreementMapper;

    @Autowired
    private JmsTemplate jmsTemplate;
    @Resource
    private Destination topicDestination;
    @Autowired
    private JedisClient jedisClient;

    @Value("${AGREEMENT}")
    private String AGREEMENT;
    @Override
    public TbAgreement getItemById(Long itemId) {

        TbAgreement tbAgreement=tbAgreementMapper.selectByPrimaryKey(itemId);
        return tbAgreement;
    }

    @Override
    public TbAgreement getNormalItemById(Long id) {
        return null;
    }

    @Override
    public DataTablesResult getItemList(int draw, int start, int length, int cid, String search, String orderCol, String orderDir) {
        DataTablesResult result=new DataTablesResult();

        //分页执行查询返回结果
        PageHelper.startPage(start/length+1,length);
        List<TbAgreement> list = tbAgreementMapper.selectItemByCondition(cid,"%"+search+"%",orderCol,orderDir);
        PageInfo<TbAgreement> pageInfo=new PageInfo<>(list);
        result.setRecordsFiltered((int)pageInfo.getTotal());
        result.setRecordsTotal(getAllItemCount().getRecordsTotal());
        result.setDraw(draw);
        result.setData(list);

        return result;
    }

    @Override
    public DataTablesResult getItemSearchList(int draw, int start, int length, int cid, String search, String minDate, String maxDate, String orderCol, String orderDir) {
        DataTablesResult result=new DataTablesResult();

        //分页执行查询返回结果
        PageHelper.startPage(start/length+1,length);
        List<TbAgreement> list = tbAgreementMapper.selectItemByMultiCondition(cid,"%"+search+"%",minDate,maxDate,orderCol,orderDir);
        PageInfo<TbAgreement> pageInfo=new PageInfo<>(list);
        result.setRecordsFiltered((int)pageInfo.getTotal());
        result.setRecordsTotal(getAllItemCount().getRecordsTotal());

        result.setDraw(draw);
        result.setData(list);

        return result;
    }

    @Override
    public DataTablesResult getAllItemCount() {
        TbAgreementExample example=new TbAgreementExample();
        Long count=tbAgreementMapper.countByExample(example);
        DataTablesResult result=new DataTablesResult();
        result.setRecordsTotal(Math.toIntExact(count));
        return result;
    }

    @Override
    public TbAgreement alertItemState(Long id, Integer state) {
        TbAgreement tbAgreement = getNormalItemById(id);
        tbAgreement.setState(state.byteValue());
        if (tbAgreementMapper.updateByPrimaryKey(tbAgreement) != 1){
            throw new XmallException("修改合同状态失败");
        }
        return getNormalItemById(id);
    }

    @Override
    public int deleteItem(Long id) {

        if(tbAgreementMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除合同失败");
        }
        //发送消息同步索引库
        try {
            sendRefreshESMessage("delete",id);
        }catch (Exception e){
            log.error("同步索引出错");
        }
        return 0;
    }

    @Override
    @Transactional
    public TbAgreement addItem(TbAgreement tbAgreement) {
        long id= IDUtil.getRandomId();
        tbAgreement.setId(id);
        tbAgreement.setState((byte) 0);
        if(tbAgreementMapper.insertSelective(tbAgreement)!=1){
            throw new XmallException("添加合同失败");
        }
        //按照模板生成pdf

        //发送消息同步索引库
        try {
            sendRefreshESMessage("add",id);
        }catch (Exception e){
            log.error("同步索引出错==>"+e.getMessage());
        }
        return getNormalItemById(id);
    }

    @Override
    public TbAgreement updateItem(Long id, TbAgreement tbAgreement) {


        TbAgreement oldTbItem=getNormalItemById(id);

        tbAgreement.setId(id);
        tbAgreement.setState(oldTbItem.getState());
        tbAgreement.setCreateTime(oldTbItem.getCreateTime());
        if(tbAgreementMapper.updateByPrimaryKey(tbAgreement)!=1){
            throw new XmallException("更新合同失败");
        }

        //同步缓存
        deleteProductDetRedis(id);
        //发送消息同步索引库
        try {
            sendRefreshESMessage("add",id);
        }catch (Exception e){
            log.error("同步索引出错");
        }
        return getNormalItemById(id);
    }

    /**
     * 同步合同详情缓存
     * @param id
     */
    public void deleteProductDetRedis(Long id){
        try {
            jedisClient.del(AGREEMENT+":"+id);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 发送消息同步索引库
     * @param type
     * @param id
     */
    public void sendRefreshESMessage(String type,Long id) {
        jmsTemplate.send(topicDestination, new MessageCreator() {
            @Override
            public Message createMessage(Session session) throws JMSException {
                TextMessage textMessage = session.createTextMessage(type+","+String.valueOf(id));
                return textMessage;
            }
        });
    }
}
