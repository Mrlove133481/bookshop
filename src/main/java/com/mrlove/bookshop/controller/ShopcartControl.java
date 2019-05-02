package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.*;
import com.mrlove.bookshop.common.utils.DateUtil;
import com.mrlove.bookshop.service.ShopcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/shopcart")
public class ShopcartControl {
    @Autowired
   private ShopcartService shopcartService;
    //查询购物车
    @RequestMapping("findcart")
    @ResponseBody
    public List<Aftercart> findcart (String shopcartId, Model model){
        List<Shopcart> carts = shopcartService.findcart(shopcartId);
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
        return aftercarts;
    }
    //更新购物车
    @RequestMapping("updatecart")
    @ResponseBody
    public Result updatecart(String booknumber,String shopcartid,String count){

        try {
            shopcartService.updatecart(booknumber,shopcartid,count);
        }catch (Exception e){
            return new Result(false,"更新失败");
        }
      return new Result(true,"更新成功");
    }

    //是否选中
    @RequestMapping("ischecked")
    @ResponseBody
    public Result ischecked(String shopcartremark1,String bookNumber,String shopcartid){
    //    System.out.println("shopcartremark1:"+shopcartremark1+"bookNumber"+bookNumber+"shopcartid"+shopcartid);
        try {
            shopcartService.updatebookremark1(shopcartremark1,bookNumber,shopcartid);
        }catch (Exception e){
            return new Result(false,"更新失败");
        }
        return new Result(true,"更新成功");
    }

    //添加书籍到购物车
    @RequestMapping("addbook")
    @ResponseBody
    public Result addbook (String bookNumber,String userId,String shopcartId,String bookCount){
        if("".equals(bookCount)||bookCount==null){
            bookCount = "1";
        }
        try{
            //有此编号书就更新图书数量，否则添加图书
            if(shopcartService.findcartHasBook(bookNumber,shopcartId)){
               bookCount =(1+(Integer.parseInt(shopcartService.findcartBookCount(bookNumber,shopcartId).getShopcartCount())))+"";
                shopcartService.updatecart(bookNumber,shopcartId,bookCount);
            }else {
                Shopcart shopcart = new Shopcart(shopcartId,userId,bookNumber,bookCount,"1", DateUtil.parseDateToStr(new Date(), DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS),"1",null,null,null);
                shopcartService.addbook(shopcart);
            }

        }catch (Exception e){
            return new Result(false,"添加失败");
        }
        return new Result(true,"添加成功");
    }

}
