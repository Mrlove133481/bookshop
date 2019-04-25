package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.Books;
import com.mrlove.bookshop.common.domain.PageResult;
import com.mrlove.bookshop.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@SuppressWarnings("all")
@RequestMapping("/foreground")

public class ForegroundControl {
    @Autowired
    private BookService bookService;
    //分页查询
    @RequestMapping("pagingquery")
    @ResponseBody
    public PageResult pagingQuery(int page, int rows){

        PageResult pageResult = bookService.pagingQuery(page, rows);
        List<Books> limitBooks= pageResult.getRows();
        for (Books books:limitBooks
        ) {
            books.setBookImage1(books.getBookImage1().substring(books.getBookImage1().indexOf("fileuploadpath")+16,books.getBookImage1().length()));
        }
        return pageResult;
    }

    //查询图书事件
    @RequestMapping("selectlimit")
    @ResponseBody
    public List<Books> selectAll() {
        List<Books> limitBooks = bookService.findBooks();
        for (Books books:limitBooks
             ) {
            books.setBookImage1(books.getBookImage1().substring(books.getBookImage1().indexOf("fileuploadpath")+16,books.getBookImage1().length()));
        }
       // model.addAttribute("limitBooks", limitBooks);
        //return "/index";
        return limitBooks;
    }
    //页面退出事件
    @RequestMapping("quits")
    public String quit(Model model){
            model.addAttribute("status",0);
            return "/index";
    }

    @RequestMapping("findbyid")
    @ResponseBody
    public List<Books>  findBookById(String bookId){
        List<Books> limitBooks = bookService.findBookById(bookId);
        for (Books books:limitBooks
        ) {
            books.setBookImage1(books.getBookImage1().substring(books.getBookImage1().indexOf("fileuploadpath")+16,books.getBookImage1().length()));
        }
        // model.addAttribute("limitBooks", limitBooks);
        //return "/index";
        return limitBooks;
    }

}
