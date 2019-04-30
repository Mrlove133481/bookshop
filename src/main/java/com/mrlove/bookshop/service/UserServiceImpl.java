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
}
