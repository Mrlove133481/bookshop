package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.User;
import com.mrlove.bookshop.common.utils.DateUtil;
import com.mrlove.bookshop.common.utils.IdGenerator;
import com.mrlove.bookshop.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/login")
public class LoginControl {
    //控制层注入 服务层
    @Autowired
    private LoginService loginService;
    //管理员登录
    @RequestMapping("/manager")
    public String loginManager(String username, String pwd, Model model) {
        model.addAttribute("nums",0);
        if (username == "") {
            model.addAttribute("nums",1);
        } else if (username !="" && pwd =="") {
            model.addAttribute("nums",2);
        } else if (loginService.querymanageruser(username)) {
            if (loginService.querymanagerpwd(username,pwd)) {
                return "/backstagepage/hello";
            } else {
                model.addAttribute("nums",3);
            }
        } else {
            model.addAttribute("nums",4);
        }
        return "/backstagepage/Login";
    }
    //用户登录
    @RequestMapping("/user")
    public String loginUser(String username,String password,Model model){
        model.addAttribute("nums",0);
        if (username == "") {
            model.addAttribute("nums",1);
        } else if (username !="" && password =="") {
            model.addAttribute("nums",2);
        } else if (loginService.queryuser(username)) {
            if (loginService.querypwd(username,IdGenerator.getMD5String(password)) instanceof Boolean) {
                //登录失败密码错误，返回值
                model.addAttribute("nums",3);
            } else {
                List<User> listuser = ((List)loginService.querypwd(username,IdGenerator.getMD5String(password)));
                User getuser = listuser.get(0);
                model.addAttribute("userimg",getuser.getUserImage().substring(getuser.getUserImage().indexOf("useravatar")+12,getuser.getUserImage().length()));
                model.addAttribute("user",getuser);
                model.addAttribute("status",1);
                return "index";
            }
        } else {
            model.addAttribute("nums",4);
        }
        return "login";
    }
    //注册事件
    @RequestMapping("register")
    public String register(String email,String password,String phone,String code,String password1,String name,String name1,Model model){
        String pwd = "",username = "",useremail =null ,usertel =null;
        System.out.println(usertel);
       //默认头像
        String dfimg = "D:\\apache-tomcat-8.5.34\\webapps\\ROOT\\fileuploadpath\\useravatar\\\\dfimg.jpg";
        if(password == null){
            pwd = password1;
            username = name1;
            usertel = phone;
            if(loginService.queryusername(username)){
                model.addAttribute("num",1);
            }else if(loginService.queryusertel(usertel)){
                model.addAttribute("num",3);
            }else {
                User user = new User(IdGenerator.getID(),username,IdGenerator.getMD5String(pwd),null,dfimg,0,null,usertel,useremail,null,null,null,null, DateUtil.parseDateToStr(new Date(), DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS),1,null,null,null,null);
                loginService.registeruser(user);
                return loginUser(username,pwd,model);
            }
        }else {
            pwd = password;
            username = name;
            useremail = email;
            if(loginService.queryusername(username)){
                model.addAttribute("num",1);
            }else if(loginService.queryuseremail(useremail)){
                model.addAttribute("num",2);
            }else {
                User user = new User(IdGenerator.getID(),username,IdGenerator.getMD5String(pwd),null,dfimg,0,null,usertel,useremail,null,null,null,null, DateUtil.parseDateToStr(new Date(), DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS),1,null,null,null,null);
                loginService.registeruser(user);
                return loginUser(username,pwd,model);
            }
        }
        return "register";
    }
}
