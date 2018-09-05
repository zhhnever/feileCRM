package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.manager.TbNewsDesc;

public interface TbNewsDescMapper {
    int deleteByPrimaryKey(Integer newsId);

    int insert(TbNewsDesc record);

    int insertSelective(TbNewsDesc record);

    TbNewsDesc selectByPrimaryKey(Integer newsId);

    int updateByPrimaryKeySelective(TbNewsDesc record);

    int updateByPrimaryKeyWithBLOBs(TbNewsDesc record);

    int updateByPrimaryKey(TbNewsDesc record);
}