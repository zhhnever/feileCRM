package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.manager.TbContract;

public interface TbContractMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbContract record);

    int insertSelective(TbContract record);

    TbContract selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbContract record);

    int updateByPrimaryKey(TbContract record);
}