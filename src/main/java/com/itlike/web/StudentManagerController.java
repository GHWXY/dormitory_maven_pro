package com.itlike.web;

import com.itlike.domain.*;
import com.itlike.service.StuManagerService;
import com.itlike.service.TeaManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudentManagerController {
    @Autowired
    private StuManagerService stuManagerService;
    @Autowired
    private TeaManagerService teaManagerService;

    @RequestMapping("/student")
    public String student(){
        return "student";
    }

    @RequestMapping("/student_pass")
    public String student_pass() {
        return "studentpass";

    }

    @RequestMapping("/1")
    public String aaa() {
        return "stchangepass";
    }

    @RequestMapping("/2")
    public String bbbb() {
        return "stchangeok";
    }

    /*宿舍维修*/
    @RequestMapping(value = "/serviceInsert", method = RequestMethod.POST)
    public String serviceInsert(Repair repair) {
        //System.out.println(repair.getDormno());
        repair.setState("待维修");
        //System.out.println("保修表====="+repair);
        stuManagerService.addService(repair);
        return "student";

    }

    /*请假申请*/
    @RequestMapping(value = "/selectLeaveInsert", method = RequestMethod.POST)
    public String selectLeaveInsert(Leavemsg leavemsg) {
        System.out.println(leavemsg);
        leavemsg.setState("待审批");
        //System.out.println("请假====="+leavemsg);
        stuManagerService.addSelectLeave(leavemsg);
        return "student";
    }

    /*个人信息修改电话号码*/
    @RequestMapping(value = "/changePhone", method = RequestMethod.POST)
    @ResponseBody
    public String changePhone(Student2 student2, HttpServletRequest request, HttpSession session) {
        String stuid = request.getParameter("stuid");
        String phone = request.getParameter("phone");
        System.out.println("学号===" + stuid);
        //System.out.println("电话==="+phone);
        student2.setId(Long.parseLong(stuid));
        student2.setPhone(phone);
        stuManagerService.updateByPrimaryKey(student2);
        return "redirect:student";
    }
    /*请假情况信息查询*/
    @RequestMapping("/leaverecord")
    @ResponseBody
    public Map<Object, Object> leaveinfo(String stuid, Integer pageIndex, Integer pageSize){
        System.out.println("-----------"+stuid);
        PageInfo<Leavemsg> pi = stuManagerService.findPageLeaveInfo(stuid,pageIndex,pageSize);
        Integer totalCount = pi.getTotalCount();
        List<Leavemsg> list = pi.getList();
        System.out.println(list);
        Map<Object, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "学生请假记录");
        map.put("count", totalCount);		//获得数据的总数
        map.put("data",list);	//本次分页查询的数据
        //System.out.println("map"+map);
        System.out.println("数据表格======"+list);
        return map;

    }
    /*请假审批（结束）*/
    @RequestMapping(value = "/updateOver",method = RequestMethod.POST)
    @ResponseBody
    public AjaxRes updateOver(Leavemsg leavemsg, HttpServletRequest request){
        String stuid = request.getParameter("stuid");
        leavemsg.setId(Integer.parseInt(stuid));
        leavemsg.setState("已结束");
        AjaxRes ajaxRes = new AjaxRes();
        try {
            teaManagerService.updateByPrimaryKey(leavemsg);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("结束成功！");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("结束失败！");
        }
        return ajaxRes;

    }
    /*请假审批（删除）*/
    @RequestMapping(value = "/stuLeaveDel")
    @ResponseBody
    public AjaxRes stuLeaveDel(String stuid){
        AjaxRes ajaxRes = new AjaxRes();
        try {
            stuManagerService.deleteByPrimaryKey(Integer.parseInt(stuid));
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("删除成功！");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("删除失败！");
        }
        return ajaxRes;

    }
    /*请假情况信息查询*/
    @RequestMapping("/violationrecord")
    @ResponseBody
    public Map<Object, Object> violationrecord(String stuid, Integer pageIndex, Integer pageSize){
        System.out.println("-----------"+stuid);
        PageInfo<Wrongmsg> pi = stuManagerService.findPageWrongInfo(Long.parseLong(stuid),pageIndex,pageSize);
        Integer totalCount = pi.getTotalCount();
        List<Wrongmsg> list = pi.getList();
        System.out.println(list);
        Map<Object, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "学生违规记录");
        map.put("count", totalCount);		//获得数据的总数
        map.put("data",list);	//本次分页查询的数据
        //System.out.println("map"+map);
        //System.out.println("数据表格======"+list);
        return map;

    }
    /*保修信息查询*/
    @RequestMapping("/warrantyrecord")
    @ResponseBody
    public Map<Object, Object> warrantyrecord(String stuid, Integer pageIndex, Integer pageSize){
        System.out.println("-----------"+stuid);
        PageInfo<Repair> pi = stuManagerService.findPageRepairgInfo(stuid,pageIndex,pageSize);
        Integer totalCount = pi.getTotalCount();
        List<Repair> list = pi.getList();
        System.out.println(list);
        Map<Object, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "学生违规记录");
        map.put("count", totalCount);		//获得数据的总数
        map.put("data",list);	//本次分页查询的数据
        //System.out.println("map"+map);
        //System.out.println("数据表格======"+list);
        return map;

    }
    /*保修信息（删除）*/
    @RequestMapping(value = "/stuRepairDel")
    @ResponseBody
    public AjaxRes stuRepairDel(String stuid){
        AjaxRes ajaxRes = new AjaxRes();
        try {
            stuManagerService.deleteRepairByPrimaryKey(stuid);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("删除成功！");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("删除失败！");
        }
        return ajaxRes;

    }

}
