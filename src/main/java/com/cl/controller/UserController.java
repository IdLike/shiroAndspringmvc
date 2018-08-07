package com.cl.controller;

import com.cl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/index")
public class UserController {

    @Autowired
    private UserService userService;
    @RequestMapping("/toIndex.do")
    public  String toIndex(){



        return  "/index";
    }


    @ResponseBody
    @RequestMapping("/data.do")
    public Map<String,Object> data(){

        Map map=new HashMap<String,Object>();
        map.put("rows",userService.findAllList());
        map.put("total",0);

        return  map;

    }





   /* @RequiresPermissions("管理员：删除")*/
    @RequestMapping("/delete.do")
    public  String deleteUser(Integer userId, HttpServletRequest request){

    //编程方式实现权限管理
     /*   Subject subject=SecurityUtils.getSubject();
        if(subject.hasRole("管理员")){
            userService.deleteUser(userId);
        }else{
            request.getSession().setAttribute("msg","对不起，您没有权限执行此操作");

        }*/

        userService.deleteUser(userId);
       return "redirect:/index/toIndex.do";
    }

}
