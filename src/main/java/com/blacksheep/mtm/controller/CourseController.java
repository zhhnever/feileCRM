package com.blacksheep.mtm.controller;

import com.blacksheep.mtm.common.utils.ResultUtil;
import com.blacksheep.mtm.dto.CourseDto;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.common.Result;
import com.blacksheep.mtm.pojo.manager.TbCourse;
import com.blacksheep.mtm.service.CourseService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@RequestMapping("/course")
@RestController
@Api(description = "课程排期")
public class CourseController {

    private final static Logger log= LoggerFactory.getLogger(ItemController.class);

    @Autowired
    private CourseService courseService;


    @RequestMapping(value = "/id/{courseId}",method = RequestMethod.GET)
    @ApiOperation(value = "通过ID获取课程")
    public Result<CourseDto> getCourseById(@PathVariable Integer courseId){
        CourseDto courseDto=courseService.getItemById(courseId);
        return new ResultUtil<CourseDto>().setData(courseDto);
    }

    @RequestMapping(value = "/list/all",method = RequestMethod.GET)
    @ApiOperation("获取课程列表")
    public DataTablesResult getCourseList(int draw, int start, int length, int cid, @RequestParam("search[value]") String search,
                                          @RequestParam("order[0][column]") int orderCol, @RequestParam("order[0][dir]") String orderDir){
        //获取客户端需要排序的列
        String[] cols = {"checkbox","id", "teacher", "date", "status"};
        String orderColumn = cols[orderCol];
        if(orderColumn == null) {
            orderColumn = "createStamp";
        }
        //获取排序方式 默认为desc(asc)
        if(orderDir == null) {
            orderDir = "desc";
        }
        String username= SecurityUtils.getSubject().getPrincipal().toString();
        DataTablesResult result=courseService.getItemList(draw,start,length,cid,username,search,orderColumn,orderDir);
        return result;
    }


    @RequestMapping(value = "/listSearch",method = RequestMethod.GET)
    @ApiOperation("获取课程列表")
    public DataTablesResult getCourseListSearch(int draw, int start, int length, int cid, @RequestParam("search[value]") String search,
                                          @RequestParam("order[0][column]") int orderCol, @RequestParam("order[0][dir]") String orderDir){
        return null;
    }
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加商品")
    @ResponseBody
    public Result<TbCourse> addItem(CourseDto courseDto){
        TbCourse tbCourse=courseService.addItem(courseDto);
        return new ResultUtil<TbCourse>().setData(tbCourse);
    }
    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    @ApiOperation(value = "编辑商品")
    public Result<TbCourse> updateItem(@PathVariable Integer id, CourseDto courseDto){

        TbCourse TbCourse=courseService.updateItem(id,courseDto);
        return new ResultUtil<TbCourse>().setData(TbCourse);
    }
    @RequestMapping(value = "/stop/{id}",method = RequestMethod.PUT)
    @ApiOperation(value = "下架商品")
    public Result<TbCourse> stopItem(@PathVariable Integer id){

        TbCourse TbCourse = courseService.alertItemState(id,(byte) 0);
        return new ResultUtil<TbCourse>().setData(TbCourse);
    }

    @RequestMapping(value = "/start/{id}",method = RequestMethod.PUT)
    @ApiOperation(value = "发布商品")
    public Result<TbCourse> startItem(@PathVariable Integer id){
        TbCourse TbCourse = courseService.alertItemState(id,(byte) 1);
        return new ResultUtil<TbCourse>().setData(TbCourse);
    }

    @RequestMapping(value = "/del/{ids}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除商品")
    public Result<TbCourse> deleteItem(@PathVariable Integer[] ids){
        courseService.deleteBatch(ids);
        return new ResultUtil<TbCourse>().setData(null);
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


}
