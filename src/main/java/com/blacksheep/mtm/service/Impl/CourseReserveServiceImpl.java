package com.blacksheep.mtm.service.Impl;

import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.dao.TbCourseMapper;
import com.blacksheep.mtm.dao.TbCourseReserveMapper;
import com.blacksheep.mtm.dao.TbMemberMapper;
import com.blacksheep.mtm.dto.CourseReserveDto;
import com.blacksheep.mtm.dto.DtoUtil;
import com.blacksheep.mtm.dto.front.Member;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbCourse;
import com.blacksheep.mtm.pojo.manager.TbCourseReserve;
import com.blacksheep.mtm.pojo.manager.TbMember;
import com.blacksheep.mtm.service.CourseReserveService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CourseReserveServiceImpl implements CourseReserveService{

    @Autowired
    private TbCourseReserveMapper tbCourseReserveMapper;
    @Autowired
    private TbMemberMapper tbMemberMapper;
    @Autowired
    private TbCourseMapper tbCourseMapper;

    @Override
    public CourseReserveDto getReserveById(Integer id) {
        TbCourseReserve tbCourseReserve = tbCourseReserveMapper.selectByPrimaryKey(id);
        if (tbCourseReserve ==null){
            return null;
        }
        CourseReserveDto courseReserveDto = DtoUtil.Reserve2ReserveDto(tbCourseReserve);
        TbMember member = tbMemberMapper.selectByPrimaryKey(courseReserveDto.getStuId());
        if (member != null){
            courseReserveDto.setStuName(member.getUsername());
        }
        return courseReserveDto;
    }

    @Override
    public DataTablesResult getReserveList(int draw, int start, int length, int cid, String search, String orderCol, String orderDir) {
        //分页执行查询返回结果
        DataTablesResult result = new DataTablesResult();

        PageHelper.startPage(start/length+1,length);
        List<TbCourseReserve> list = tbCourseReserveMapper.selectItemByCondition(cid,"%"+search+"%",orderCol,orderDir);
        PageInfo<TbCourseReserve> pageInfo=new PageInfo<>(list);
        result.setRecordsFiltered((int)pageInfo.getTotal());
        result.setRecordsTotal((int)pageInfo.getTotal());
        result.setDraw(draw);
        result.setData(list);

        return result;
    }

    @Override
    public TbCourseReserve insertReserve(TbCourseReserve tbCourseReserve) {
        int result = tbCourseReserveMapper.insertSelective(tbCourseReserve);
        if (result<1){
            throw new XmallException("预订失败");
        }
        return tbCourseReserve;
    }

    @Override
    public int delReserve(Integer id) {
        int result = tbCourseReserveMapper.deleteByPrimaryKey(id);
        if (result<1){
            throw new XmallException("删除失败");
        }
        return 0;
    }

    @Override
    public TbCourseReserve updateReserve(TbCourseReserve tbCourseReserve) {
        int result = tbCourseReserveMapper.updateByPrimaryKeySelective(tbCourseReserve);
        if (result<1){
            throw new XmallException("更新失败");
        }
        return tbCourseReserve;
    }

    @Override
    @Transactional
    public int deleteBatch(Integer[] ids) {
        int result = tbCourseReserveMapper.deleteBatchById(ids);
        if(result!=ids.length){
            throw new XmallException("删除课程失败");
        }
        return 0;
    }
}
