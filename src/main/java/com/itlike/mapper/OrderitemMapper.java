package com.itlike.mapper;

import com.itlike.domain.Orderitem;
import java.util.List;

public interface OrderitemMapper {
    int deleteByPrimaryKey(Integer otid);

    int insert(Orderitem record);

    Orderitem selectByPrimaryKey(Integer otid);

    List<Orderitem> selectAll();

    int updateByPrimaryKey(Orderitem record);
}