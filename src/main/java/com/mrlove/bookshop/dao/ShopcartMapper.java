package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Shopcart;

public interface ShopcartMapper {
    int insert(Shopcart record);

    int insertSelective(Shopcart record);
}