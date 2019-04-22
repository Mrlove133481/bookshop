package com.mrlove.bookshop.service;

import com.mrlove.bookshop.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
        grantedAuths.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        System.out.println("user："+username);

        if (username == "") {
            return null;
        } else if(userMapper.queryusername(username).size()!=0){
            System.out.println(userMapper.findUserPwd(username).getUserStatus().equals(1));
            if(userMapper.findUserPwd(username).getUserStatus().equals(1)){
                System.out.println(username+"----"+userMapper.findUserPwd(username).getUserPwd());
                return new User(username,userMapper.findUserPwd(username).getUserPwd(),grantedAuths);
            }else{
                return null;
            }
        }else{
            return null;
        }

    }


}
