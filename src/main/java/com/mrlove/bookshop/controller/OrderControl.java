package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.*;
import com.mrlove.bookshop.common.utils.DateUtil;
import com.mrlove.bookshop.common.utils.IdGenerator;
import com.mrlove.bookshop.service.BookService;
import com.mrlove.bookshop.service.OrderService;
import com.mrlove.bookshop.service.ShopcartService;
import com.mrlove.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderControl {
    @Autowired
    private ShopcartService shopcartService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private BookService bookService;
    //添加订单
    @RequestMapping("addorder")
    @ResponseBody
    public Result addorder(String orderReceiverlocation, String orderReceiverphone,String orderReceiver,String orderUserid,String totalmoney,String totalnumber,String liuyan, HttpSession httpSession){
        try {
            //通过userid查询返回包含购物车id的user实体类
            User users = userService.findcart(orderUserid);
            //通过user中的购物车id查询所有购物车商品
            List<Shopcart> carts = shopcartService.findcart(users.getUserShopCart());
            //把查询的结果重新排列组合成aftercart后便于后面的遍历插入
            List<Aftercart>  aftercarts = new ArrayList<>();
            for (Shopcart cart: carts
            ) {
                for (Books cartbook:cart.getBooks()
                ) {
                    Aftercart cartsub = new Aftercart();
                    cartsub.setUser(cart.getUser());
                    cartsub.setShopcartId(cart.getShopcartId());
                    cartsub.setShopcartCount(cart.getShopcartCount());
                    cartsub.setBookss(cartbook);
                    aftercarts.add(cartsub);
                }
            }
            //设置当前购物车批次
            String order_creation_batch = IdGenerator.getNumber();
            for (Aftercart shopcart:aftercarts
                ) {
                    Userorder userorder = new Userorder(IdGenerator.getID(),orderUserid,orderReceiverlocation,orderReceiverphone,
                            orderReceiver,IdGenerator.getNumber(),shopcart.getBookss().getBookId(),shopcart.getBookss().getBookName(),
                        shopcart.getBookss().getBookImage1(),shopcart.getBookss().getBookPromotionPrice(),shopcart.getShopcartCount(),
                        "0","0",null,null,null,
                        "0","0",null,
                        null,"1","0",null,
                        null,null, DateUtil.parseDateToStr(new Date(),
                        DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS),order_creation_batch,liuyan,totalnumber,totalmoney,"1",null,null);
                    orderService.addorder(userorder);
                    }
            }catch (Exception e){
            e.printStackTrace();
            return new Result(false,"更新失败");
        }
        Userorder userorder =new Userorder();
        userorder.setOrderReceiverlocation(orderReceiverlocation);
        userorder.setOrderReceiverphone(orderReceiverphone);
        userorder.setOrderReceiver(orderReceiver);
        userorder.setOrderUserid(orderUserid);
        httpSession.setAttribute("order",userorder);
        httpSession.setAttribute("totalmoney",totalmoney);
        return new Result(true,"更新成功");
    }
    //添加立即购买订单
    @RequestMapping("addnowpayorder")
    @ResponseBody
    public Result addnowpayorder(String orderReceiverlocation, String orderReceiverphone,String orderReceiver,String orderUserid,String totalmoney,String liuyan,String totalnumber,String bookId, HttpSession httpSession){
        try {
                Books books = bookService.getBookById(bookId);
                //设置当前购物车批次
                String order_creation_batch = IdGenerator.getNumber();
                Userorder userorder = new Userorder(IdGenerator.getID(),orderUserid,orderReceiverlocation,orderReceiverphone,
                        orderReceiver,IdGenerator.getNumber(),books.getBookId(),books.getBookName(),
                        books.getBookImage1(),books.getBookPromotionPrice(),totalnumber,
                        "0","0",null,null,null,
                        "0","0",null,
                        null,"1","0",null,
                        null,null, DateUtil.parseDateToStr(new Date(),
                        DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS),order_creation_batch,liuyan,totalnumber,totalmoney,"1",null,null);
                orderService.addorder(userorder);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,"更新失败");
        }
        Userorder userorder =new Userorder();
        userorder.setOrderReceiverlocation(orderReceiverlocation);
        userorder.setOrderReceiverphone(orderReceiverphone);
        userorder.setOrderReceiver(orderReceiver);
        userorder.setOrderUserid(orderUserid);
        httpSession.setAttribute("order",userorder);
        httpSession.setAttribute("totalmoney",totalmoney);
        return new Result(true,"更新成功");
    }


    //限制查询订单
    @RequestMapping("limitorder")
    @ResponseBody
    public List<Userorder> limitorder(String start, String end, String userId,HttpSession httpSession){
        List<Userorder> userorderList = orderService.limitorder(Integer.parseInt(start),Integer.parseInt(end),userId);
        for (Userorder order: userorderList
             ) {
            String image1 = order.getOderBookImage1();
            order.setOderBookImage1(image1.substring(image1.indexOf("fileuploadpath")+16,image1.length()));
        }
        return userorderList;
    }
    //查询所有订单
    @RequestMapping("allorder")
    @ResponseBody
    public List<Userorder> allorder(String userId){
        return orderService.allorder(userId);
    }
}
