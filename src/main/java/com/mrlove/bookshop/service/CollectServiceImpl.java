package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.Collect;
import com.mrlove.bookshop.dao.CollectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CollectServiceImpl implements CollectService {
    @Autowired
    private CollectMapper collectMapper;
    //查找是否添加过此图书
    @Override
    public boolean findcollectHasBook(String bookNumber, String userId) {
        if(collectMapper.findcollectHasBook(bookNumber,userId).size()!=0){
            return true;
        }else {
            return false;
        }
    }
    //添加图书到收藏夹
    @Override
    public void addbook(Collect collect) {
        collectMapper.insertSelective(collect);
    }
    //查找图书
    @Override
    public List<Collect> findbook(String userId) {
        return collectMapper.findbook(userId);
    }
    //取消收藏
    @Override
    public void deletecollect(String bookNumber, String userId) {
        collectMapper.deletecollect(bookNumber,userId);
    }
}
