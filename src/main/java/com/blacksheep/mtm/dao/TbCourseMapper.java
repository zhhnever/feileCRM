package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.manager.TbCourse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbCourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbCourse record);

    int insertSelective(TbCourse record);

    TbCourse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbCourse record);

    int updateByPrimaryKey(TbCourse record);

    List<TbCourse> selectItemByCondition(@Param("cid") int cid,@Param("userId") Long userId ,@Param("search") String search,
                                       @Param("orderCol") String orderCol, @Param("orderDir") String orderDir);

    List<TbCourse> selectItemByMultiCondition(@Param("cid") int cid,@Param("search") String search,@Param("minDate") String minDate,
                                            @Param("maxDate") String maxDate,@Param("orderCol") String orderCol,
                                            @Param("orderDir") String orderDir);

    int deleteBatchById(Integer[] ids);
}