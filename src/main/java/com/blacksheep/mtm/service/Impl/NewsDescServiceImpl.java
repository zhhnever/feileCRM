package com.blacksheep.mtm.service.Impl;

import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.dao.TbNewsDescMapper;
import com.blacksheep.mtm.pojo.manager.TbNewsDesc;
import com.blacksheep.mtm.service.NewsDescService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsDescServiceImpl implements NewsDescService {
    @Autowired
    private TbNewsDescMapper tbNewsDescMapper;

    @Override
    public TbNewsDesc insertNewsDesc(TbNewsDesc tbNewsDesc) {
        if (tbNewsDescMapper.insertSelective(tbNewsDesc) < 1){
            throw  new XmallException("新增新闻详情失败");
        }
        return tbNewsDesc;
    }

    @Override
    public Integer deletById(Integer id) {
        if (tbNewsDescMapper.deleteByPrimaryKey(id) <0) {
            throw  new XmallException("删除新闻详情失败");

        }
        return 0;
    }

    @Override
    public TbNewsDesc updateNewsDesc(TbNewsDesc tbNewsDesc) {
        if (tbNewsDescMapper.updateByPrimaryKeySelective(tbNewsDesc) < 1){
            throw  new XmallException("更新新闻详情失败");

        }
        return tbNewsDesc;
    }

    @Override
    public TbNewsDesc getByNewsId(Integer id) {
        TbNewsDesc tbNewsDesc = tbNewsDescMapper.selectByPrimaryKey(id);
        if (tbNewsDesc ==null){
            throw  new XmallException("获取新闻详情失败");

        }
        return tbNewsDesc;
    }
}
