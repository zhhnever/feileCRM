package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.manager.TbMemberQuestion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbMemberQuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbMemberQuestion record);

    int insertSelective(TbMemberQuestion record);

    TbMemberQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbMemberQuestion record);

    int updateByPrimaryKey(TbMemberQuestion record);

    List<TbMemberQuestion> selectItemByCondition(@Param("cid") int cid, @Param("search") String search,
                                         @Param("orderCol") String orderCol, @Param("orderDir") String orderDir);

    int deleteBatchById(Integer[] ids);
}