package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Shopcart;

import java.util.List;

public interface ShopcartService {

    List<Shopcart> findcart(String id);

    void updatecart(String booknumber,String shopcartid,String count);

    void addbook(Shopcart shopcart);

    boolean findcartHasBook(String bookNumber,String shopcartId);

    Shopcart findcartBookCount(String bookNumber,String shopcartId);

    void updatebookremark1(String shopcartremark1, String bookNumber, String shopcartid);
}
