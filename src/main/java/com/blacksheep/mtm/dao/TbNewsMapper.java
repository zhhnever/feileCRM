package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbNews;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbNewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbNews record);

    int insertSelective(TbNews record);

    TbNews selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbNews record);

    int updateByPrimaryKeyWithBLOBs(TbNews record);

    int updateByPrimaryKey(TbNews record);

    List<TbNews> selectItemByCondition(@Param("cid") int cid,@Param("search") String search,
                                       @Param("orderCol") String orderCol,@Param("orderDir") String orderDir);
    int deleteBatchById(Integer[] ids);
}