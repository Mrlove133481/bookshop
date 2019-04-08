package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Books;

import java.util.List;

public interface BookService {
    //添加图书
    void insert(Books books);
    void insertSelective(Books books);
    //查询图书
    List<Books> findAll();
    //上架图书
    void onbook(String bookId);
    //下架图书
    void offbook(String bookId);
    //删除图书
    void deleteBook(String bookId);
    //通过id查询图书
    Books getBookById(String bookId);
    //通过id更新图书
    void updateBookById(Books books);
    //前台限制查询图书8本
    List<Books> findBooks();
}
