package com.blacksheep.mtm.service;

import com.blacksheep.mtm.dto.NewsDto;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbNews;

public interface NewsService {
    /**
     * 通过ID获取新闻包含详情
     * @param itemId
     * @return
     */
    NewsDto getItemById(Integer itemId);

    /**
     * 通过ID获取不包含详情
     * @param id
     * @return
     */
    NewsDto getNormalItemById(Integer id);

    /**
     * 分页搜索排序获取新闻列表
     * @param draw
     * @param start
     * @param length
     * @param cid
     * @param search
     * @param orderCol
     * @param orderDir
     * @return
     */
    DataTablesResult getItemList(int draw, int start, int length, int cid,
                                 String search, String orderCol, String orderDir);

    /**
     * 多条件查询获取新闻列表
     * @param draw
     * @param start
     * @param length
     * @param cid
     * @param search
     * @param minDate
     * @param maxDate
     * @param orderCol
     * @param orderDir
     * @return
     */
    DataTablesResult getItemSearchList(int draw,int start,int length,int cid,
                                       String search,String minDate,String maxDate,
                                       String orderCol,String orderDir);

    /**
     * 获取新闻总数
     * @return
     */
    DataTablesResult getAllItemCount();

    /**
     * 修改新闻状态
     * @param id
     * @param state
     * @return
     */
    TbNews alertItemState(Integer id,byte state);

    /**
     * 彻底删除新闻
     * @param id
     * @return
     */
    int deleteItem(Integer id);

    /**
     * 添加新闻
     * @param itemDto
     * @return
     */
    NewsDto addItem(NewsDto itemDto);

    /**
     * 更新新闻
     * @param id
     * @param itemDto
     * @return
     */
    TbNews updateItem(Integer id,TbNews itemDto);

    /**
     * 批量删除
     * @param ids
     * @return
     */
    int deleteBatch(Integer[] ids);
}
