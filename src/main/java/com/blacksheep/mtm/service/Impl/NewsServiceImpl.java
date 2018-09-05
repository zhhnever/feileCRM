package com.blacksheep.mtm.service.Impl;

import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.dao.TbNewsCatMapper;
import com.blacksheep.mtm.dao.TbNewsDescMapper;
import com.blacksheep.mtm.dao.TbNewsMapper;
import com.blacksheep.mtm.dao.TbUserMapper;
import com.blacksheep.mtm.dto.DtoUtil;
import com.blacksheep.mtm.dto.NewsDto;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbNews;
import com.blacksheep.mtm.pojo.manager.TbNewsCat;
import com.blacksheep.mtm.pojo.manager.TbNewsDesc;
import com.blacksheep.mtm.pojo.manager.TbUser;
import com.blacksheep.mtm.service.NewsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private TbNewsMapper tbNewsMapper;
    @Autowired
    private TbUserMapper tbUserMapper;
    @Autowired
    private TbNewsCatMapper tbNewsCatMapper;
    @Autowired
    private TbNewsDescMapper tbNewsDescMapper;
    @Override

    public NewsDto getItemById(Integer itemId) {
        NewsDto newsDto = getNormalItemById(itemId);
        TbNewsDesc tbNewsDesc = tbNewsDescMapper.selectByPrimaryKey(itemId);
        if (tbNewsDesc!=null){
            newsDto.setDetail(tbNewsDesc.getNewsDesc());
        }
        return newsDto;
    }

    @Override
    public NewsDto getNormalItemById(Integer id) {
        TbNews tbNews = tbNewsMapper.selectByPrimaryKey(id);
        if (tbNews == null){
            throw new XmallException("新闻不存在");
        }
        NewsDto newsDto = DtoUtil.TbNews2NewsDto(tbNews);

        TbUser user = tbUserMapper.selectByPrimaryKey(tbNews.getAuthorId());
        if (user !=null){
            newsDto.setAuthor(user.getUsername());
        }

        TbNewsCat tbNewsCat = tbNewsCatMapper.selectByPrimaryKey(tbNews.getCid());
        if (tbNewsCat!=null){
            newsDto.setCatTitle(tbNewsCat.getTitle());
        }
        return newsDto;
    }

    @Override
    public DataTablesResult getItemList(int draw, int start, int length, int cid, String search, String orderCol, String orderDir) {
        DataTablesResult result = new DataTablesResult();

        //分页执行查询返回结果
        PageHelper.startPage(start/length+1,length);
        List<TbNews> list = tbNewsMapper.selectItemByCondition(cid,"%"+search+"%",orderCol,orderDir);
        PageInfo<TbNews> pageInfo=new PageInfo<>(list);
        result.setRecordsFiltered((int)pageInfo.getTotal());
        result.setRecordsTotal((int)pageInfo.getTotal());
        result.setDraw(draw);
        result.setData(list);

        return result;
    }

    @Override
    public DataTablesResult getItemSearchList(int draw, int start, int length, int cid, String search, String minDate, String maxDate, String orderCol, String orderDir) {
        return null;
    }

    @Override
    public DataTablesResult getAllItemCount() {
        return null;
    }

    @Override
    public TbNews alertItemState(Integer id, byte state) {
        return null;
    }

    @Override
    public int deleteItem(Integer id) {

        if(tbNewsMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除新闻失败");
        }
        return 0;
    }

    @Override
    @Transactional
    public NewsDto addItem(NewsDto newsDto) {
        TbNews tbNews = DtoUtil.NewsDto2TbNews(newsDto);
        int id = tbNewsMapper.insert(tbNews);
        TbNewsDesc  newsDesc = new TbNewsDesc(tbNews.getId(),new Date(),new Date(),newsDto.getDetail());
        int newsDetailId = tbNewsDescMapper.insertSelective(newsDesc);
        if(id <=0 || newsDetailId <=0){
            throw new XmallException("添加新闻失败");
        }
        return newsDto;
    }

    @Override
    public TbNews updateItem(Integer id, TbNews itemDto) {
        if(tbNewsMapper.updateByPrimaryKeySelective(itemDto)!=1){
            throw new XmallException("更新课程失败");
        }
        return itemDto;
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        int result = tbNewsMapper.deleteBatchById(ids);
        if(result!=ids.length){
            throw new XmallException("删除课程失败");
        }
        return 0;
    }
}
