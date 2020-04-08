package com.itlike.service;

import com.itlike.domain.Orders;
import com.itlike.domain.PageInfo;

public interface ProductOrderService {
    PageInfo<Orders> findPageseProductOrderInfo(Integer oid, String suid, Integer state, Integer pageIndex, Integer pageSize);

    public void deleteProductorderinfo(Integer oid);
}
