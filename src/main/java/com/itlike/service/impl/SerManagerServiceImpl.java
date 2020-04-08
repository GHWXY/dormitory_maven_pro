package com.itlike.service.impl;

import com.itlike.domain.*;
import com.itlike.mapper.DormsMapper;
import com.itlike.mapper.OrdersMapper;
import com.itlike.mapper.ProductMapper;
import com.itlike.mapper.RepairMapper;
import com.itlike.service.SerManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SerManagerServiceImpl implements SerManagerService {
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private DormsMapper dormsMapper;
    @Autowired
    private RepairMapper repairMapper;
    @Autowired
    private ProductMapper productMapper;
    @Override
    public List<Orders> selectAll() {
        List<Orders> orders = ordersMapper.selectAll();
        return orders;
    }

    @Override
    public List<Dorms> selectDorms() {
        List<Dorms> dorms = dormsMapper.selectAll();
        return dorms;
    }

    @Override
    public PageInfo<Repair> findPageInfo(Integer dormno,String state,Integer pageIndex, Integer pageSize) {
        PageInfo<Repair> pi = new PageInfo<Repair>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = repairMapper.totalCount(dormno,state);
        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Repair> repairList = repairMapper.getRepairList(dormno, state, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(repairList);
        }
        return pi;
    }

    @Override
    public void updateByPrimaryKey(Repair repair) {
        repairMapper.updateByPrimaryKey(repair);

    }

    @Override
    public List<Product> selectProduct() {
        List<Product> products = productMapper.selectAll();
        return products;
    }
}
