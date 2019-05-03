package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.User;
import com.mrlove.bookshop.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;
    //查找此用户的购物车
    @Override
    public User findcart(String orderUser) {
        return userMapper.findcart(orderUser);
    }
    //查找用户信息
    @Override
    public User finduser(String userId) {
        return userMapper.finduser(userId);
    }
    //更新用户信息
    @Override
    public void updateuser(String userId, String userNickName, String oldimage, int userSex, String userBirthday, String userTelnum, String userEmail, String userRemark1) {
        userMapper.updateuser(userId,userNickName,oldimage,userSex,userBirthday,userTelnum,userEmail,userRemark1);
    }
}
