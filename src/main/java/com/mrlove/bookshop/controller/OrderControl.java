package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.Aftercart;
import com.mrlove.bookshop.common.domain.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderControl {

    @RequestMapping("addorder")
    @ResponseBody
    public Result addorder(List<Aftercart> shopcart,String userId){


        try {
            System.out.println(shopcart);
            System.out.println(userId);

        }catch (Exception e){
            return new Result(false,"更新失败");
        }
        return new Result(true,"更新成功");
    }

}
