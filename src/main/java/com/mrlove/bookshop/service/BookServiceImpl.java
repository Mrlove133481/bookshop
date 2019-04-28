package com.mrlove.bookshop.service;



import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mrlove.bookshop.common.domain.Books;
import com.mrlove.bookshop.common.domain.PageResult;
import com.mrlove.bookshop.dao.BooksMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    //通过id查询图书
    @Override
    public Books getBookById(String bookId) {
        return booksMapper.getBookById(bookId);
    }
    //通过id更新图书
    @Override
    public void updateBookById(Books books) {
        booksMapper.updateBookById(books);
    }
    //前台限制查询图书默认8本
    @Override
    public List<Books> findBooks() {
        return booksMapper.findbooks();
    }
    //分页查询
    @Override
    public PageResult pagingQuery(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(booksMapper.pagingQuery());
        return new PageResult(pageInfo.getTotal(),pageInfo.getList());
    }
}
