package com.mrlove.bookshop.service;

public interface LoginService {

     boolean querymanageruser(String username);
     boolean querymanagerpwd(String username, String pwd);

     boolean queryuser(String user);

     boolean querypwd(String user, String password);
}
