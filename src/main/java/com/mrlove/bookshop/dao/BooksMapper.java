package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Books;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BooksMapper {
    int insert(Books record);

    int insertSelective(Books record);
    //查询图书
    List<Books> selectbooks();
    //上架图书
    void onBookById(@Param("bookId") String bookId);
    //下架图书
    void offBookById(@Param("bookId") String bookId);
    //删除图书
    void deleteBookById(@Param("bookId") String bookId);
    //通过id查询图书
    Books getBookById(@Param("bookId") String bookId);
    //通过id修改图书
    void updateBookById(Books books);
    //前台限制查询图书默认8本
    List<Books> findbooks(@Param("start") int start,@Param("end") int end);
    //分页查询
    List<Books> pagingQuery();
}