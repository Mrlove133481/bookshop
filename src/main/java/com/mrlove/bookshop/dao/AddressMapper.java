package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Address;

public interface AddressMapper {
    int insert(Address record);

    int insertSelective(Address record);
}