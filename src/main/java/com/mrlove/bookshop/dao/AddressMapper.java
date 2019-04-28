package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AddressMapper {
    int insert(Address record);

    int insertSelective(Address record);
    //查找用户所有地址
    List<Address> findaddress(@Param("userId") String userId);
}