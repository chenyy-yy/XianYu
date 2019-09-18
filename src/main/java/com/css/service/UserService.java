package com.css.service;

import com.css.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: rgy
 * @Date: 2019/9/17 10:34
 */
public interface UserService {
    List<User> userLogin(User user);

    User findByUser(User user);

    Integer saveUser(User user);
}
