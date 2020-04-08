package com.itlike.mapper;

import com.itlike.domain.Leavemsg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LeavemsgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Leavemsg record);

    Leavemsg selectByPrimaryKey(Integer id);

    List<Leavemsg> selectAll();

    /*批准*/
    int updateByPrimaryKey(Leavemsg record);

    //获取总条数
    public Integer totalCount(@Param("stuid") String stuid, @Param("state") String state);

    public List<Leavemsg> getRepairList(@Param("stuid") String stuid, @Param("state") String state, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    List<Leavemsg> getLeavemsgList(@Param("stuid") String stuid,@Param("name") String name,@Param("state") String state, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public Integer totalCount2(@Param("stuid") String stuid);

    List<Leavemsg> getLeaveList(@Param("stuid") String stuid, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
}