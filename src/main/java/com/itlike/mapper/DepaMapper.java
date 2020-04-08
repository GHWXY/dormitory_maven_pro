package com.itlike.mapper;

import com.itlike.domain.Depa;
import java.util.List;

public interface DepaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Depa record);

    Depa selectByPrimaryKey(Integer id);

    List<Depa> selectAll();

    int updateByPrimaryKey(Depa record);

    //根据学生depaid查询系别
    public Depa findDepaAll(Depa depa);
}