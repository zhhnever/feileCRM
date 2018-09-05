package com.blacksheep.mtm.service.Impl;


import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.dao.TbMemberQuestionMapper;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbMemberQuestion;
import com.blacksheep.mtm.service.TbMemberQuestionService;
//import ;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbMemberQuestionServiceImpl implements TbMemberQuestionService {
    private final static Logger log = LoggerFactory.getLogger(CourseServiceImpl.class);
    @Autowired
    private TbMemberQuestionMapper tbMemberQuestionMapper;

    @Override
    public TbMemberQuestion getQuestionById(Integer id) {
        TbMemberQuestion tbMemberQuestion = tbMemberQuestionMapper.selectByPrimaryKey(id);
        return tbMemberQuestion;
    }

    @Override
    public DataTablesResult getQuestionList(int draw, int start, int length, int cid,
                                            String search, String orderCol, String orderDir) {
        DataTablesResult result = new DataTablesResult();

        //分页执行查询返回结果
        PageHelper.startPage(start/length+1,length);
        List<TbMemberQuestion> list = tbMemberQuestionMapper.selectItemByCondition(cid,"%"+search+"%",orderCol,orderDir);
        PageInfo<TbMemberQuestion> pageInfo=new PageInfo<>(list);
        result.setRecordsFiltered((int)pageInfo.getTotal());
        result.setRecordsTotal((int)pageInfo.getTotal());
        result.setDraw(draw);
        result.setData(list);
        return result;
    }

    @Override
    public TbMemberQuestion insertQuestion(TbMemberQuestion tbMemberQuestion) {
        int result = tbMemberQuestionMapper.insertSelective(tbMemberQuestion);
        if (result <0 ){
            throw new XmallException("新增问题失败");
        }
        return tbMemberQuestion;
    }

    @Override
    public int delQuestion(Integer id) {
        if(tbMemberQuestionMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除问题失败");
        }
        return 0;
    }

    @Override
    public TbMemberQuestion updateQuestion(TbMemberQuestion tbMemberQuestion) {

        if(tbMemberQuestionMapper.updateByPrimaryKeySelective(tbMemberQuestion)!=1){
            throw new XmallException("更新问题失败");
        }
        return tbMemberQuestion;
    }

    public int deleteBatch(Integer[] ids){
        int result = tbMemberQuestionMapper.deleteBatchById(ids);
        if(result!=ids.length){
            throw new XmallException("批量删除问题失败");
        }
        return 0;
    }


//    private void sendRefreshESMessage(String type,Long id) {
//        jmsTemplate.send(topicDestination, new MessageCreator() {
//            @Override
//            public Message createMessage(Session session) throws JMSException {
//                TextMessage textMessage = session.createTextMessage(type+","+String.valueOf(id));
//                return textMessage;
//            }
//        });
//    }
//    /**
//     * 同步课程详情缓存
//     * @param id
//     */
//    private void deleteProductDetRedis(Long id){
//        try {
//            jedisClient.del(COURSE_ITEM+":"+id);
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }
}
