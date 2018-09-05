package com.blacksheep.mtm.controller.portal;


import com.blacksheep.mtm.dto.ItemDto;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.service.SSOClassService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@Api(description = "前端API接口")
@RequestMapping("/api")
public class APIControlloer {
    private final static Logger log = LoggerFactory.getLogger(PMemberController.class);

    @Autowired
    SSOClassService ssoClassService;

    @RequestMapping(value = "/class/list",method = RequestMethod.GET)
    @ApiOperation(value = "得到课程列表")
    public DataTablesResult getClassList(HttpSession session,Long cid){
        DataTablesResult dataTablesResult = new DataTablesResult();
        List<ItemDto> list = ssoClassService.getClassList(cid,"created","desc",0);
        return dataTablesResult;
    }
}
