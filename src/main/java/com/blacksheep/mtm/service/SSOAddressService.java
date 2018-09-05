package com.blacksheep.mtm.service;

import com.blacksheep.mtm.pojo.manager.TbAddress;

import java.util.List;

public interface SSOAddressService {

    List<TbAddress> getAddressList(Long userId);

    TbAddress getAddress(Long addressId);

    int addAddress(TbAddress tbAddress);

    int updateAddress(TbAddress tbAddress);

    int delAddress(TbAddress tbAddress);
}
