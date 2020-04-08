package com.itlike.mapper;

import com.itlike.domain.Major;
import java.util.List;

public interface MajorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Major record);

    Major selectByPrimaryKey(Integer id);

    List<Major> selectAll();

    int updateByPrimaryKey(Major record);

    //根据majorid查询专业
    public Major findMajorAll(Major major);
}