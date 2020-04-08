package com.itlike.mapper;

import com.itlike.domain.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(Product record);

    Product selectByPrimaryKey(Integer pid);

    List<Product> selectAll();

    int updateByPrimaryKey(Product record);

    //获取总数
    public Integer totalCount(@Param("pname")String pname);

    List<Product> getProductList(@Param("pname")String pname,@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
}