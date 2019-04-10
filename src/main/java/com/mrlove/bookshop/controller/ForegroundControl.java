package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.Books;
import com.mrlove.bookshop.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@SuppressWarnings("all")
@RequestMapping("/foreground")

public class ForegroundControl {
    @Autowired
    private BookService bookService;

    //查询图书事件
    @RequestMapping("selectlimit")
    public String selectAll(Model model) {
        List<Books> limitBooks = bookService.findBooks();
        for (Books books:limitBooks
             ) {
            books.setBookImage1(books.getBookImage1().substring(books.getBookImage1().indexOf("fileuploadpath")+16,books.getBookImage1().length()));
        }
        model.addAttribute("limitBooks", limitBooks);
        return "/index";
    }
    //页面退出事件
    @RequestMapping("quits")
    public String quit(Model model){
            model.addAttribute("status",0);
            return "/index";
    }

    @RequestMapping("test")
    public String  text(){
        return "/index";
    }

}
