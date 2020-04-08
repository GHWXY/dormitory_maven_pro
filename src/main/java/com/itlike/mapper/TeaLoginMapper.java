package com.itlike.mapper;

import com.itlike.domain.TeaLogin;

import java.util.List;

public interface TeaLoginMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TeaLogin record);

    TeaLogin selectByPrimaryKey(Integer id);

    List<TeaLogin> selectAll();

    int updateByPrimaryKey(TeaLogin record);

    public TeaLogin findTealogin(TeaLogin teaLogin);
}