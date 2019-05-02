package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.Collect;
import com.mrlove.bookshop.common.domain.Result;
import com.mrlove.bookshop.common.utils.DateUtil;
import com.mrlove.bookshop.common.utils.IdGenerator;
import com.mrlove.bookshop.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/collect")
public class CollectControl {
    @Autowired
    private CollectService collectService;

    //添加书籍到收藏
    @RequestMapping("addbook")
    @ResponseBody
    public Result addbook (String bookNumber, String userId){
        try{
            //有此编号书就不管，否则添加图书
            if(collectService.findcollectHasBook(bookNumber,userId)){

            }else {
                Collect collect = new Collect(IdGenerator.getID(),userId,bookNumber,"1",DateUtil.parseDateToStr(new Date(), DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS),null,null);
                collectService.addbook(collect);
            }

        }catch (Exception e){
            return new Result(false,"添加失败");
        }
        return new Result(true,"添加成功");
    }
    //查询收藏
    @RequestMapping("findbook")
    @ResponseBody
    public List<Collect> findbook (String userId){
        System.out.println(userId);
        List<Collect> collects = collectService.findbook(userId);
        for (Collect collect:collects
             ) {
            String image1 =collect.getBooks().getBookImage1();
            collect.getBooks().setBookImage1(image1.substring(image1.indexOf("fileuploadpath")+16,image1.length()));
        }

        return collects;
    }
    //取消收藏
    @RequestMapping("deletecollect")
    @ResponseBody
    public Result deletecollect (String bookNumber, String userId){
        try{
           collectService.deletecollect(bookNumber,userId);
        }catch (Exception e){
            return new Result(false,"添加失败");
        }
        return new Result(true,"添加成功");
    }

}
