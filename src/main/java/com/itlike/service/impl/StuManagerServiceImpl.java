package com.itlike.service.impl;

import com.itlike.domain.*;
import com.itlike.mapper.*;
import com.itlike.service.StuManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StuManagerServiceImpl implements StuManagerService {
    @Autowired
    private Student2Mapper student2Mapper;
    @Autowired
    private DepaMapper depaMapper;
    @Autowired
    private MajorMapper majorMapper;
    @Autowired
    private DormsMapper dormsMapper;
    @Autowired
    private RepairMapper repairMapper;
    @Autowired
    private LeavemsgMapper leavemsgMapper;
    @Autowired
    private WrongmsgMapper wrongmsgMapper;

    @Override
    public Student2 findStuAll(Student2 student2) {
        Student2 stuAll = student2Mapper.findStuAll(student2);
        System.out.println(stuAll);
        return stuAll;
    }

    @Override
    public Depa findDepaAll(Depa depa) {
        Depa depaAll = depaMapper.findDepaAll(depa);
        return depaAll;
    }

    @Override
    public Major findMajorAll(Major major) {
        Major majorAll = majorMapper.findMajorAll(major);
        return majorAll;
    }

    @Override
    public Dorms findDormsAll(Dorms dorms) {
        Dorms dormsAll = dormsMapper.findDormsAll(dorms);
        return dormsAll;
    }

    //保修
    @Override
    public void addService(Repair repair) {
        repairMapper.insert(repair);
    }

    //请假申请
    @Override
    public void addSelectLeave(Leavemsg leavemsg) {
        leavemsgMapper.insert(leavemsg);
    }

    @Override
    public void updateByStuid(Student2 student2) {
        student2Mapper.updateByStuid(student2);
    }

    @Override
    public void updateByPrimaryKey(Student2 student2) {
        student2Mapper.updateByPrimaryKey(student2);
    }

    @Override
    public PageInfo<Leavemsg> findPageLeaveInfo(String stuid, Integer pageIndex, Integer pageSize) {
        PageInfo<Leavemsg> pi = new PageInfo<Leavemsg>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = leavemsgMapper.totalCount2(stuid);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Leavemsg> leavelist = leavemsgMapper.getLeaveList(stuid, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(leavelist);
        }
        return pi;
    }

    @Override
    public void deleteByPrimaryKey(Integer stuid) {
        leavemsgMapper.deleteByPrimaryKey(stuid);
    }

    @Override
    public PageInfo<Wrongmsg> findPageWrongInfo(Long stuid, Integer pageIndex, Integer pageSize) {
        PageInfo<Wrongmsg> pi = new PageInfo<Wrongmsg>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = wrongmsgMapper.totalCountStu(stuid);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Wrongmsg> leavelist = wrongmsgMapper.getWrongListStu(stuid, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(leavelist);
        }
        return pi;
    }

    @Override
    public PageInfo<Repair> findPageRepairgInfo(String stuid, Integer pageIndex, Integer pageSize) {
        PageInfo<Repair> pi = new PageInfo<Repair>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = repairMapper.totalCountStu(stuid);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Repair> leavelist = repairMapper.getRepairListStu(stuid, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(leavelist);
        }
        return pi;
    }
    @Override
    public void deleteRepairByPrimaryKey(String stuid) {
        repairMapper.deleteRepairByPrimaryKey(stuid);
    }
}
