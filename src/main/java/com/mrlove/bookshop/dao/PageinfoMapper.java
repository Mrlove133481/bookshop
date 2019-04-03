package com.mrlove.bookshop.dao;

import com.mrlove.bookshop.common.domain.Pageinfo;

public interface PageinfoMapper {
    int insert(Pageinfo record);

    int insertSelective(Pageinfo record);
}