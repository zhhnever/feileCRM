package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.manager.TbUser;
import com.blacksheep.mtm.pojo.manager.TbUserExample;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

public interface TbUserMapper {
    long countByExample(TbUserExample example);

    int deleteByExample(TbUserExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbUser record);

    int insertSelective(TbUser record);

    List<TbUser> selectByExample(TbUserExample example);

    TbUser selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbUser record, @Param("example") TbUserExample example);

    int updateByExample(@Param("record") TbUser record, @Param("example") TbUserExample example);

    int updateByPrimaryKeySelective(TbUser record);

    int updateByPrimaryKey(TbUser record);

    Set<String> getRoles(@Param("username") String username);

    Set<String> getPermissions(@Param("username") String username);

    List<String> getPermsByRoleId(@Param("id") int id);

    Long getUserIdByUsername(String username);
}