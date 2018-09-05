package com.blacksheep.mtm.service.Impl;

import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.common.utils.RoleEnum;
import com.blacksheep.mtm.dao.TbCCAssignMapper;
import com.blacksheep.mtm.dao.TbUserMapper;
import com.blacksheep.mtm.dto.CCAssignDto;
import com.blacksheep.mtm.pojo.TbCCAssign;
import com.blacksheep.mtm.pojo.manager.TbUser;
import com.blacksheep.mtm.pojo.manager.TbUserExample;
import com.blacksheep.mtm.service.CCAssignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CCAssignServiceImpl implements CCAssignService {

    @Autowired
    TbUserMapper tbUserMapper;
    @Autowired
    TbCCAssignMapper tbCCAssignMapper;

    @Override
    public List<CCAssignDto> getALLList() {
        TbUserExample tbUserExample = new TbUserExample();
        tbUserExample.createCriteria().andRoleIdEqualTo(RoleEnum.CC.getCode());
        List<TbUser> userList  = tbUserMapper.selectByExample(tbUserExample);
        List<CCAssignDto> result = new ArrayList<>();
        if (userList.size()>0){
            for (TbUser user :userList){
                CCAssignDto ccAssignDto = new CCAssignDto();
                ccAssignDto.setCCName(user.getUsername());
                ccAssignDto.setFile(user.getFile());
                ccAssignDto.setCcId(user.getId());
                ccAssignDto.setState(1); //cc状态,1为空闲中,0为接待中/忙碌
                List<TbCCAssign> list = tbCCAssignMapper.selectListByCCIdToday(user.getId().intValue());
                if (list ==null || list.size()<=0){
                    ccAssignDto.setCount(0);
                }else {
                    ccAssignDto.setCount(list.size());
                    ccAssignDto.setLastTime(list.get(0).getCreateTime()); //最近一条记录的创建时间,就是CC分配的最近一次的时间
                    for (TbCCAssign tbCCAssign :list) {
                        if (tbCCAssign.getState() == 1) {
                            ccAssignDto.setState(0);
                            ccAssignDto.setId(tbCCAssign.getId()); // 如果状态为接待,返回这条记录的Id
                            break;
                        }
                    }
                }
                result.add(ccAssignDto);
            }
        }
        return result;
    }

    @Override
    public List<TbCCAssign> getCCList() {
        return null;
    }

    @Override
    public TbCCAssign updateState(int id,int state) {
        if (state !=0){
            throw new XmallException("不允许更改此状态");
        }
        TbCCAssign tbCCAssign = tbCCAssignMapper.selectByPrimaryKey(id);
        if (tbCCAssign ==null){
            throw new XmallException("更改失败,没有这条记录");
        }
        tbCCAssign.setState(state);
        int result =  tbCCAssignMapper.updateByPrimaryKeySelective(tbCCAssign);
        if (result <= 0){
            throw new XmallException("更改失败");
        }
        return tbCCAssign;
    }

    @Override
    public TbCCAssign insert(TbCCAssign tbCCAssign) {
        int ccId = tbCCAssign.getCcId();
        List<TbCCAssign> list = tbCCAssignMapper.selectListByCCIdToday(ccId);
        if (list != null && list.size() >=0){
            for (TbCCAssign ccAssign :list){
                if (ccAssign.getState() == 1){
                    throw new XmallException("新增失败");
                }
            }
        }
        int result = tbCCAssignMapper.insertSelective(tbCCAssign);
        if (result <=0){
            throw new XmallException("新增失败");
        }
        return tbCCAssign;
    }
}



