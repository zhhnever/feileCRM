package com.blacksheep.mtm.controller;

import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.common.Result;
import com.blacksheep.mtm.pojo.common.ZTreeNode;
import com.blacksheep.mtm.common.utils.ResultUtil;
import com.blacksheep.mtm.pojo.manager.TbItemCat;
import com.blacksheep.mtm.service.NewsCatService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author   Z
 * @date 2017/8/2
 */
@RestController
@Api(description = "新闻分类信息")
public class NewsCatController {

    @Autowired
    private NewsCatService newsCatService;

    @RequestMapping(value = "/news/cat/list",method = RequestMethod.GET)
    @ApiOperation(value = "获取新闻分类列表")
    public DataTablesResult getItemCatList(int draw, int start, int length, int cid, @RequestParam("search[value]") String search,
                                          @RequestParam("order[0][column]") int orderCol, @RequestParam("order[0][dir]") String orderDir){

        DataTablesResult result = new DataTablesResult();

        String[] cols = {"id", "title"};
        String orderColumn = cols[orderCol];
        if(orderColumn == null) {
            orderColumn = "createStamp";
        }
        //获取排序方式 默认为desc(asc)
        if(orderDir == null) {
            orderDir = "desc";
        }
        result = newsCatService.getList(draw,start,length,cid,search,orderColumn,orderDir);
        return result;
    }

//    @RequestMapping(value = "/item/cat/add",method = RequestMethod.POST)
//    @ApiOperation(value = "添加商品分类")
//    public Result<Object> addItemCategory(@ModelAttribute TbItemCat tbItemCat){
//
//        iewsCatService.addItemCat(tbItemCat);
//        return new ResultUtil<Object>().setData(null);
//    }
//
//    @RequestMapping(value = "/item/cat/update",method = RequestMethod.POST)
//    @ApiOperation(value = "编辑商品分类")
//    public Result<Object> updateItemCategory(@ModelAttribute TbItemCat tbItemCat){
//
//        iewsCatService.updateItemCat(tbItemCat);
//        return new ResultUtil<Object>().setData(null);
//    }
//
//    @RequestMapping(value = "/item/cat/del/{id}",method = RequestMethod.DELETE)
//    @ApiOperation(value = "删除商品分类")
//    public Result<Object> deleteItemCategory(@PathVariable Long id){
//
//        iewsCatService.deleteItemCat(id);
//        return new ResultUtil<Object>().setData(null);
//    }
}
