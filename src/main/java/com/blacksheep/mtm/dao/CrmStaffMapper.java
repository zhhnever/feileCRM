package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.manager.CrmStaff;

public interface CrmStaffMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CrmStaff record);

    int insertSelective(CrmStaff record);

    CrmStaff selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CrmStaff record);

    int updateByPrimaryKey(CrmStaff record);
}