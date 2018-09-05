package com.blacksheep.mtm.service.Impl;

import com.blacksheep.mtm.dao.ItemMapper;
import com.blacksheep.mtm.dao.TbItemMapper;
import com.blacksheep.mtm.dto.DtoUtil;
import com.blacksheep.mtm.dto.ItemDto;
import com.blacksheep.mtm.pojo.manager.TbItem;
import com.blacksheep.mtm.service.SSOClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SSOClassServiceImpl implements SSOClassService {

    @Autowired
    private TbItemMapper itemMapper;

    public List<ItemDto> getClassList(Long cid,String orderCol,String orderDir,Integer priceGt){
        List<ItemDto> list = new ArrayList<>();
        List<TbItem> result = itemMapper.selectItemFront(cid,orderCol,orderDir,0,0);
        for (TbItem tbItem :result){
            ItemDto itemDto = DtoUtil.TbItem2ItemDto(tbItem);
            list.add(itemDto);
        }
        return list;
    }
}
