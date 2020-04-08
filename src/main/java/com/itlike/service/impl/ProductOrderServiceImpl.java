package com.itlike.service.impl;

import com.itlike.domain.Orders;
import com.itlike.domain.PageInfo;
import com.itlike.mapper.OrdersMapper;
import com.itlike.service.ProductOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductOrderServiceImpl implements ProductOrderService {
    @Autowired
    private OrdersMapper ordersMapper;

    @Override
    public PageInfo<Orders> findPageseProductOrderInfo(Integer oid, String suid, Integer state, Integer pageIndex, Integer pageSize) {
        PageInfo<Orders> pi = new PageInfo<Orders>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = ordersMapper.totalCount(oid,suid,state);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Orders> productorderlist = ordersMapper.getProductOrderList(oid,suid,state, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(productorderlist);
        }
        return pi;
    }

    @Override
    public void deleteProductorderinfo(Integer oid) {
        ordersMapper.deleteByPrimaryKey(oid);
    }
}
