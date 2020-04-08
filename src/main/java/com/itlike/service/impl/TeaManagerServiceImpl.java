package com.itlike.service.impl;

import com.itlike.domain.Leavemsg;
import com.itlike.domain.PageInfo;
import com.itlike.domain.Wrongmsg;
import com.itlike.mapper.LeavemsgMapper;
import com.itlike.mapper.WrongmsgMapper;
import com.itlike.service.TeaManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeaManagerServiceImpl implements TeaManagerService {
    @Autowired
    private LeavemsgMapper leavemsgMapper;
    @Autowired
    private WrongmsgMapper wrongmsgMapper;

    @Override
    public List<Leavemsg> selectAll() {
        List<Leavemsg> leavemsgs = leavemsgMapper.selectAll();
        return leavemsgs;
    }

    @Override
    public List<Wrongmsg> selectWrongAll() {
        List<Wrongmsg> wrongmsgs = wrongmsgMapper.selectAll();
        return wrongmsgs;
    }

    @Override
    public void updateByPrimaryKey(Leavemsg leavemsg) {
        leavemsgMapper.updateByPrimaryKey(leavemsg);
    }

    @Override
    public PageInfo<Leavemsg> findPageInfo(String stuid, String state, Integer pageIndex, Integer pageSize) {
        PageInfo<Leavemsg> pi = new PageInfo<Leavemsg>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = leavemsgMapper.totalCount(stuid, state);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Leavemsg> leavelist = leavemsgMapper.getRepairList(stuid, state, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(leavelist);
        }
        return pi;
    }

    @Override
    public PageInfo<Wrongmsg> findPageinfoWrong(Long stuid, String stuname, Integer pageIndex, Integer pageSize) {
        PageInfo<Wrongmsg> pi = new PageInfo<Wrongmsg>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = wrongmsgMapper.totalCount(stuid, stuname);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Wrongmsg> wronglist = wrongmsgMapper.getWrongList(stuid, stuname, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(wronglist);
        }
        return pi;
    }
}
