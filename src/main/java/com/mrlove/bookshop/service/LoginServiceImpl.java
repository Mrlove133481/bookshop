package com.mrlove.bookshop.service;

import com.mrlove.bookshop.dao.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class LoginServiceImpl implements LoginService {
    @Autowired
    private ManagerMapper managerMapper;

    @Override
    //查询用户名是否存在
    public boolean queryuser(String username) {
        if (managerMapper.queryUser(username).size() != 0) {
            return true;
        } else {
            return false;
        }
    }

    //查询密码是否正确
    @Override
    public boolean querypwd(String username, String pwd) {
        if (managerMapper.queryPwd(username, pwd).size() != 0) {
            return true;
        } else {
            return false;
        }
    }
}
