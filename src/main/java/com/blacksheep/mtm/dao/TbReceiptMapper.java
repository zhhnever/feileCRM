package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.TbReceipt;
import com.blacksheep.mtm.pojo.TbReceiptExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbReceiptMapper {
    long countByExample(TbReceiptExample example);

    int deleteByExample(TbReceiptExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TbReceipt record);

    int insertSelective(TbReceipt record);

    List<TbReceipt> selectByExample(TbReceiptExample example);

    TbReceipt selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TbReceipt record, @Param("example") TbReceiptExample example);

    int updateByExample(@Param("record") TbReceipt record, @Param("example") TbReceiptExample example);

    int updateByPrimaryKeySelective(TbReceipt record);

    int updateByPrimaryKey(TbReceipt record);
}