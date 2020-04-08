package com.itlike.mapper;

import com.itlike.domain.StuLogin;
import java.util.List;

public interface StuLoginMapper {
    int deleteByPrimaryKey(Integer slId);

    int insert(StuLogin record);

    StuLogin selectByPrimaryKey(Integer slId);

    List<StuLogin> selectAll();

    int updateByPrimaryKey(StuLogin record);

    public StuLogin findStulogin(StuLogin stuLogin);

}