package com.blacksheep.mtm.controller;

import com.blacksheep.mtm.common.utils.ResultUtil;
import com.blacksheep.mtm.pojo.manager.TbAgreement;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.common.Result;
import com.blacksheep.mtm.service.AgreementService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * 合同借口
 */
@RestController
@Api(description = "合同列表信息")
public class AgreementController {
    private final static Logger log= LoggerFactory.getLogger(AgreementController.class);
    
    @Autowired
    AgreementService agreementService;
    
    
    @RequestMapping(value = "/agreement/{itemId}",method = RequestMethod.GET)
    @ApiOperation(value = "通过ID获取合同")
    public Result<TbAgreement> getItemById(@PathVariable Long itemId){

        TbAgreement itemDto=agreementService.getItemById(itemId);
        return new ResultUtil<TbAgreement>().setData(itemDto);
    }

    @RequestMapping(value = "/agreement/list",method = RequestMethod.GET)
    @ApiOperation(value = "分页搜索排序获取合同列表")
    public DataTablesResult getItemList(int draw, int start, int length, int cid, @RequestParam("search[value]") String search,
                                        @RequestParam("order[0][column]") int orderCol, @RequestParam("order[0][dir]") String orderDir,
                                        String searchItem, String minDate, String maxDate){


        //获取客户端需要排序的列
        String[] cols = {"checkbox","id", "name", "identificationNo", "className", "amount", "discount", "pdf", "createTime","updateTime","state"};
        String orderColumn = cols[orderCol];
        if(orderColumn == null) {
            orderColumn = "created";
        }
        //获取排序方式 默认为desc(asc)
        if(orderDir == null) {
            orderDir = "desc";
        }
        DataTablesResult result=agreementService.getItemList(draw,start,length,cid,search,orderColumn,orderDir);
        return result;
    }

    @RequestMapping(value = "/agreement/listSearch",method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页搜索排序获取合同列表")
    public DataTablesResult getItemSearchList(int draw, int start, int length,int cid,String searchKey,String minDate,String maxDate,
                                              @RequestParam("search[value]") String search, @RequestParam("order[0][column]") int orderCol,
                                              @RequestParam("order[0][dir]") String orderDir){

        //获取客户端需要排序的列
        String[] cols = {"checkbox","id", "name", "identificationNo", "className", "amount", "discount", "pdf", "createTime","updateTime","state"};
        //默认排序列
        String orderColumn = cols[orderCol];
        if(orderColumn == null) {
            orderColumn = "created";
        }
        //获取排序方式 默认为desc(asc)
        if(orderDir == null) {
            orderDir = "desc";
        }
        if(!search.isEmpty()){
            searchKey=search;
        }
        DataTablesResult result=agreementService.getItemSearchList(draw,start,length,cid,searchKey,minDate,maxDate,orderColumn,orderDir);
        return result;
    }

    @RequestMapping(value = "/agreement/count",method = RequestMethod.GET)
    @ApiOperation(value = "获得合同总数目")
    public DataTablesResult getAllItemCount(){

        DataTablesResult result=agreementService.getAllItemCount();
        return result;
    }

    @RequestMapping(value = "/agreement/stop/{id}",method = RequestMethod.PUT)
    @ApiOperation(value = "下架合同")
    public Result<TbAgreement> stopItem(@PathVariable Long id){

        TbAgreement tbItem = agreementService.alertItemState(id,0);
        return new ResultUtil<TbAgreement>().setData(tbItem);
    }

    @RequestMapping(value = "/agreement/start/{id}",method = RequestMethod.PUT)
    @ApiOperation(value = "发布合同")
    public Result<TbAgreement> startItem(@PathVariable Long id){

        TbAgreement tbItem = agreementService.alertItemState(id,1);
        return new ResultUtil<TbAgreement>().setData(tbItem);
    }

    @RequestMapping(value = "/agreement/del/{ids}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除合同")
    public Result<TbAgreement> deleteItem(@PathVariable Long[] ids){

        for(Long id:ids){
            agreementService.deleteItem(id);
        }
        return new ResultUtil<TbAgreement>().setData(null);
    }

    @RequestMapping(value = "/agreement/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加合同")
    public Result<TbAgreement> addItem(TbAgreement itemDto){
        TbAgreement tbItem=agreementService.addItem(itemDto);
        return new ResultUtil<TbAgreement>().setData(tbItem);
    }

    @RequestMapping(value = "/agreement/update/{id}",method = RequestMethod.POST)
    @ApiOperation(value = "编辑合同")
    public Result<TbAgreement> updateItem(@PathVariable Long id, TbAgreement itemDto){

        TbAgreement tbItem=agreementService.updateItem(id,itemDto);
        return new ResultUtil<TbAgreement>().setData(tbItem);
    }

//    @RequestMapping(value = "/item/importIndex",method = RequestMethod.GET)
//    @ApiOperation(value = "导入合同索引至ES")
//    public Result<Object> importIndex(){
//        searchItemService.importAllItems();
//        return new ResultUtil<Object>().setData(null);
//    }
//
//    @RequestMapping(value = "/es/getInfo",method = RequestMethod.GET)
//    @ApiOperation(value = "获取ES信息")
//    public Result<Object> getESInfo(){
//        EsInfo esInfo=searchItemService.getEsInfo();
//        return new ResultUtil<Object>().setData(esInfo);
//    }
}
