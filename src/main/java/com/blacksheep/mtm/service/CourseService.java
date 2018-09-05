package com.blacksheep.mtm.service;

import com.blacksheep.mtm.dto.CourseDto;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbCourse;

/**
 * 
 *
 */
public interface CourseService {

    /**
     * 通过ID获取课程包含详情
     * @param itemId
     * @return
     */
    CourseDto getItemById(Integer itemId);

    /**
     * 通过ID获取不包含详情
     * @param id
     * @return
     */
    TbCourse getNormalItemById(Integer id);

    /**
     * 分页搜索排序获取课程列表
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
                                 String username ,String search, String orderCol, String orderDir);

    /**
     * 多条件查询获取课程列表
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
     * 获取课程总数
     * @return
     */
    DataTablesResult getAllItemCount();

    /**
     * 修改课程状态
     * @param id
     * @param state
     * @return
     */
    TbCourse alertItemState(Integer id,byte state);

    /**
     * 彻底删除课程
     * @param id
     * @return
     */
    int deleteItem(Integer id);

    /**
     * 添加课程
     * @param itemDto
     * @return
     */
    TbCourse addItem(CourseDto itemDto);

    /**
     * 更新课程
     * @param id
     * @param itemDto
     * @return
     */
    TbCourse updateItem(Integer id,CourseDto itemDto);

    /**
     * 批量删除
     * @param ids
     * @return
     */
    int deleteBatch(Integer[] ids);
}
