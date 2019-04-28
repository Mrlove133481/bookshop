package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Address;
import com.mrlove.bookshop.dao.AddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressMapper addressMapper;

   //添加地址
    @Override
    public void addAddress(Address address) {
        addressMapper.insertSelective(address);
    }
    //查找地址
    @Override
    public List<Address> findaddress(String userId) {
        return addressMapper.findaddress(userId);
    }


}
