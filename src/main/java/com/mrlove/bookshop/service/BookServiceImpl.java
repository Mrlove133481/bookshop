package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Books;
import com.mrlove.bookshop.dao.BooksMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService{
    @Autowired
    private BooksMapper booksMapper;
    @Override
    public void insert(Books books) {
           booksMapper.insert(books);
    }
    //添加图书
    @Override
    public void insertSelective(Books books) {
        booksMapper.insertSelective(books);
    }
    //查询图书
    @Override
    public List<Books> findAll() {
        return booksMapper.selectbooks();
    }
    //上架图书
    @Override
    public void onbook(String bookId) {
        booksMapper.onBookById(bookId);
    }
    //下架图书
    @Override
    public void offbook(String bookId) {
        booksMapper.offBookById(bookId);
    }
    //删除图书
    @Override
    public void deleteBook(String bookId) {
        booksMapper.deleteBookById(bookId);
    }

    @Override
    public Books getBookById(String bookId) {
        return booksMapper.getBookById(bookId);
    }

    @Override
    public void updateBookById(Books books) {
        booksMapper.updateBookById(books);
    }
}
