package com.blacksheep.mtm.service;


import com.blacksheep.mtm.dto.CCAssignDto;
import com.blacksheep.mtm.pojo.TbCCAssign;
import org.omg.CORBA.TCKind;

import java.util.List;

public interface CCAssignService {

    /**
     * 获取当天的CC分配列表
     * @return
     */
    List<CCAssignDto> getALLList();

    /**
     * 获取所有的CC分配列表
     * @return
     */
    List<TbCCAssign> getCCList();

    /**
     *
     * @return
     */
    TbCCAssign updateState(int id,int state);

    TbCCAssign insert(TbCCAssign tbCCAssign);
}
