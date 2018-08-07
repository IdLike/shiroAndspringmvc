package com.cl.controller;

import com.cl.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @RequestMapping("/toregister.do")
    public String  register(){
        return "/register";

    }
    @RequestMapping("/register.do")
    public  String toIndex(User user, HttpServletRequest request){

        System.out.println(user.getUsername());

        request.getSession().setAttribute("user",user);

        return "redirect:/mavenWeb/index/toIndex.do";

    }
}
