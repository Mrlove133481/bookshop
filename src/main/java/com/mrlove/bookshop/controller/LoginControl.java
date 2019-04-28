package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.common.domain.Shopcart;
import com.mrlove.bookshop.common.domain.SnAndRt;
import com.mrlove.bookshop.common.domain.User;
import com.mrlove.bookshop.common.utils.DateUtil;
import com.mrlove.bookshop.common.utils.IdGenerator;
import com.mrlove.bookshop.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.HttpCookie;
import java.util.Date;
import java.util.List;

@Controller
@SuppressWarnings("all")
@RequestMapping("/logins")
public class LoginControl {
    //控制层注入 服务层
    @Autowired
    private LoginService loginService;
    //管理员登录
    @RequestMapping("/manager")
    public String loginManager(String username, String pwd, Model model) {
      /*  String name = SecurityContextHolder.getContext().getAuthentication().*/

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
   /* @RequestMapping("test")
    @ResponseBody
    public String test(HttpServletRequest request){
        SecurityContextImpl securityContextImpl = (SecurityContextImpl) request
                .getSession().getAttribute("SPRING_SECURITY_CONTEXT");

        System.out.println( securityContextImpl.getAuthentication().getName());
        return "ssssdd";
    }*/


    //用户登录
    @RequestMapping("/user")
  /*  public String loginUser(String username,String password,Model model){

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
    }*/
    public String loginUser(Model model,HttpServletRequest request,HttpSession httpSession){

        SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
        if(securityContextImpl!=null){
            String username = securityContextImpl.getAuthentication().getName();
            User getuser = loginService.findUserPwd(username);
            httpSession.setAttribute("userimgs",getuser.getUserImage().substring(getuser.getUserImage().indexOf("useravatar")+12,getuser.getUserImage().length()));
            model.addAttribute("userimg",getuser.getUserImage().substring(getuser.getUserImage().indexOf("useravatar")+12,getuser.getUserImage().length()));
            System.out.println("userId"+getuser.getUserId());
            httpSession.setAttribute("userId",getuser.getUserId());
            httpSession.setAttribute("shopcartId",getuser.getUserShopCart());
            httpSession.setAttribute("users",getuser);
            model.addAttribute("user",getuser);
            model.addAttribute("status",1);
            return "index";
        }else {
            model.addAttribute("status",0);
            model.addAttribute("nums",4);
            return "login";
        }


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
                //密码加密
                BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
                String BCpwd = bCryptPasswordEncoder.encode(pwd);
                //生成购物车与用户唯一标识ID
                String shopcartId = IdGenerator.getNumber();
                String userId = IdGenerator.getID();

                User user = new User(userId,username,BCpwd,null,dfimg,0,null,usertel,useremail,null,null,null,shopcartId,DateUtil.parseDateToStr(new Date(), DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS),1,null,null,null,null);
                loginService.registeruser(user);
                return "login";
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
                BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
                 String BCpwd = bCryptPasswordEncoder.encode(pwd);
                User user = new User(IdGenerator.getID(),username,BCpwd,null,dfimg,0,null,usertel,useremail,null,null,null,IdGenerator.getNumber(), DateUtil.parseDateToStr(new Date(), DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS),1,null,null,null,null);
                loginService.registeruser(user);
                return "login";
            }
        }
        return "register";
    }
}
