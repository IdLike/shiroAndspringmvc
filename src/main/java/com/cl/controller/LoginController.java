package com.cl.controller;

import com.cl.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/login")
public class LoginController {

    @RequestMapping("/tologin.do")
    public String  tologin(){

        return "/login";

    }
    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public  String login(User user, HttpServletRequest request){

         Subject subject=SecurityUtils.getSubject();
         UsernamePasswordToken token=new UsernamePasswordToken(user.getUsername(),user.getPassword());

        try {
            subject.login(token);
            subject.getSession().setAttribute("user",user);
        }catch (Exception e){
            request.setAttribute("errMsg","账号或密码错误");
           return "/login";
        }

       // System.out.println(user.getUsername());

        //request.getSession().setAttribute("user",user);

        return "redirect:/index/toIndex.do";



    }
}
