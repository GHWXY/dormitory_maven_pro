package com.itlike.service;

import com.itlike.domain.PageInfo;
import com.itlike.domain.Product;

public interface ProductService {

    PageInfo<Product> findPageseProductInfo(String pname, Integer pageIndex, Integer pageSize);

    public void deleteProductinfo(Integer pid);
}
