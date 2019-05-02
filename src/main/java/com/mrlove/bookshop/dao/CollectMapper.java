package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Collect;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

public interface CollectMapper {
    int insert(Collect record);

    int insertSelective(Collect record);
    //查找是否有此图书收藏夹
    List<Collect> findcollectHasBook(@Param("bookNumber") String bookNumber, @Param("userId") String userId);
    //查找图书
    List<Collect> findbook(@Param("userId") String userId);
    //取消收藏
    void deletecollect(@Param("bookNumber") String bookNumber, @Param("userId") String userId);
}