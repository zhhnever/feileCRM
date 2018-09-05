package com.blacksheep.mtm.controller;


import com.blacksheep.mtm.common.utils.ResultUtil;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.common.Result;
import com.blacksheep.mtm.pojo.manager.TbMemberQuestion;
import com.blacksheep.mtm.service.MemberQuestionService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("memberquestion")
public class MemberQuestionController {

    private MemberQuestionService memberQuestionService;

    @RequestMapping(value = "/id/{questionId}",method = RequestMethod.GET)
    @ApiOperation(value = "通过ID获取问题")
    public Result<TbMemberQuestion> getCourseById(@PathVariable Integer questionId){
        TbMemberQuestion tbMemberQuestion= memberQuestionService.getQuestionById(questionId);
        return new ResultUtil<TbMemberQuestion>().setData(tbMemberQuestion);
    }

    @RequestMapping(value = "/list/all",method = RequestMethod.GET)
    @ApiOperation(value = "通过ID获取问题")
    public DataTablesResult getQuestionList(int draw, int start, int length, int cid, @RequestParam("search[value]") String search,
                                            @RequestParam("order[0][column]") int orderCol, @RequestParam("order[0][dir]") String orderDir){
        String[] cols = {"checkbox","id", "title"};
        String orderColumn = cols[orderCol];
        if(orderColumn == null) {
            orderColumn = "createStamp";
        }
        //获取排序方式 默认为desc(asc)
        if(orderDir == null) {
            orderDir = "desc";
        }
        DataTablesResult result= memberQuestionService.getQuestionList(draw,start,length,cid,search,orderColumn,orderDir);
        return result;
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加商品")
    public Result<TbMemberQuestion> addItem(TbMemberQuestion tbMemberQuestion){
        TbMemberQuestion tbCourse= memberQuestionService.insertQuestion(tbMemberQuestion);
        return new ResultUtil<TbMemberQuestion>().setData(tbCourse);
    }


    @RequestMapping(value = "/del/{ids}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除商品")
    public Result<TbMemberQuestion> deleteItem(@PathVariable Integer[] ids){
        memberQuestionService.deleteBatch(ids);
        return new ResultUtil<TbMemberQuestion>().setData(null);
    }
    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    @ApiOperation(value = "编辑商品")
    public Result<TbMemberQuestion> updateItem(@PathVariable Integer id, TbMemberQuestion tbMemberQuestion){

        TbMemberQuestion TbCourse= memberQuestionService.updateQuestion(tbMemberQuestion);
        return new ResultUtil<TbMemberQuestion>().setData(TbCourse);
    }
}
