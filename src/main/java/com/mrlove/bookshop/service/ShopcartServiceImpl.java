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


    @Override
    public List<Shopcart> findcart(String id) {
        return shopcartMapper.findcart(id);
    }

    @Override
    public void updatecart(String booknumber,String shopcartid, String count) {

        if("0".equals(count)){
            shopcartMapper.removecart(booknumber,shopcartid);
        } else{
            shopcartMapper.updatecart(booknumber,shopcartid,count);
        }
    }
}
