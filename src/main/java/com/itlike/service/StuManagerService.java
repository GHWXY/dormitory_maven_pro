package com.itlike.service;

import com.itlike.domain.*;

public interface StuManagerService {
    //根据学生姓名查询信息
    public Student2 findStuAll(Student2 student2);
    //根据学生depaid查询系别
    public Depa findDepaAll(Depa depa);
    //根据majorid查询专业
    public Major findMajorAll(Major major);
    //根据dormno查询宿舍
    public Dorms findDormsAll(Dorms dorms);
    //保修表
    public void addService(Repair repair);

    //请假申请
    public void addSelectLeave(Leavemsg leavemsg);

    //修改电话号码
    public void updateByStuid(Student2 student2);
    public void updateByPrimaryKey(Student2 student2);

    PageInfo<Leavemsg> findPageLeaveInfo(String stuid, Integer pageIndex, Integer pageSize);

    public void deleteByPrimaryKey(Integer stuid);


    PageInfo<Wrongmsg> findPageWrongInfo(Long stuid, Integer pageIndex, Integer pageSize);

    public void deleteRepairByPrimaryKey(String stuid);

    PageInfo<Repair> findPageRepairgInfo(String stuid, Integer pageIndex, Integer pageSize);
}
