package com.itlike.service;

import com.itlike.domain.Leavemsg;
import com.itlike.domain.PageInfo;
import com.itlike.domain.Wrongmsg;

import java.util.List;

public interface TeaManagerService {
    //查询学生请假情况
   public List<Leavemsg> selectAll();

   //查询学生违纪情况
   public List<Wrongmsg> selectWrongAll();

   //请假审批
   public void updateByPrimaryKey(Leavemsg leavemsg);

    //请假情况分页查询
    PageInfo<Leavemsg> findPageInfo(String stuid, String state, Integer pageIndex, Integer pageSize);

    //违纪信息分页查询
    PageInfo<Wrongmsg> findPageinfoWrong(Long stuid, String stuname, Integer pageIndex, Integer pageSize);
}
