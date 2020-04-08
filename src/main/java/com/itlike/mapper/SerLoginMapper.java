package com.itlike.mapper;

import com.itlike.domain.SerLogin;

import java.util.List;

public interface SerLoginMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SerLogin record);

    SerLogin selectByPrimaryKey(Integer id);

    List<SerLogin> selectAll();

    int updateByPrimaryKey(SerLogin record);

    public SerLogin findSerlogin(SerLogin serLogin);
}