package com.itlike.service.impl;

import com.itlike.domain.TeaLogin;
import com.itlike.mapper.TeaLoginMapper;
import com.itlike.service.TeaLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TeaLoginServiceImpl implements TeaLoginService {
    @Autowired
    private TeaLoginMapper teaLoginMapper;
    @Override
    public TeaLogin findTealogin(TeaLogin teaLogin) {
        TeaLogin tealogin = teaLoginMapper.findTealogin(teaLogin);
        return tealogin;
    }
}
