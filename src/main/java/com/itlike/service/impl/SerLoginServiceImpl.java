package com.itlike.service.impl;

import com.itlike.domain.SerLogin;
import com.itlike.mapper.SerLoginMapper;
import com.itlike.service.SerLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SerLoginServiceImpl implements SerLoginService {
    @Autowired
    private SerLoginMapper serLoginMapper;
    @Override
    public SerLogin findSerlogin(SerLogin serLogin) {
        SerLogin serlogin = serLoginMapper.findSerlogin(serLogin);
        return serlogin;
    }
}
