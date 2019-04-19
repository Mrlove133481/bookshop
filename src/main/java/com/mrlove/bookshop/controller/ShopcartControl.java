package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.*;
import com.mrlove.bookshop.service.ShopcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/shopcart")
public class ShopcartControl {
    @Autowired
   private ShopcartService shopcartService;
    //查询购物车
    @RequestMapping("findcart")
    @ResponseBody
    public List<Aftercart> findcart (String id){
        String Id = "q";
        List<Shopcart> carts = shopcartService.findcart(Id);
        String image1;
        List<Aftercart>  aftercarts = new ArrayList<>();

        for (Shopcart cart: carts
             ) {

            for (Books cartbook:cart.getBooks()
                 ) {
                image1 = cartbook.getBookImage1();
                cartbook.setBookImage1(image1.substring(image1.indexOf("fileuploadpath")+16,image1.length()));
                Aftercart cartsub = new Aftercart();
                User user = new User();
                cartsub.setUser(cart.getUser());
                cartsub.setShopcartId(cart.getShopcartId());
                cartsub.setShopcartCount(cart.getShopcartCount());
                cartsub.setBookss(cartbook);
                aftercarts.add(cartsub);
            }
        }
        System.out.println(carts);
        System.out.println("-----------------------------------------------");
        System.out.println(aftercarts);
        return aftercarts;
    }
    //更新购物车
    @RequestMapping("updatecart")
    @ResponseBody
    public Result updatecart(String booknumber,String shopcartid,String count){
        System.out.println(booknumber+"----"+shopcartid+"----"+count);
      shopcartService.updatecart(booknumber,shopcartid,count);
      return new Result(true,"更新成功");
    }

}
