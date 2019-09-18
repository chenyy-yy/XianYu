package com.css.service.impl;

import com.css.dao.UserMapper;
import com.css.entity.User;
import com.css.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: rgy
 * @Date: 2019/9/17 10:33
 */
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> userLogin(User user) {
        return userMapper.userLogin(user);
    }
}