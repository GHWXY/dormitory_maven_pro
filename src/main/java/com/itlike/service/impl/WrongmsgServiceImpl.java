package com.itlike.service.impl;

import com.itlike.domain.Wrongmsg;
import com.itlike.mapper.WrongmsgMapper;
import com.itlike.service.WrongmsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WrongmsgServiceImpl implements WrongmsgService {
    @Autowired
    private WrongmsgMapper wrongmsgMapper;

    //插入学生违纪信息
    @Override
    public void addWrongmsg(Wrongmsg wrongmsg) {
         wrongmsgMapper.insert(wrongmsg);
    }
}
