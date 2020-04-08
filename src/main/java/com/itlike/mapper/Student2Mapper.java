package com.itlike.mapper;

import com.itlike.domain.Student2;

import java.util.List;

public interface Student2Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(Student2 record);

    Student2 selectByPrimaryKey(Long id);

    List<Student2> selectAll();

    int updateByPrimaryKey(Student2 record);

    public Student2 findStuAll(Student2 student2);

    int updateByStuid(Student2 record);
}