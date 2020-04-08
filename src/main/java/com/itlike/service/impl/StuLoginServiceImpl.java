package com.itlike.service.impl;

import com.itlike.domain.StuLogin;
import com.itlike.mapper.StuLoginMapper;
import com.itlike.service.StuLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("stuLoginService")
@Transactional
public class StuLoginServiceImpl implements StuLoginService {
    @Autowired
    private StuLoginMapper stuLoginMapper;


    @Override
    public StuLogin findStulogin(StuLogin stuLogin) {
        StuLogin stulogin = stuLoginMapper.findStulogin(stuLogin);
        System.out.println("======="+stuLogin);
        return stulogin;
    }

}
