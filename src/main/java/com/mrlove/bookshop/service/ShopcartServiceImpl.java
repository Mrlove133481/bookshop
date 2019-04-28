package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Shopcart;
import com.mrlove.bookshop.dao.ShopcartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ShopcartServiceImpl implements ShopcartService {

    @Autowired
     private ShopcartMapper shopcartMapper;

    //查询购物车商品
    @Override
    public List<Shopcart> findcart(String id) {
        return shopcartMapper.findcart(id);
    }
    //更新购物车图书数量
    @Override
    public void updatecart(String booknumber,String shopcartid, String count) {

        if("0".equals(count)){
            shopcartMapper.removecart(booknumber,shopcartid);
        } else{
            shopcartMapper.updatecart(booknumber,shopcartid,count);
        }
    }
    //添加商品到购物车
    @Override
    public void addbook(Shopcart shopcart) {
        shopcartMapper.insertSelective(shopcart);
    }
    //查看购物车是否有此编号的图书
    @Override
    public boolean findcartHasBook(String bookNumber ,String shopcartId ) {
        if(shopcartMapper.findcartHasBook(bookNumber,shopcartId).size()!=0){
            return true;
        }else {
            return false;
        }
    }
    //查询购物车图书数量
    @Override
    public Shopcart findcartBookCount(String bookNumber,String shopcartId) {
        return shopcartMapper.findcartBookCount(bookNumber,shopcartId);
    }
    //更新选中状态
    @Override
    public void updatebookremark1(String shopcartremark1, String bookNumber, String shopcartid) {
        if(shopcartremark1=="1"){
            shopcartremark1="0";
        }else {
            shopcartremark1="1";
        }
        shopcartMapper.updatebookremark1(shopcartremark1,bookNumber,shopcartid);
    }
}
