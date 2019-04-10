package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserMapper {
    int insert(User record);

    int insertSelective(User record);
    //查询用户名是否存在
    List<User> queryUser(@Param("user") String user);
    //查询密码是否正确
    List<User> queryPwd(@Param("user") String user, @Param("password") String password);

}