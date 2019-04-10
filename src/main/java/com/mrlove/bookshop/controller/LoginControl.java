package com.mrlove.bookshop.controller;

import com.mrlove.bookshop.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginControl {
    //控制层注入 服务层
    @Autowired
    private LoginService loginService;
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

    @RequestMapping("/user")
    public String loginUser(String user,String password,Model model){
        model.addAttribute("nums",0);
        if (user == "") {
            model.addAttribute("nums",1);
        } else if (user !="" && password =="") {
            model.addAttribute("nums",2);
        } else if (loginService.queryuser(user)) {
            if (loginService.querypwd(user,password)) {
                model.addAttribute("status",1);
                return "index";
            } else {
                model.addAttribute("nums",3);
            }
        } else {
            model.addAttribute("nums",4);
        }
        return "login";
    }


}
