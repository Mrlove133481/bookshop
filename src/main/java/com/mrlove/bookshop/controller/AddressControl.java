package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.Address;
import com.mrlove.bookshop.common.domain.Result;
import com.mrlove.bookshop.common.utils.DateUtil;
import com.mrlove.bookshop.common.utils.IdGenerator;
import com.mrlove.bookshop.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@SuppressWarnings("all")
@RequestMapping("/address")
public class AddressControl {
    @Autowired
    private AddressService addressService;

    //添加地址
    @RequestMapping("addaddress")
    @ResponseBody
    public Result addaddress(String addressReceiver,String addressTelnum,String addressProvince,String addressCity,String addressTown,String addressLocation,String userId,String addressId){
        try {
            if("".equals(addressId)){
                Address address = new Address(IdGenerator.getID(),userId,addressReceiver,addressTelnum,addressProvince,addressCity,addressTown,addressLocation,"0","1", DateUtil.parseDateToStr(new Date(), DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS),null,null);
                addressService.addAddress(address);
            }else {
                addressService.updateaddress(addressId,userId,addressReceiver,addressTelnum,addressProvince,addressCity,addressTown,addressLocation);
            }

        }catch (Exception e){
            return new Result(false,"更新失败");
        }
        return new Result(true,"更新成功");
    }
    //查找地址
    @RequestMapping("findaddress")
    @ResponseBody
    public List<Address> findaddress(String userId){
        List<Address> addresses = addressService.findaddress(userId);
        return addresses;
    }
    //设置默认地址
    @RequestMapping("setdefaultaddress")
    @ResponseBody
    public Result setdefaultaddress(String addressId,String userId){
        try {
            addressService.setdefaultaddress(addressId,userId);
        }catch (Exception e){
            return new Result(false,"更新失败");
        }
        return new Result(true,"更新成功");
    }
    //删除地址
    @RequestMapping("deleteaddress")
    @ResponseBody
    public Result deleteaddress(String addressId){
        try {
            addressService.deleteaddress(addressId);
        }catch (Exception e){
            return new Result(false,"更新失败");
        }
        return new Result(true,"更新成功");
    }
}
