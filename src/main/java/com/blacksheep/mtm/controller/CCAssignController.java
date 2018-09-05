package com.blacksheep.mtm.controller;


import com.blacksheep.mtm.common.utils.IDUtil;
import com.blacksheep.mtm.common.utils.ResultUtil;
import com.blacksheep.mtm.dto.CCAssignDto;
import com.blacksheep.mtm.pojo.TbCCAssign;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.common.Result;
import com.blacksheep.mtm.service.CCAssignService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.DatabaseMetaData;
import java.util.List;

@RestController
@Api(description = "板块内容管理")
@RequestMapping("/cc")
public class CCAssignController {

    final static Logger log= LoggerFactory.getLogger(ContentController.class);

    @Autowired
    private CCAssignService ccAssignService;

    @RequestMapping(value = "/list/default",method = RequestMethod.GET)
    @ApiOperation("默认获取当天CC分配的情况")
    public DataTablesResult getCCAssignListToday(){
        DataTablesResult dataTablesResult = new DataTablesResult();
        List<CCAssignDto> list = ccAssignService.getALLList();
        dataTablesResult.setData(list);
        return dataTablesResult;
    }
    @RequestMapping(value = "/insert/{ccid}",method = RequestMethod.POST)
    @ApiOperation("新增CC分配")
    public Result<TbCCAssign> insert(@PathVariable Integer ccid){
        Result<TbCCAssign> result = new Result<>();
        TbCCAssign tbCCAssign = new TbCCAssign();
        tbCCAssign.setState(1);
        tbCCAssign.setCcId(ccid);
        long id= IDUtil.getRandomId();
        tbCCAssign.setId((int)id);
        ccAssignService.insert(tbCCAssign);
        return new ResultUtil<TbCCAssign>().setData(tbCCAssign);
    }
    @RequestMapping(value = "/stop/{id}",method = RequestMethod.POST)
    @ApiOperation("完成接待,改变状态")
    public Result<TbCCAssign> updateState(@PathVariable Integer id,@RequestParam int state){
        TbCCAssign tbCCAssign =  ccAssignService.updateState(id,state);
        return new ResultUtil<TbCCAssign>().setData(tbCCAssign);
    }
}
