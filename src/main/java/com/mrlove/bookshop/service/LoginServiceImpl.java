package com.mrlove.bookshop.service;

import com.mrlove.bookshop.common.domain.User;
import com.mrlove.bookshop.dao.ManagerMapper;
import com.mrlove.bookshop.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class LoginServiceImpl implements LoginService {
    @Autowired
    private ManagerMapper managerMapper;
    @Autowired
    private UserMapper userMapper;
    @Override
    //查询管理员名是否存在
    public boolean querymanageruser(String username) {
        if (managerMapper.queryUser(username).size() != 0) {
            return true;
        } else {
            return false;
        }
    }
    //查询管理员密码是否正确
    @Override
    public boolean querymanagerpwd(String username, String pwd) {
        if (managerMapper.queryPwd(username, pwd).size() != 0) {
            return true;
        } else {
            return false;
        }
    }
    //查询用户名是否存在
    @Override
    public boolean queryuser(String user) {
        if(userMapper.queryUser(user).size()!=0){
            return true;
        }else {
            return false;
        }
    }
    //查询用户密码是否正确
    @Override
    public Object querypwd(String user, String password) {
        if(userMapper.queryPwd(user,password).size()!=0){
            return userMapper.queryPwd(user,password);
        }else {
            return false;
        }
    }
    //用户注册
    @Override
    public void registeruser(User user) {
        userMapper.insertSelective(user);
    }
    //查询用户名是否存在
    @Override
    public boolean queryusername(String username) {

      if( userMapper.queryusername(username).size()!=0){
         return true;
      }else {
          return  false;
      }
    }
    //查询邮箱是否存在
    @Override
    public boolean queryuseremail(String email) {
        if(userMapper.queryuseremail(email).size()!=0){
            return true;
        }else {
            return  false;
        }
    }
    //查询电话是否存在
    @Override
    public boolean queryusertel(String usertel) {
        if( userMapper.queryusertel(usertel).size()!=0){
             return true;
        }else {
            return  false;
        }
    }

}
