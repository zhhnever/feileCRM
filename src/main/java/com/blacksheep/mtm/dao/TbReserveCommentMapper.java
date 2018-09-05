package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.manager.TbReserveComment;
import com.blacksheep.mtm.pojo.manager.TbReserveCommentWithBLOBs;

public interface TbReserveCommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbReserveCommentWithBLOBs record);

    int insertSelective(TbReserveCommentWithBLOBs record);

    TbReserveCommentWithBLOBs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbReserveCommentWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(TbReserveCommentWithBLOBs record);

    int updateByPrimaryKey(TbReserveComment record);
}