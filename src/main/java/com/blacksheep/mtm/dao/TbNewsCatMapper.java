package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.manager.TbNewsCat;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbNewsCatMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbNewsCat record);

    int insertSelective(TbNewsCat record);

    TbNewsCat selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbNewsCat record);

    int updateByPrimaryKey(TbNewsCat record);

    List<TbNewsCat> selectItemByCondition(@Param("cid") int cid, @Param("search") String search,
                                          @Param("orderCol") String orderCol, @Param("orderDir") String orderDir);
}