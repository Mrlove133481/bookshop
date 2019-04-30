package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Userorder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserorderMapper {
    int insert(Userorder record);

    int insertSelective(Userorder record);
    //根据用户名限制查询order
    List<Userorder> limitorder(@Param("start") int start,@Param("end") int end,@Param("userId") String userId);
    //根据用户名查询所有order
    List<Userorder> userorders(@Param("userId") String userId);
}