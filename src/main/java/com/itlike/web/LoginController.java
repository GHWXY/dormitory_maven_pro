package com.itlike.web;

import com.itlike.domain.*;
import com.itlike.service.*;
import com.itlike.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private StuLoginService stuLoginService;
    @Autowired
    private TeaLoginService teaLoginService;
    @Autowired
    private SerLoginService serLoginService;
    @Autowired
    private StuManagerService stuManagerService;
    /**
     * 管理员登录
     */
    /**
     * 将提交数据(username,password)写入Admin对象
     */
    @RequestMapping(value = "/admin_manager")
    public String login(Admin admin, Model model, HttpSession session, HttpServletRequest request) {
        // 通过账号和密码查询用户
        admin.setA_password(MD5Util.MD5EncodeUtf8(admin.getA_password()));
        Admin ad = adminService.findAdmin(admin);
        System.out.println("管理员" + ad);
        if (ad != null) {
            session.setAttribute("ad", ad);
            return "homepage";
        }
        model.addAttribute("admin_msg", "用户名或密码错误，请重新登录！");
        return "login3";
    }

    /**
     * 学生登录
     */
    @RequestMapping(value = "/student_manager")
    public String login2(StuLogin stuLogin, Student2 student2, Depa depa, Major major, Dorms dorms, Model model, HttpSession session, HttpServletRequest request) {
        //System.out.println(stuLogin);
        // 通过账号和密码查询用户
        stuLogin.setSlPassword(MD5Util.MD5EncodeUtf8(stuLogin.getSlPassword()));
        StuLogin sl = stuLoginService.findStulogin(stuLogin);
        try {
            //查询学生信息
            student2.setName(sl.getSlUsername());
            Student2 stu2 = stuManagerService.findStuAll(student2);
            System.out.println(stu2);
            //查询学生系别
            depa.setDepaid(stu2.getDepaid());
            Depa depaAll = stuManagerService.findDepaAll(depa);
            System.out.println("系别====" + depaAll);
            //查询学生专业
            major.setMajorid(stu2.getMajorid());
            Major majorAll = stuManagerService.findMajorAll(major);
            System.out.println("专业===" + majorAll);
            //查询学生宿舍
            dorms.setId(Integer.parseInt(stu2.getDormno()));
            Dorms dormsAll = stuManagerService.findDormsAll(dorms);
            System.out.println(dormsAll);
            System.out.println("用户============" + sl);
            //学生信息
            session.setAttribute("stu2", stu2);
            //学生系别
            session.setAttribute("depaAll", depaAll);
            //学生专业
            session.setAttribute("majorAll", majorAll);
            //学生宿舍
            session.setAttribute("dormsAll", dormsAll);

        } catch (Exception e) {
            model.addAttribute("student_msg", "用户名或密码错误，请重新登录！");
            return "login3";
        }

        if (sl != null) {
            session.setAttribute("sl", sl);
            return "student";
        }
        //model.addAttribute("student_msg", "用户名或密码错误，请重新登录！");
        return "login3";


    }

    /**
     * 辅导员登录
     */
    @RequestMapping(value = "/teacher_manager")
    public String login3(TeaLogin teaLogin, Model model, HttpSession session, HttpServletRequest request) {
        //System.out.println(stuLogin);
        // 通过账号和密码查询用户
        teaLogin.setPassword(MD5Util.MD5EncodeUtf8(teaLogin.getPassword()));
        TeaLogin tl = teaLoginService.findTealogin(teaLogin);
        System.out.println(tl);
        if (tl != null) {
            session.setAttribute("tl", tl);
            return "teacher";
        }
        model.addAttribute("teacher_msg", "用户名或密码错误，请重新登录！");
        return "login3";
    }

    /**
     * 维修员登录
     */
    @RequestMapping(value = "/service_manager")
    public String login4(SerLogin serLogin, Model model, HttpSession session, HttpServletRequest request) {
        //System.out.println(stuLogin);
        // 通过账号和密码查询用户
        serLogin.setPassword(MD5Util.MD5EncodeUtf8(serLogin.getPassword()));
        SerLogin sel = serLoginService.findSerlogin(serLogin);
        System.out.println(sel);
        if (sel != null) {
            session.setAttribute("sel", sel);
            return "service";
        }
        model.addAttribute("service_msg", "用户名或密码错误，请重新登录！");
        return "login3";
    }

    /**
     * 退出登录
     */
    @RequestMapping(value = "/loginOut")
    public String loginOut(Admin admin, Model model, HttpSession session) {
        session.invalidate();
        return "login3";

    }

}
