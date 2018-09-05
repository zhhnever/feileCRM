package com.blacksheep.mtm.service.Impl;

import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.common.jedis.JedisClient;
import com.blacksheep.mtm.dao.TbCourseMapper;
import com.blacksheep.mtm.dao.TbItemMapper;
import com.blacksheep.mtm.dao.TbUserMapper;
import com.blacksheep.mtm.dto.CourseDto;
import com.blacksheep.mtm.dto.DtoUtil;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbCourse;
import com.blacksheep.mtm.pojo.manager.TbItem;
import com.blacksheep.mtm.pojo.manager.TbUser;
import com.blacksheep.mtm.service.CourseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
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
@Transactional
public class CourseServiceImpl implements CourseService{

    @Autowired
    private TbCourseMapper tbCourseMapper;
    @Autowired
    private TbUserMapper tbUserMapper;
    @Autowired
    private TbItemMapper tbItemMapper;
    @Autowired
    private JmsTemplate jmsTemplate;
    @Resource
    private Destination topicDestination;
    @Autowired
    private JedisClient jedisClient;

    @Value("${COURSE_ITEM}")
    private String COURSE_ITEM;

    private final static Logger log= LoggerFactory.getLogger(CourseServiceImpl.class);


    @Override
    public CourseDto getItemById(Integer itemId) {
        TbCourse tbCourse = tbCourseMapper.selectByPrimaryKey(itemId);
        CourseDto courseDto = DtoUtil.Course2CourseDto(tbCourse);

        TbUser tbUser = tbUserMapper.selectByPrimaryKey((long)tbCourse.getTeacher());
        if (tbUser!=null)
            courseDto.setTname(tbUser.getUsername());
        return courseDto;
    }

    @Override
    public TbCourse getNormalItemById(Integer id) {
        return null;
    }

    @Override
    public DataTablesResult getItemList(int draw, int start, int length, int cid,String username, String search, String orderCol, String orderDir) {
        DataTablesResult result = new DataTablesResult();

        //分页执行查询返回结果
        PageHelper.startPage(start/length+1,length);
        Long userId = 0L;
        if (!StringUtils.equals(username,"admin")){
            userId = tbUserMapper.getUserIdByUsername(username);
        }
        List<TbCourse> list = tbCourseMapper.selectItemByCondition(cid,userId,"%"+search+"%",orderCol,orderDir);
        PageInfo<TbCourse> pageInfo=new PageInfo<>(list);
        result.setRecordsFiltered((int)pageInfo.getTotal());
        result.setRecordsTotal((int)pageInfo.getTotal());
        result.setDraw(draw);
        result.setData(list);

        return result;
    }

    @Override
    public DataTablesResult getItemSearchList(int draw, int start, int length, int cid, String search, String minDate, String maxDate, String orderCol, String orderDir) {

        DataTablesResult result=new DataTablesResult();

        //分页执行查询返回结果
        PageHelper.startPage(start/length+1,length);
        List<TbCourse> list = tbCourseMapper.selectItemByMultiCondition(cid,"%"+search+"%",minDate,maxDate,orderCol,orderDir);
        PageInfo<TbCourse> pageInfo=new PageInfo<>(list);
        result.setRecordsFiltered((int)pageInfo.getTotal());
        result.setRecordsTotal(getAllItemCount().getRecordsTotal());

        result.setDraw(draw);
        result.setData(list);

        return result;
    }

    @Override
    public DataTablesResult getAllItemCount() {
        return null;
    }

    @Override
    public TbCourse alertItemState(Integer id, byte state) {

        TbCourse tbCourse = tbCourseMapper.selectByPrimaryKey(id);
        tbCourse.setStatus(state);

        if (tbCourseMapper.updateByPrimaryKeySelective(tbCourse) != 1){
            throw new XmallException("修改课程状态失败");
        }
        return tbCourse;
    }

    @Override
    public int deleteItem(Integer id) {

        if(tbCourseMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除课程失败");
        }
        //发送消息同步索引库
        try {
            sendRefreshESMessage("delete",(long)id);
        }catch (Exception e){
            log.error("同步索引出错");
        }
        return 0;
    }

    @Override
    public TbCourse addItem(CourseDto courseDto) {

        TbCourse tbCourse= DtoUtil.CourseDto2Course(courseDto);

        int id = tbCourseMapper.insert(tbCourse);
        if(id <=0 ){
            throw new XmallException("添加课程失败");
        }
        //发送消息同步索引库
        try {
            sendRefreshESMessage("add",(long)id);
        }catch (Exception e){
            log.error("同步索引出错");
        }
        return tbCourse;
    }

    @Override
    public TbCourse updateItem(Integer id, CourseDto courseDto) {

        TbCourse oldTbCourse=tbCourseMapper.selectByPrimaryKey(id);
        TbCourse tbCourse = DtoUtil.CourseDto2Course(courseDto);
        tbCourse.setId(oldTbCourse.getId());

        if(tbCourseMapper.updateByPrimaryKeySelective(tbCourse)!=1){
            throw new XmallException("更新课程失败");
        }
        //同步缓存
        deleteProductDetRedis((long)id);
        //发送消息同步索引库
        try {
            sendRefreshESMessage("add",(long)id);
        }catch (Exception e){
            log.error("同步索引出错");
        }
        return tbCourse;
    }

    private void sendRefreshESMessage(String type,Long id) {
        jmsTemplate.send(topicDestination, new MessageCreator() {
            @Override
            public Message createMessage(Session session) throws JMSException {
                TextMessage textMessage = session.createTextMessage(type+","+String.valueOf(id));
                return textMessage;
            }
        });
    }
    /**
     * 同步课程详情缓存
     * @param id
     */
    private void deleteProductDetRedis(Long id){
        try {
            jedisClient.del(COURSE_ITEM+":"+id);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int deleteBatch(Integer[] ids){
        int result = tbCourseMapper.deleteBatchById(ids);
        if(result!=ids.length){
            throw new XmallException("删除课程失败");
        }
        return 0;
    }
}
