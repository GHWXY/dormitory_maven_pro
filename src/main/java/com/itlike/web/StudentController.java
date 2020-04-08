package com.itlike.web;


import com.itlike.domain.*;
import com.itlike.service.StudentService;
import com.itlike.service.WrongmsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户控制器类
 */
@Controller
public class StudentController {
	// 依赖注入
	@Autowired
	private StudentService studentService;
	@Autowired
	private WrongmsgService wrongmsgService;

	/**
	 * 分页查询
	 * pageIndex 当前页码
	 * pageSize  显示条数
	 */
	@RequestMapping(value = "/findStudent")
	public String findStudent(String s_name, Integer s_studentid, Integer s_classid, String s_classname,
							  Integer pageIndex, Integer pageSize, Model model) {

	  PageInfo<Student> pi = studentService.findPageInfo(s_name,s_studentid,s_classid,
			  					s_classname,pageIndex,pageSize);
	  System.out.println("=============="+pi);
	  model.addAttribute("pi",pi);
	  model.addAttribute("s_name",s_name);
		return "student_list";
	}

	@RequestMapping(value = "/studentinfo2")
	@ResponseBody
	public Map<Object, Object> studentinfo2(String s_name, Integer s_studentid, Integer s_classid, String s_classname,
											Integer pageIndex, Integer pageSize){
		PageInfo<Student> pi = studentService.findPageInfo(s_name,s_studentid,s_classid,
				s_classname,pageIndex,pageSize);
		Integer totalCount = pi.getTotalCount();
		List<Student> list = pi.getList();
		Map<Object, Object> map = new HashMap<>();
		map.put("code", 0);
		map.put("msg", "学生信息");
		map.put("count", totalCount);		//获得数据的总数
		map.put("data",list);	//本次分页查询的数据
		//System.out.println("map"+map);
		System.out.println("数据表格2"+list);
		return map;

	}

    @RequestMapping("/adminWrong")
	public String adminWrong(){
		return "adminWrong";

	}
	@RequestMapping(value = "/wrongInsert",method = RequestMethod.POST)
	@ResponseBody
	public AjaxRes wrongInsert(@RequestBody Wrongmsg wrongmsg){

		System.out.println("违纪情况"+wrongmsg);
		AjaxRes ajaxRes = new AjaxRes();
		try {
			wrongmsgService.addWrongmsg(wrongmsg);
			ajaxRes.setMsg("提交成功");
			ajaxRes.setSuccess(true);
		}catch (Exception e){
			ajaxRes.setMsg("提交失败");
			ajaxRes.setSuccess(false);

		}
		return ajaxRes;

	}

	/**
	 * 导出Excel
	 */
	@RequestMapping(value = "/exportstudentlist", method = RequestMethod.POST)
	@ResponseBody
	public List<Student> exportStudent(){
		List<Student> studentList = studentService.getAll();
		return studentList;
	}

	/**
	 * 删除学生信息
	 */
	@RequestMapping( "/deleteStudent")
	@ResponseBody
	public AjaxRes deleteStudent(Integer s_id) {
		//int s = studentService.deleteStudent(s_id);
		AjaxRes ajaxRes = new AjaxRes();

		try {
			studentService.deleteStudent(s_id);
			ajaxRes.setMsg("删除成功");
			ajaxRes.setSuccess(true);

		}catch (Exception e){
			ajaxRes.setMsg("删除失败");
			ajaxRes.setSuccess(false);
		}
		return ajaxRes;
	}

/**
 * 添加学生信息
 */

   @RequestMapping(value = "/addStudent",method = RequestMethod.POST)
   @ResponseBody
   public AjaxRes addStudent(Student student) {
	   System.out.println("添加学生======"+student);
	   AjaxRes ajaxRes = new AjaxRes();
	   try {
		    studentService.addStudent(student);
		   ajaxRes.setMsg("添加成功");
		   ajaxRes.setSuccess(true);
	   }catch (Exception e){
		   ajaxRes.setMsg("添加失败");
		   ajaxRes.setSuccess(false);

	   }
	   return ajaxRes;

    }

	/**
	 * 修改学生信息
	 */
	/*@RequestMapping(value = "/updateStudent",method = RequestMethod.POST)
	@ResponseBody
	public String updateStudent(Student student) {
		System.out.println("编辑====="+student);
		int s = studentService.updateStudent(student);
		return "redirect:/findStudent";
	}*/
	@RequestMapping(value = "/updateStudent",method = RequestMethod.POST)
	@ResponseBody
	public AjaxRes updateStudent(Student student) {
		System.out.println("编辑====="+student);
		//int s = studentService.updateStudent(student);
		AjaxRes ajaxRes = new AjaxRes();
		try {
			studentService.updateStudent(student);
			ajaxRes.setMsg("更新成功");
			ajaxRes.setSuccess(true);

		}catch (Exception e){
			ajaxRes.setMsg("更新失败");
			ajaxRes.setSuccess(false);
		}
		return ajaxRes;
	}


    @RequestMapping( "/findStudentById")
    public String findStudentById(Integer s_id, HttpSession session) {

        Student s= studentService.findStudentById(s_id);
        session.setAttribute("s",s);
        return "student_edit";
    }

    @RequestMapping("/selectLeave")
	public String selectLeave(){
		return "adminSelectLeave";
	}

	/*请假情况信息查询*/
	@RequestMapping("/selectLeaveinfo")
	@ResponseBody
	public Map<Object, Object> selectLeaveinfo(String stuid,String name,String state,Integer pageIndex, Integer pageSize){
		PageInfo<Leavemsg> pi = studentService.findPageselectLeaveInfo(stuid,name,state,pageIndex,pageSize);
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

	/**
	 * 删除学生请假情况
	 */
	@RequestMapping( "/deleteLeavemsg")
	@ResponseBody
	public AjaxRes deleteLeavemsg(String stuid) {
		//int s = studentService.deleteStudent(s_id);
		AjaxRes ajaxRes = new AjaxRes();

		try {
			studentService.deleteLeavemsg(stuid);
			ajaxRes.setMsg("删除成功");
			ajaxRes.setSuccess(true);

		}catch (Exception e){
			ajaxRes.setMsg("删除失败");
			ajaxRes.setSuccess(false);
		}
		return ajaxRes;
	}
}
