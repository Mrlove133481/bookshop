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
    //设置默认地址
    @Override
    public void setdefaultaddress(String addressId ,String userId) {
        Address address = addressMapper.finddefaultaddress(userId,"1");
        if(address!=null){
            addressMapper.setdefaultaddress(address.getAddressId(),"0");
            addressMapper.setdefaultaddress(addressId,"1");
        }else {
            addressMapper.setdefaultaddress(addressId,"1");
        }

    }
    //删除地址
    @Override
    public void deleteaddress(String addressId) {
        addressMapper.deleteaddress(addressId);
    }
    //更新地址
    @Override
    public void updateaddress(String addressId, String userId, String addressReceiver, String addressTelnum, String addressProvince, String addressCity, String addressTown, String addressLocation) {
        addressMapper.updateaddress(addressId,userId,addressReceiver,addressTelnum,addressProvince,addressCity,addressTown,addressLocation);
    }


}
