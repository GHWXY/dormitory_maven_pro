package com.itlike.web;

import com.itlike.domain.*;
import com.itlike.service.SerManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ServiceManagerController {
    @Autowired
    private SerManagerService serManagerService;
    @RequestMapping("/service")
    public String service(){
        return "service";
    }

    /*物品申领信息*/
    @RequestMapping("/productApply")
    @ResponseBody
    public Map<Object, Object> productApply(){
        List<Orders> list = serManagerService.selectAll();
        System.out.println(list);
        Map<Object, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "物品申领信息");
        map.put("count", 4);		//获得数据的总数
        map.put("data",list);	//本次分页查询的数据
        //System.out.println("map"+map);
        System.out.println("数据表格======"+list);
        return map;
    }

    /*宿舍下拉框*/
    @RequestMapping("/findDormsAll")
    @ResponseBody
    public List<Dorms> findDormsAll(){
        List<Dorms> dorms = serManagerService.selectDorms();
        //System.out.println("下拉框宿舍==="+dorms);
        return dorms;
    }

    /*宿舍维修管理*/
    @RequestMapping(value = "/selectRepairinfo")
    @ResponseBody
    public Map<Object, Object> selectRepairinfo(Integer dormno,String state,Integer pageIndex, Integer pageSize){
        PageInfo<Repair> pi = serManagerService.findPageInfo(dormno,state,pageIndex,pageSize);
        Integer totalCount = pi.getTotalCount();
        List<Repair> list = pi.getList();
        Map<Object, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "宿舍维修管理");
        map.put("count", totalCount);		//获得数据的总数
        map.put("data",list);	//本次分页查询的数据
        //System.out.println("map"+map);
        System.out.println("宿舍维修管理====="+list);
        return map;

    }
    /*宿舍维修管理（接受）*/
    @RequestMapping(value = "/updateAgree",method = RequestMethod.POST)
    @ResponseBody
    public AjaxRes updateAgree(Repair repair, HttpServletRequest request){
        String stuid = request.getParameter("stuid");
        repair.setId(Integer.parseInt(stuid));
        repair.setState("维修中");
        AjaxRes ajaxRes = new AjaxRes();
        try {
            serManagerService.updateByPrimaryKey(repair);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("接受成功！");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("接受失败！");
        }
        return ajaxRes;

    }

    /*宿舍维修管理（完成）*/
    @RequestMapping(value = "/updateFinish",method = RequestMethod.POST)
    @ResponseBody
    public AjaxRes updateFinish(Repair repair, HttpServletRequest request){
        String stuid = request.getParameter("stuid");
        repair.setId(Integer.parseInt(stuid));
        repair.setState("已完成");
        AjaxRes ajaxRes = new AjaxRes();
        try {
            serManagerService.updateByPrimaryKey(repair);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("成功完成！");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("完成失败！");
        }
        return ajaxRes;

    }

    /*宿舍维修管理（延迟）*/
    @RequestMapping(value = "/updateLate",method = RequestMethod.POST)
    @ResponseBody
    public AjaxRes updateLate(Repair repair, HttpServletRequest request){
        String stuid = request.getParameter("stuid");
        repair.setId(Integer.parseInt(stuid));
        repair.setState("无库存");
        AjaxRes ajaxRes = new AjaxRes();
        try {
            serManagerService.updateByPrimaryKey(repair);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("延迟成功！");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("延迟失败！");
        }
        return ajaxRes;
    }

    /*物品下拉框*/
    @RequestMapping("/findProductAll")
    @ResponseBody
    public List<Product> findProductAll(){
        List<Product> products = serManagerService.selectProduct();
        //System.out.println("下拉框宿舍==="+dorms);
        return products;
    }
}
