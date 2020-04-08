package com.itlike.service;

import com.itlike.domain.*;

import java.util.List;

public interface SerManagerService {
    public List<Orders> selectAll();

    /*用于宿舍下拉框*/
   public List<Dorms> selectDorms();

   //分页查询
    public PageInfo<Repair> findPageInfo(Integer dormno,String state,Integer pageIndex, Integer pageSize);

    public void updateByPrimaryKey(Repair repair);

    /*用于物品下拉框*/
   public List<Product> selectProduct();
}
