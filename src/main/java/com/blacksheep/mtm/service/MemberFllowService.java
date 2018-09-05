package com.blacksheep.mtm.service;

import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbMemberFllow;

public interface MemberFllowService {
  DataTablesResult getListByUser(Integer userId,int draw, int start,int length, String orderCol, String orderDir);

  TbMemberFllow getById(Integer id);

  Integer batchDeletByIds(Integer[] ids);

  TbMemberFllow insert(TbMemberFllow tbMemberFllow);

  TbMemberFllow updateById(TbMemberFllow tbMemberFllow);

    DataTablesResult getAllList(int draw, int start, int length, String search,
                                String minDate, String maxDate, String orderCol, String orderDir);

}
