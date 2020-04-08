package com.itlike.mapper;

import com.itlike.domain.Dorms;
import java.util.List;

public interface DormsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dorms record);

    Dorms selectByPrimaryKey(Integer id);

    List<Dorms> selectAll();

    int updateByPrimaryKey(Dorms record);

    //根据dormno查询宿舍
    public Dorms findDormsAll(Dorms dorms);
}