package com.blacksheep.mtm.service;

import com.blacksheep.mtm.pojo.manager.TbNewsDesc;

public interface NewsDescService {

    TbNewsDesc insertNewsDesc(TbNewsDesc tbNewsDesc);

    Integer deletById(Integer id);

    TbNewsDesc updateNewsDesc(TbNewsDesc tbNewsDesc);

    TbNewsDesc getByNewsId(Integer id);

}
