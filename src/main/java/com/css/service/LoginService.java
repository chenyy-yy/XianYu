package com.css.service;

import com.css.entity.User;

import java.util.List;

/**
 * @Author: rgy
 * @Date: 2019/9/17 10:34
 */
public interface LoginService {
    List<User> userLogin(User user);

}
