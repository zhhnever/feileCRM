package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.manager.TbCourseReserve;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbCourseReserveMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(TbCourseReserve record);

    int insertSelective(TbCourseReserve record);

    TbCourseReserve selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(TbCourseReserve record);

    int updateByPrimaryKey(TbCourseReserve record);

    List<TbCourseReserve> selectItemByCondition(@Param("cid") int cid, @Param("search") String search,
                                                @Param("orderCol") String orderCol, @Param("orderDir") String orderDir);

    int deleteBatchById(Integer[] ids);

}