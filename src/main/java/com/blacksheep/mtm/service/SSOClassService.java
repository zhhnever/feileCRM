package com.blacksheep.mtm.service;

import com.blacksheep.mtm.dto.ItemDto;

import java.util.List;

public interface SSOClassService {

    List<ItemDto> getClassList(Long cid, String orderCol, String orderDir, Integer priceGt);
}
