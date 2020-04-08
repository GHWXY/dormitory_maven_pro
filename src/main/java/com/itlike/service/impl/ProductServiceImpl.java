package com.itlike.service.impl;

import com.itlike.domain.PageInfo;
import com.itlike.domain.Product;
import com.itlike.mapper.ProductMapper;
import com.itlike.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;
    @Override
    public PageInfo<Product> findPageseProductInfo(String pname, Integer pageIndex, Integer pageSize) {
        PageInfo<Product> pi = new PageInfo<Product>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = productMapper.totalCount(pname);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Product> productlist = productMapper.getProductList(pname, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(productlist);
        }
        return pi;
    }

    @Override
    public void deleteProductinfo(Integer pid) {
        productMapper.deleteByPrimaryKey(pid);
    }
}
