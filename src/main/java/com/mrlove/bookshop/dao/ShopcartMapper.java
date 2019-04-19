package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Shopcart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ShopcartMapper {
    int insert(Shopcart record);

    int insertSelective(Shopcart record);

    //查询购物车商品
    List<Shopcart> findcart (@Param("id") String id);
    //删除购物车商品
    void removecart(@Param("booknumber") String booknumber,@Param("shopcartid") String shopcartid);

    void updatecart(@Param("booknumber") String booknumber,@Param("shopcartid") String shopcartid,@Param("count") String count);
}