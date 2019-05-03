package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Address;

import java.util.List;

public interface AddressService {
    void addAddress(Address address);

    List<Address> findaddress(String userId);

    void setdefaultaddress(String addressId,String userId);

    void deleteaddress(String addressId);

    void updateaddress(String addressId, String userId, String addressReceiver, String addressTelnum, String addressProvince, String addressCity, String addressTown, String addressLocation);
}
