package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Shopcart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
@Repository
public interface ShopcartMapper {
    int insert(Shopcart record);

    int insertSelective(Shopcart record);

    //查询购物车商品
    List<Shopcart> findcart (@Param("id") String id);
    //删除购物车商品
    void removecart(@Param("booknumber") String booknumber,@Param("shopcartid") String shopcartid);
    //更新购物车数量
    void updatecart(@Param("booknumber") String booknumber,@Param("shopcartid") String shopcartid,@Param("count") String count);
    //查询购物车是否有此图书
    List<Shopcart> findcartHasBook(@Param("bookNumber") String bookNumber,@Param("shopcartid") String shopcartid);
    //查询购物车图书数量
    Shopcart findcartBookCount(@Param("bookNumber") String bookNumber,@Param("shopcartid") String shopcartid);
    //更新图书状态
    void updatebookremark1(@Param("shopcartremark1") String shopcartremark1,@Param("bookNumber") String bookNumber,@Param("shopcartid") String shopcartid);
}