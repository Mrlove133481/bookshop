package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.User;

public interface UserService {
    User findcart(String orderUser);

    User finduser(String userId);

    void updateuser(String userId, String userNickName, String oldimage, int parseInt, String userBirthday, String userTelnum, String userEmail, String userRemark1);
}
