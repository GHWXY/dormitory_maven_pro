package com.itlike.service.impl;

import com.itlike.domain.Leavemsg;
import com.itlike.domain.PageInfo;
import com.itlike.domain.Student;
import com.itlike.mapper.LeavemsgMapper;
import com.itlike.mapper.StudentDao;
import com.itlike.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {
	// 注入studentDao
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private LeavemsgMapper leavemsgMapper;


	//分页查询
	@Override
	public PageInfo<Student> findPageInfo(String s_name, Integer s_studentid, Integer s_classid,
										  String s_classname, Integer pageIndex, Integer pageSize) {
		PageInfo<Student> pi = new PageInfo<Student>();
		pi.setPageIndex(pageIndex);
		pi.setPageSize(pageSize);
		//获取总条数
		Integer totalCount = studentDao.totalCount(s_name,s_studentid,s_classid,s_classname);
		if (totalCount>0){
			pi.setTotalCount(totalCount);
			//每一页显示学生信息数
			//currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
		List<Student> studentList =	studentDao.getStudentList(s_name,s_studentid,s_classid,s_classname,
				     (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
		  pi.setList(studentList);
		}
		return pi;
	}


	@Override
	public List<Student> getAll(){
		List<Student> studentList = studentDao.getAll();
		return studentList;
	}

	@Override
	public PageInfo<Leavemsg> findPageselectLeaveInfo(String stuid, String name, String state, Integer pageIndex, Integer pageSize) {
		PageInfo<Leavemsg> pi = new PageInfo<Leavemsg>();
		pi.setPageIndex(pageIndex);
		pi.setPageSize(pageSize);
		//获取总条数
		Integer totalCount = leavemsgMapper.totalCount(stuid, state);
		if (totalCount > 0) {
			pi.setTotalCount(totalCount);
			//每一页显示学生信息数
			//currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
			List<Leavemsg> leavelist = leavemsgMapper.getLeavemsgList(stuid, name,state, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
			pi.setList(leavelist);
		}
		return pi;
	}

	@Override
	public void deleteLeavemsg(String stuid) {
		leavemsgMapper.deleteByPrimaryKey(Integer.parseInt(stuid));
	}


	//通过id删除学生信息
	@Override
	public int deleteStudent(Integer s_id) {
		return studentDao.deleteStudent(s_id);
	}
    //添加学生信息
	@Override
	public  int addStudent(Student student) {
		return studentDao.addStudent(student);
	}
	//修改学生信息
	@Override
	public int updateStudent(Student student) { return studentDao.updateStudent(student); }

	@Override
	public Student findStudentById (Integer s_id){
		Student s = studentDao.findStudentById(s_id);
         return  s;
	}


}
