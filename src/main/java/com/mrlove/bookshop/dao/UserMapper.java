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
    //查询用户名是否存在
    List<User> queryusername(@Param("username") String username);
    //查询邮箱是否存在
    List<User> queryuseremail(@Param("email") String email);
    //查询手机是否存在
    List<User> queryusertel(@Param("usertel") String usertel);
    //通过用户名查询密码
    User findUserPwd(@Param("username") String username);
    //查找用户购物车
    User findcart(@Param("userId")String userId);
}