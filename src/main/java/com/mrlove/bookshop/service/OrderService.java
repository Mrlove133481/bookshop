package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Userorder;

import java.util.List;

public interface OrderService {
    void addorder(Userorder userorder);

    List<Userorder> limitorder(int start, int end, String userId);

    List<Userorder> allorder(String userId);
}
