package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.TbCCAssign;

import java.util.List;

public interface TbCCAssignMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbCCAssign record);

    int insertSelective(TbCCAssign record);

    TbCCAssign selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbCCAssign record);

    int updateByPrimaryKey(TbCCAssign record);

    List<TbCCAssign> selectListByCCIdToday(Integer ccId);

    Integer countByCCIdToday(Integer ccId);
}