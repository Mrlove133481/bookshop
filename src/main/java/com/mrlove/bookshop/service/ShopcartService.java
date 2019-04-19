package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Shopcart;

import java.util.List;

public interface ShopcartService {

    List<Shopcart> findcart(String id);

    void updatecart(String booknumber,String shopcartid,String count);
}
