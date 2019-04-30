package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.User;

public interface UserService {
    User findcart(String orderUser);
}
