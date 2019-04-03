package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Manager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ManagerMapper {
    int insert(Manager record);

    int insertSelective(Manager record);

    List<Manager> queryUser(@Param("username") String username);
    List<Manager> queryPwd(@Param("username") String username,@Param("pwd") String pwd);

}