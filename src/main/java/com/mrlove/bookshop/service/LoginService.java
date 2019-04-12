package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.User;

public interface LoginService {

     boolean querymanageruser(String username);
     boolean querymanagerpwd(String username, String pwd);

     boolean queryuser(String user);

     Object querypwd(String user, String password);

     void registeruser(User user);

     boolean queryusername(String username);

     boolean queryuseremail(String email);

     boolean queryusertel(String usertel);
}
