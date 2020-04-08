package com.itlike.web;

import com.itlike.domain.*;
import com.itlike.service.TeaManagerService;
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
public class TeacherManagerController {
    @Autowired
    private TeaManagerService teaManagerService;
    @RequestMapping("/teacher")
    public String teacher_manager(){
        return "teacher";
    }

    /*请假情况信息查询*/
    @RequestMapping("/leaveinfo")
    @ResponseBody
    public Map<Object, Object> leaveinfo(String stuid,String state,Integer pageIndex, Integer pageSize){
        PageInfo<Leavemsg> pi = teaManagerService.findPageInfo(stuid,state,pageIndex,pageSize);
        Integer totalCount = pi.getTotalCount();
        List<Leavemsg> list = pi.getList();
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

    /*违纪信息查询*/
    @RequestMapping("/wronginfo")
    @ResponseBody
    public Map<Object, Object> wronginfo(Long stuid,String stuname,Integer pageIndex, Integer pageSize){
        PageInfo<Wrongmsg> pi = teaManagerService.findPageinfoWrong(stuid,stuname,pageIndex,pageSize);
        //System.out.println(list);
        Integer totalCount = pi.getTotalCount();
        List<Wrongmsg> list = pi.getList();
        Map<Object, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "学生违纪信息");
        map.put("count", totalCount);		//获得数据的总数
        map.put("data",list);	//本次分页查询的数据
        //System.out.println("map"+map);
        System.out.println("数据表格======"+list);
        return map;
    }

    /*请假审批（批准）*/
    @RequestMapping(value = "/updateApproval",method = RequestMethod.POST)
    @ResponseBody
    public AjaxRes updateApproval(Leavemsg leavemsg, HttpServletRequest request){
        String stuid = request.getParameter("stuid");
        leavemsg.setId(Integer.parseInt(stuid));
        leavemsg.setState("已批准");
        AjaxRes ajaxRes = new AjaxRes();
        try {
            teaManagerService.updateByPrimaryKey(leavemsg);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("批准成功！");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("批准失败！");
        }
        return ajaxRes;

    }

    /*请假审批（拒绝）*/
    @RequestMapping(value = "/updateRefuse",method = RequestMethod.POST)
    @ResponseBody
    public AjaxRes updateRefuse(Leavemsg leavemsg, HttpServletRequest request){
        String stuid = request.getParameter("stuid");
        leavemsg.setId(Integer.parseInt(stuid));
        leavemsg.setState("已拒绝");
        AjaxRes ajaxRes = new AjaxRes();
        try {
            teaManagerService.updateByPrimaryKey(leavemsg);
            ajaxRes.setSuccess(true);
            ajaxRes.setMsg("拒绝成功！");
        }catch (Exception e){
            ajaxRes.setSuccess(false);
            ajaxRes.setMsg("拒绝失败！");
        }
        return ajaxRes;

    }
}
