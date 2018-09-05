package com.blacksheep.mtm.service;

import com.blacksheep.mtm.dto.front.Order;
import com.blacksheep.mtm.dto.front.OrderInfo;
import com.blacksheep.mtm.dto.front.PageOrder;
import com.blacksheep.mtm.pojo.manager.TbThanks;

import java.util.List;

public interface SSOOrderService {

    /**
     * 分页获得用户订单
     * @param userId
     * @param page
     * @param size
     * @return
     */
    PageOrder getOrderList(Long userId, int page, int size);

    /**
     * 获得单个订单
     * @param orderId
     * @return
     */
    Order getOrder(Long orderId);

    /**
     * 取消订单
     * @param orderId
     * @return
     */
    int cancelOrder(Long orderId);

    /**
     * 创建订单
     * @param orderInfo
     * @return
     */
    Long createOrder(OrderInfo orderInfo);

    /**
     * 删除订单
     * @param orderId
     * @return
     */
    int delOrder(Long orderId);

    /**
     * 订单支付 生成捐赠数据
     * @param tbThanks
     * @return
     */
    int payOrder(TbThanks tbThanks);
}
