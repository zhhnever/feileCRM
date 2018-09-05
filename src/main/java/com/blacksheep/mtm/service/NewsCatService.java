package com.blacksheep.mtm.service;

import com.blacksheep.mtm.pojo.common.DataTablesResult;

public interface NewsCatService {
    DataTablesResult getList(int draw, int start, int length, int cid,
                             String search, String orderCol, String orderDir);

}
