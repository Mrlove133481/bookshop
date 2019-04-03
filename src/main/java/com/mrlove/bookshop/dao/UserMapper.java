package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.User;

public interface UserMapper {
    int insert(User record);

    int insertSelective(User record);
}