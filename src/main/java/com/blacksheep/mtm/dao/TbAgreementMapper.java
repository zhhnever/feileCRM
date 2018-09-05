package com.blacksheep.mtm.dao;

import com.blacksheep.mtm.pojo.manager.TbAgreement;
import com.blacksheep.mtm.pojo.manager.TbAgreementExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbAgreementMapper {
    long countByExample(TbAgreementExample example);

    int deleteByExample(TbAgreementExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbAgreement record);

    int insertSelective(TbAgreement record);

    List<TbAgreement> selectByExample(TbAgreementExample example);

    TbAgreement selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbAgreement record, @Param("example") TbAgreementExample example);

    int updateByExample(@Param("record") TbAgreement record, @Param("example") TbAgreementExample example);

    int updateByPrimaryKeySelective(TbAgreement record);

    int updateByPrimaryKey(TbAgreement record);


    List<TbAgreement> selectItemByCondition(@Param("cid") int cid,@Param("search") String search,
                                       @Param("orderCol") String orderCol,@Param("orderDir") String orderDir);

    List<TbAgreement> selectItemByMultiCondition(@Param("cid") int cid,@Param("search") String search,@Param("minDate") String minDate,
                                            @Param("maxDate") String maxDate,@Param("orderCol") String orderCol,
                                            @Param("orderDir") String orderDir);

    List<TbAgreement> selectItemFront(@Param("cid") Long cid,
                                 @Param("orderCol") String orderCol,@Param("orderDir") String orderDir,
                                 @Param("priceGt") int priceGt,@Param("priceLte") int priceLte);
}