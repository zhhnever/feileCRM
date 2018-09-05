package com.blacksheep.mtm.service;



import com.blacksheep.mtm.dto.front.CartProduct;

import java.util.List;

public interface SSOCartService {

    int addCart(long userId, long itemId, int num);

    List<CartProduct> getCartList(long userId);

    int updateCartNum(long userId, long itemId, int num,String checked);

    int deleteCartItem(long userId, long itemId);

    int checkAll(long userId,String checked);

}
