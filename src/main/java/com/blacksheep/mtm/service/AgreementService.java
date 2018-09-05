package com.blacksheep.mtm.service;

import com.blacksheep.mtm.pojo.manager.TbAgreement;
import com.blacksheep.mtm.pojo.common.DataTablesResult;

public interface AgreementService {


    /**
     * 通过ID获取合同包含详情
     * @param itemId
     * @return
     */
    TbAgreement getItemById(Long itemId);

    /**
     * 通过ID获取不包含详情
     * @param id
     * @return
     */
    TbAgreement getNormalItemById(Long id);

    /**
     * 分页搜索排序获取合同列表
     * @param draw
     * @param start
     * @param length
     * @param cid
     * @param search
     * @param orderCol
     * @param orderDir
     * @return
     */
    DataTablesResult getItemList(int draw, int start, int length, int cid,
                                 String search, String orderCol, String orderDir);

    /**
     * 多条件查询获取合同列表
     * @param draw
     * @param start
     * @param length
     * @param cid
     * @param search
     * @param minDate
     * @param maxDate
     * @param orderCol
     * @param orderDir
     * @return
     */
    DataTablesResult getItemSearchList(int draw,int start,int length,int cid,
                                       String search,String minDate,String maxDate,
                                       String orderCol,String orderDir);

    /**
     * 获取合同总数
     * @return
     */
    DataTablesResult getAllItemCount();

    /**
     * 修改合同状态
     * @param id
     * @param state
     * @return
     */
    TbAgreement alertItemState(Long id,Integer state);

    /**
     * 彻底删除合同
     * @param id
     * @return
     */
    int deleteItem(Long id);

    /**
     * 添加合同
     * @param tbAgreement
     * @return
     */
    TbAgreement addItem(TbAgreement tbAgreement);

    /**
     * 更新合同
     * @param id
     * @param tbAgreement
     * @return
     */
    TbAgreement updateItem(Long id,TbAgreement tbAgreement);
}
