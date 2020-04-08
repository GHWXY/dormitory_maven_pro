package com.itlike.service;

import com.itlike.domain.StuLogin;

public interface StuLoginService {
    // 通过账号和密码查询用户
    public StuLogin findStulogin(StuLogin stuLogin);


}
