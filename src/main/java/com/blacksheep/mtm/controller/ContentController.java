package com.blacksheep.mtm.controller;

import com.blacksheep.mtm.dto.NewsDto;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.common.Result;
import com.blacksheep.mtm.common.utils.ResultUtil;
import com.blacksheep.mtm.pojo.manager.TbNews;
import com.blacksheep.mtm.service.ContentService;
import com.blacksheep.mtm.pojo.manager.TbPanelContent;
import com.blacksheep.mtm.service.NewsDescService;
import com.blacksheep.mtm.service.NewsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author
 */
@RestController
@Api(description = "板块内容管理")
@RequestMapping("/content")
public class ContentController {

    final static Logger log= LoggerFactory.getLogger(ContentController.class);

    @Autowired
    private ContentService contentService;

    @Autowired
    private NewsDescService newsDescService;

    @Autowired
    private NewsService newsService;
    @RequestMapping(value = "/list/{panelId}",method = RequestMethod.GET)
    @ApiOperation(value = "通过panelId获得板块内容列表")
    public DataTablesResult getContentByCid(@PathVariable int panelId){

        DataTablesResult result=contentService.getPanelContentListByPanelId(panelId);
        return result;
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加板块内容")
    public Result<Object> addContent(@ModelAttribute TbPanelContent tbPanelContent){

        contentService.addPanelContent(tbPanelContent);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ApiOperation(value = "编辑板块内容")
    public Result<Object> updateContent(@ModelAttribute TbPanelContent tbPanelContent){

        contentService.updateContent(tbPanelContent);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/del/{ids}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除板块内容")
    public Result<Object> addContent(@PathVariable int[] ids){

        for(int id:ids){
            contentService.deletePanelContent(id);
        }
        return new ResultUtil<Object>().setData(null);
    }



    @RequestMapping(value = "/news/list/all",method = RequestMethod.GET)
    @ApiOperation("获取新闻列表")
    public DataTablesResult getNewsList(int draw, int start, int length, int cid, @RequestParam("search[value]") String search,
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
        result = newsService.getItemList(draw,start,length,cid,search,orderColumn,orderDir);
        return result;
    }

    @RequestMapping(value = "/news/del/{ids}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除新闻")
    public Result<TbNews> deleteItem(@PathVariable Integer[] ids){
        newsService.deleteBatch(ids);
        return new ResultUtil<TbNews>().setData(null);
    }

    @RequestMapping(value = "/news/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加新闻")
    public Result<NewsDto> addItem(NewsDto courseDto){
        NewsDto tbCourse=newsService.addItem(courseDto);
        return new ResultUtil<NewsDto>().setData(tbCourse);
    }
    @RequestMapping(value = "/news/update/{id}",method = RequestMethod.POST)
    @ApiOperation(value = "编辑新闻")
    public Result<TbNews> updateItem(@PathVariable Integer id, TbNews courseDto){

        TbNews TbCourse=newsService.updateItem(id,courseDto);
        return new ResultUtil<TbNews>().setData(TbCourse);
    }

    @RequestMapping(value = "/news/detail/{id}",method = RequestMethod.GET)
    @ApiOperation(value = "获得新闻和新闻详情")
    public Result<NewsDto> getNewsById(@PathVariable Integer id){
        NewsDto newsDto=newsService.getItemById(id);
        return new ResultUtil<NewsDto>().setData(newsDto);
    }

}
