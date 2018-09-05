package com.blacksheep.mtm.service.Impl;

import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.dao.TbMemberFllowMapper;
import com.blacksheep.mtm.dto.MemberFllowDto;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbMemberFllow;
import com.blacksheep.mtm.service.MemberFllowService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberFllowSerivceImpl implements MemberFllowService {

    final static Logger log= LoggerFactory.getLogger(MemberFllowSerivceImpl.class);
    @Autowired
    TbMemberFllowMapper tbMemberFllowMapper;

    @Override
    public DataTablesResult getListByUser(Integer userId,int draw, int start, int length,String orderCol, String orderDir) {
        DataTablesResult result = new DataTablesResult();
        PageHelper.startPage(start/length+1,length);
        List<MemberFllowDto> list = tbMemberFllowMapper.selectListByUserId(userId,orderCol,orderDir);
        PageInfo<MemberFllowDto> pageInfo=new PageInfo<>(list);
        result.setRecordsFiltered((int)pageInfo.getTotal());
        result.setRecordsTotal((int)pageInfo.getTotal());
        result.setDraw(draw);
        result.setData(list);
        result.setSuccess(true);

        return result;
    }

    @Override
    public TbMemberFllow getById(Integer id) {
         TbMemberFllow result =  tbMemberFllowMapper.selectByPrimaryKey(id);
         if (result == null){
             throw new XmallException("跟进记录不存在");
         }
        return result;
    }

    @Override
    public Integer batchDeletByIds(Integer[] ids) {
        return null;
    }

    @Override
    public TbMemberFllow insert(TbMemberFllow tbMemberFllow) {
        if (tbMemberFllow.getmId() == null){
            log.error("新增失败,缺少会员id");
            throw new XmallException("新增失败,缺少会员id");
        }
        int result = tbMemberFllowMapper.insertSelective(tbMemberFllow);
        if (result <= 0){
            throw new XmallException("新增失败");
        }
        log.info("新增跟进记录成功");
        return tbMemberFllow;
    }

    @Override
    public TbMemberFllow updateById(TbMemberFllow tbMemberFllow) {
        int result = tbMemberFllowMapper.updateByPrimaryKeySelective(tbMemberFllow);
        if (result <=0){
            throw new XmallException("更新失败");
        }
        return tbMemberFllow;
    }

    @Override
    public DataTablesResult getAllList(int draw, int start, int length, String search, String minDate, String maxDate, String orderCol, String orderDir) {
        DataTablesResult result = new DataTablesResult();
        PageHelper.startPage(start/length+1,length);
        List<MemberFllowDto> list = tbMemberFllowMapper.selectItemByCondition("%"+search+"%",orderCol,orderDir);
        PageInfo<MemberFllowDto> pageInfo=new PageInfo<>(list);
        result.setRecordsFiltered((int)pageInfo.getTotal());
        result.setRecordsTotal((int)pageInfo.getTotal());
        result.setDraw(draw);
        result.setData(list);
        result.setSuccess(true);
        return result;
    }
}
