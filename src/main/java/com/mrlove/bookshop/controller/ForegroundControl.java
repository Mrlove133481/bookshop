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
        System.out.println("page:"+page+" rows:"+rows);
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
    public List<Books> selectAll(String start,String end) {
        System.out.println("start:"+start+"end:"+end);
        List<Books> limitBooks = bookService.findBooks(Integer.parseInt(start),Integer.parseInt(end));
        for (Books books:limitBooks
             ) {
            books.setBookImage1(books.getBookImage1().substring(books.getBookImage1().indexOf("fileuploadpath")+16,books.getBookImage1().length()));
        }
        return limitBooks;
    }
    //页面退出事件
    @RequestMapping("quits")
    public String quit(Model model){
            model.addAttribute("status",0);
            return "/index";
    }

    //图书详情页
    @RequestMapping("info")

    public String bookInfo(String bookId,Model model){
        Books book = bookService.getBookById(bookId);
        book.setBookId(bookId);
        if(book.getBookImage1()!=null){
            if(!"".equals(book.getBookImage1())){
                book.setBookImage1(book.getBookImage1().substring(book.getBookImage1().indexOf("fileuploadpath") + 16, book.getBookImage1().length()));
            }else {
                book.setBookImage1("error.jpg");
            }
        }
        else {
            book.setBookImage1("error.jpg");
        }
        if (book.getBookImage2()!=null){
            if(!"".equals(book.getBookImage2())){
                book.setBookImage2(book.getBookImage2().substring(book.getBookImage2().indexOf("fileuploadpath") + 16, book.getBookImage2().length()));
            }
            else {
                book.setBookImage2("error.jpg");
            }
        }else {
            book.setBookImage2("error.jpg");
        }

        if(book.getBookImage3()!=null){
            if(!"".equals(book.getBookImage3())){
                book.setBookImage3( book.getBookImage3().substring(book.getBookImage3().indexOf("fileuploadpath") + 16, book.getBookImage3().length()));
            }
            else {
                book.setBookImage2("error.jpg");
            }
        }else {
            book.setBookImage2("error.jpg");
        }

        if(book.getBookRemark1()!=null){
            if(!"".equals(book.getBookRemark1())){
                book.setBookRemark1(book.getBookRemark1().substring(book.getBookRemark1().indexOf("fileuploadpath") + 16, book.getBookRemark1().length()));
            }
            else {
                book.setBookRemark1("error.jpg");
            }
        }else {
            book.setBookRemark1("error.jpg");
        }
        model.addAttribute("book",book);
        return "information";
    }

    //立刻购买
    @RequestMapping("nowpay")
    public String pay(String bookId,Model model){
        Books book = bookService.getBookById(bookId);
        book.setBookId(bookId);
        if(book.getBookImage1()!=null){
            if(!"".equals(book.getBookImage1())){
                book.setBookImage1(book.getBookImage1().substring(book.getBookImage1().indexOf("fileuploadpath") + 16, book.getBookImage1().length()));
            }else {
                book.setBookImage1("error.jpg");
            }
        }
        else {
            book.setBookImage1("error.jpg");
        }
        model.addAttribute("book",book);
        return "nowpay";
    }

}
