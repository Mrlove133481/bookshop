package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AddressMapper {
    int insert(Address record);

    int insertSelective(Address record);
    //查找用户所有地址
    List<Address> findaddress(@Param("userId") String userId);
    //查找默认地址
    Address finddefaultaddress(@Param("userId") String userId,@Param("addressDefault") String addressDefault);
    //设置默认地址
    void setdefaultaddress(@Param("addressId") String addressId, @Param("addressDefault") String addressDefault);

    //删除地址
    void deleteaddress(@Param("addressId") String addressId);
    //更新地址
    void updateaddress(@Param("addressId") String addressId,@Param("userId") String userId,@Param("addressReceiver") String addressReceiver,@Param("addressTelnum") String addressTelnum,@Param("addressProvince") String addressProvince,@Param("addressCity") String addressCity,@Param("addressTown") String addressTown,@Param("addressLocation") String addressLocation);
}