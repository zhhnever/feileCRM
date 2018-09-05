package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.dto.MemberFllowDto;
import com.blacksheep.mtm.pojo.manager.TbMemberFllow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbMemberFllowMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbMemberFllow record);

    int insertSelective(TbMemberFllow record);

    TbMemberFllow selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbMemberFllow record);

    int updateByPrimaryKeyWithBLOBs(TbMemberFllow record);

    int updateByPrimaryKey(TbMemberFllow record);

    List<MemberFllowDto> selectListByUserId(@Param("userId") Integer userId, @Param("orderCol") String orderCol,
                                            @Param("orderDir") String orderDir);

    List<MemberFllowDto> selectItemByCondition(@Param("search") String search,@Param("orderCol") String orderCol,
                                              @Param("orderDir") String orderDir);
}