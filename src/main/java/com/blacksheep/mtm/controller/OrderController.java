package com.blacksheep.mtm.controller;

import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.common.Result;
import com.blacksheep.mtm.common.utils.ResultUtil;
import com.blacksheep.mtm.service.OrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author
 */
@RestController
@Api(description= "订单管理")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/order/list",method = RequestMethod.GET)
    @ApiOperation(value = "获取订单列表")
    public DataTablesResult getOrderList(int draw, int start, int length,@RequestParam("search[value]") String search,
                                         @RequestParam("order[0][column]") int orderCol, @RequestParam("order[0][dir]") String orderDir){

        //获取客户端需要排序的列
        String[] cols = {"checkbox","order_id", "payment","shipping_code", "user_id", "buyer_nick", "create_time", "update_time", "payment_time", "close_time","end_time","status"};
        String orderColumn = cols[orderCol];
        //默认排序列
        if(orderColumn == null) {
            orderColumn = "create_time";
        }
        //获取排序方式 默认为desc(asc)
        if(orderDir == null) {
            orderDir = "desc";
        }
        DataTablesResult result= orderService.getOrderList(draw,start,length,search,orderColumn,orderDir);
        return result;
    }

    @RequestMapping(value = "/order/count",method = RequestMethod.GET)
    @ApiOperation(value = "获取订单总数")
    public Result<Object> getOrderCount(){

        Long result=orderService.countOrder();
        return new ResultUtil<Object>().setData(result);
    }

    @RequestMapping(value = "/order/del/{ids}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除订单")
    public Result<Object> getUserInfo(@PathVariable String[] ids){

        for(String id:ids){
            orderService.deleteOrder(id);
        }
        return new ResultUtil<Object>().setData(null);
    }
}
