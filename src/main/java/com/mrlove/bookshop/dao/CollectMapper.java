package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Collect;

public interface CollectMapper {
    int insert(Collect record);

    int insertSelective(Collect record);
}