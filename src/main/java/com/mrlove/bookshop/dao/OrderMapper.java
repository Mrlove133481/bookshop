package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Order;

public interface OrderMapper {
    int insert(Order record);

    int insertSelective(Order record);
}