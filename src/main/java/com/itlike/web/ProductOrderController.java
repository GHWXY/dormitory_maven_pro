package com.itlike.web;

import com.itlike.domain.AjaxRes;
import com.itlike.domain.Orders;
import com.itlike.domain.PageInfo;
import com.itlike.service.ProductOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductOrderController {
    @Autowired
    private ProductOrderService productOrderService;
    @RequestMapping("/findProduct_list")
    public String findProduct_list(){
        return "adminProductOrder";
    }

    /*物品清单信息查询*/
    @RequestMapping("/productorder")
    @ResponseBody
    public Map<Object, Object> productorder(Integer oid,String suid,Integer state, Integer pageIndex, Integer pageSize){
        PageInfo<Orders> pi = productOrderService.findPageseProductOrderInfo(oid,suid,state,pageIndex,pageSize);
        Integer totalCount = pi.getTotalCount();
        List<Orders> list = pi.getList();
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
     * 删除学生物品清单信息
     */
    @RequestMapping( "/deleteProducrListinfo")
    @ResponseBody
    public AjaxRes deleteProducrListinfo(Integer oid) {
        //int s = studentService.deleteStudent(s_id);
        AjaxRes ajaxRes = new AjaxRes();

        try {
            productOrderService.deleteProductorderinfo(oid);
            ajaxRes.setMsg("删除成功");
            ajaxRes.setSuccess(true);

        }catch (Exception e){
            ajaxRes.setMsg("删除失败");
            ajaxRes.setSuccess(false);
        }
        return ajaxRes;
    }
}
