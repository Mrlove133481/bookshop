package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Collect;

import java.util.List;

public interface CollectService {
    boolean findcollectHasBook(String bookNumber, String userId);

    void addbook(Collect collect);

    List<Collect> findbook(String userId);

    void deletecollect(String bookNumber, String userId);
}
