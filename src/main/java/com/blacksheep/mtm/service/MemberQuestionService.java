package com.blacksheep.mtm.service;


import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbMemberQuestion;

import java.util.List;

/**
 * 会员问题
 */
public interface MemberQuestionService {

    /**
     * 根据ID查询
     * @param id
     * @return
     */
    TbMemberQuestion getQuestionById(Integer id);

    /**
     * 查询所有记录
     * @return
     */
    DataTablesResult getQuestionList(int draw, int start, int length, int cid,
                                     String search, String orderCol, String orderDir);

    /**
     * 插入一条记录
     * @param tbMemberQuestion
     * @return
     */
    TbMemberQuestion insertQuestion(TbMemberQuestion tbMemberQuestion);

    /**
     * 根据主键删除一条记录
     * @param id
     * @return
     */
    int delQuestion(Integer id);

    /**
     * 更新一条记录
     * @param tbMemberQuestion
     * @return
     */
    TbMemberQuestion updateQuestion(TbMemberQuestion tbMemberQuestion);

    /**
     * 批量删除
     * @param ids
     * @return
     */
    int deleteBatch(Integer[] ids);
}
