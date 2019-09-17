package com.css.dao;

import com.css.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: rgy
 * @Date: 2019/9/17 10:37
 */
@Service("userMapper")
public interface UserMapper {

    List<User> userLogin(User user);
}
