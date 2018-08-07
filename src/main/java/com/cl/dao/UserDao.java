package com.cl.dao;

import com.cl.annotation.MyAnnotation;
import com.cl.entity.User;

import java.util.List;

@MyAnnotation
public interface UserDao {

    public List<User> findAll();

    public  void deleteUserRolesByUserId(Integer userId);

    public  void deleteUserByUserId(Integer userId);

    public User findUsersByUsername(String username);
}
