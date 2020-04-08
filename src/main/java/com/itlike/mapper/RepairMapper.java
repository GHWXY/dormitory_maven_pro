package com.itlike.mapper;

import com.itlike.domain.Repair;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RepairMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Repair record);

    Repair selectByPrimaryKey(Integer id);

    List<Repair> selectAll();

    int updateByPrimaryKey(Repair record);

    //获取总条数
    public Integer totalCount(@Param("dormno") Integer dormno, @Param("state") String state);

    //获取宿舍维修列表
    public List<Repair> getRepairList(@Param("dormno") Integer dormno, @Param("state") String state, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    int deleteRepairByPrimaryKey(String stuid);

    public Integer totalCountStu(@Param("stuid") String stuid);

    List<Repair> getRepairListStu(@Param("stuid") String stuid, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
}