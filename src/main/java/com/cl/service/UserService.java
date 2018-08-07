package com.cl.service;

import com.cl.dao.UserDao;
import com.cl.entity.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@org.springframework.stereotype.Service
public class UserService {

    @Autowired
    private UserDao userDao;
    public  List<User> findAllList(){


       // System.out.println(userDao.findAll());
       return userDao.findAll();

}

    public void  deleteUser(Integer userId){

        userDao.deleteUserRolesByUserId(userId);
        userDao.deleteUserByUserId(userId);

    }

    public  User findUsersByUsername(String username){

        return userDao.findUsersByUsername(username);

    }
}
