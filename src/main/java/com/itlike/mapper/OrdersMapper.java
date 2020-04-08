package com.itlike.mapper;

import com.itlike.domain.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersMapper {
    int deleteByPrimaryKey(Integer oid);

    int insert(Orders record);

    Orders selectByPrimaryKey(Integer oid);

    List<Orders> selectAll();

    int updateByPrimaryKey(Orders record);

    //获取总数
    public Integer totalCount(@Param("oid") Integer oid, @Param("suid")String suid, @Param("state")Integer state);

    List<Orders> getProductOrderList(@Param("oid") Integer oid, @Param("suid")String suid, @Param("state")Integer state,@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
}