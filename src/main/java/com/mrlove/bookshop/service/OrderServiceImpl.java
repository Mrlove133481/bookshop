package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Userorder;
import com.mrlove.bookshop.dao.UserorderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
   private UserorderMapper userorderMapper;
    //添加订单
    @Override
    public void addorder(Userorder userorder) {
        userorderMapper.insertSelective(userorder);
    }
    //限制查询订单
    @Override
    public List<Userorder> limitorder(int start, int end, String userId) {
        return userorderMapper.limitorder(start,end,userId);
    }
    //查询所有订单
    @Override
    public List<Userorder> allorder(String userId) {
        return userorderMapper.userorders(userId);
    }
    //获取所有订单批次
    @Override
    public List<Userorder> allbatchs(String userId) {
        return userorderMapper.allbatchs(userId);
    }
}
