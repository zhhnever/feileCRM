package com.blacksheep.mtm.service;

import com.blacksheep.mtm.dto.CourseReserveDto;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbCourseReserve;

public interface CourseReserveService {

    /**
     * 根据ID查询
     * @param id
     * @return
     */
    CourseReserveDto getReserveById(Integer id);

    /**
     * 查询所有记录
     * @return
     */
    DataTablesResult getReserveList(int draw, int start, int length, int cid,
                                     String search, String orderCol, String orderDir);

    /**
     * 插入一条记录
     * @param tbCourseReserve
     * @return
     */
    TbCourseReserve insertReserve(TbCourseReserve tbCourseReserve);

    /**
     * 根据主键删除一条记录
     * @param id
     * @return
     */
    int delReserve(Integer id);

    /**
     * 更新一条记录
     * @param tbCourseReserve
     * @return
     */
    TbCourseReserve updateReserve(TbCourseReserve tbCourseReserve);

    /**
     * 批量删除
     * @param ids
     * @return
     */
    int deleteBatch(Integer[] ids);
}
