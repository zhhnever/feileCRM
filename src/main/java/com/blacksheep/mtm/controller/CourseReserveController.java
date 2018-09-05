package com.blacksheep.mtm.controller;

import com.blacksheep.mtm.common.utils.ResultUtil;
import com.blacksheep.mtm.dto.CourseReserveDto;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.common.Result;
import com.blacksheep.mtm.pojo.manager.TbCourseReserve;
import com.blacksheep.mtm.service.CourseReserveService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

@RequestMapping("/reserve")
@RestController
public class CourseReserveController {

    @Autowired
    private CourseReserveService courseReserveService;

    @RequestMapping(value = "/id/{courseId}",method = RequestMethod.GET)
    @ApiOperation(value = "通过ID获取预定")
    public Result<CourseReserveDto> getCourseById(@PathVariable Integer courseId){
        CourseReserveDto courseDto=courseReserveService.getReserveById(courseId);
        return new ResultUtil<CourseReserveDto>().setData(courseDto);
    }

    @RequestMapping(value = "/list/all",method = RequestMethod.GET)
    @ApiOperation("获取预定列表")
    public DataTablesResult getCourseList(int draw, int start, int length, int cid, @RequestParam("search[value]") String search,
                                          @RequestParam("order[0][column]") int orderCol, @RequestParam("order[0][dir]") String orderDir){
        //获取客户端需要排序的列
        String[] cols = {"checkbox","id", "title", "teacher", "date", "status"};
        String orderColumn = cols[orderCol];
        if(orderColumn == null) {
            orderColumn = "createStamp";
        }
        //获取排序方式 默认为desc(asc)
        if(orderDir == null) {

            orderDir = "desc";
        }
        DataTablesResult result=courseReserveService.getReserveList(draw,start,length,cid,search,orderColumn,orderDir);
        return result;
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加预约")
    public Result<TbCourseReserve> addItem(TbCourseReserve tbCourseReserve){
        TbCourseReserve tbCourse=courseReserveService.insertReserve(tbCourseReserve);
        return new ResultUtil<TbCourseReserve>().setData(tbCourse);
    }
    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    @ApiOperation(value = "编辑预约")
    public Result<TbCourseReserve> updateItem(@PathVariable Integer id, TbCourseReserve tbCourseReserve){
        tbCourseReserve.setOrderId(id);
        courseReserveService.updateReserve(tbCourseReserve);
        return new ResultUtil<TbCourseReserve>().setData(tbCourseReserve);
    }

    @RequestMapping(value = "/del/{ids}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除预约")
    public Result<TbCourseReserve> deleteItem(@PathVariable Integer[] ids){
        courseReserveService.deleteBatch(ids);
        return new ResultUtil<TbCourseReserve>().setData(null);
    }
    @RequestMapping(value = "/stu/{stuId}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除预约")
    public DataTablesResult getMyList(@PathVariable Integer stuId){
        DataTablesResult result = new DataTablesResult();
        return result;
    }
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
