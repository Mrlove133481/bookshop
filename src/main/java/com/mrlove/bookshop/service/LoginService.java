package com.mrlove.bookshop.service;

public interface LoginService {

     boolean queryuser(String username);
     boolean querypwd(String username, String pwd);
}
