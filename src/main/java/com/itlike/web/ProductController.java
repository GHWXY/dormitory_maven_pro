package com.itlike.web;

import com.itlike.domain.AjaxRes;
import com.itlike.domain.PageInfo;
import com.itlike.domain.Product;
import com.itlike.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping("/findProduct")
    public String findProduct(String pname, Integer pageIndex, Integer pageSize, Model model){
        PageInfo<Product> pi = productService.findPageseProductInfo(pname,pageIndex,pageSize);

        model.addAttribute("di",pi);
        return "adminProduct";
    }

    /*物品信息查询*/
    @RequestMapping("/productInfo")
    @ResponseBody
    public Map<Object, Object> productInfo(String pname, Integer pageIndex, Integer pageSize){
        PageInfo<Product> pi = productService.findPageseProductInfo(pname,pageIndex,pageSize);
        Integer totalCount = pi.getTotalCount();
        List<Product> list = pi.getList();
        System.out.println(list);
        Map<Object, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "学生请假信息");
        map.put("count", totalCount);		//获得数据的总数
        map.put("data",list);	//本次分页查询的数据
        //System.out.println("map"+map);
        System.out.println("数据表格======"+list);
        return map;

    }

    /**
     * 删除学生物品信息
     */
    @RequestMapping( "/deleteProducrinfo")
    @ResponseBody
    public AjaxRes deleteProducrinfo(Integer pid) {
        //int s = studentService.deleteStudent(s_id);
        AjaxRes ajaxRes = new AjaxRes();

        try {
            productService.deleteProductinfo(pid);
            ajaxRes.setMsg("删除成功");
            ajaxRes.setSuccess(true);

        }catch (Exception e){
            ajaxRes.setMsg("删除失败");
            ajaxRes.setSuccess(false);
        }
        return ajaxRes;
    }
}
