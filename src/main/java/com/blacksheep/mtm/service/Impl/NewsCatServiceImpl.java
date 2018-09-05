package com.blacksheep.mtm.service.Impl;

import com.blacksheep.mtm.dao.TbNewsCatMapper;
import com.blacksheep.mtm.pojo.common.DataTablesResult;
import com.blacksheep.mtm.pojo.manager.TbNewsCat;
import com.blacksheep.mtm.service.NewsCatService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsCatServiceImpl implements NewsCatService {

    @Autowired
    private TbNewsCatMapper tbNewsCatMapper;
    @Override
    public DataTablesResult getList(int draw, int start, int length, int cid, String search, String orderCol, String orderDir) {
        DataTablesResult result = new DataTablesResult();

        //分页执行查询返回结果
        PageHelper.startPage(start/length+1,length);
        List<TbNewsCat> list = tbNewsCatMapper.selectItemByCondition(cid,"%"+search+"%",orderCol,orderDir);
        PageInfo<TbNewsCat> pageInfo=new PageInfo<>(list);
        result.setRecordsFiltered((int)pageInfo.getTotal());
        result.setRecordsTotal((int)pageInfo.getTotal());
        result.setDraw(draw);
        result.setData(list);

        return result;

    }
}
