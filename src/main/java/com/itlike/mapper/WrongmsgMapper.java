package com.itlike.mapper;

import com.itlike.domain.Wrongmsg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WrongmsgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Wrongmsg record);

    Wrongmsg selectByPrimaryKey(Integer id);

    List<Wrongmsg> selectAll();

    int updateByPrimaryKey(Wrongmsg record);

    //获取总数
    Integer totalCount(@Param("stuid") Long stuid, @Param("stuname") String stuname);


    List<Wrongmsg> getWrongList(@Param("stuid") Long stuid, @Param("stuname") String stuname, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public Integer totalCountStu(@Param("stuid") Long stuid);

    List<Wrongmsg> getWrongListStu(@Param("stuid") Long stuid, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
}