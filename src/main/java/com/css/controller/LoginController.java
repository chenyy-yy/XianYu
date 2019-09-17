package com.css.controller;

import com.css.entity.User;
import com.css.service.LoginService;
import com.css.util.JsonResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: rgy
 * @Date: 2019/9/17 9:19
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @Autowired
    LoginService loginService;

    @ResponseBody
    @RequestMapping(value = "login.do", produces = "text/html;charset=UTF-8")
    public JsonResponse loginIn(HttpServletRequest request) throws Exception {
        User user = new User();
        JsonResponse jsonResponse = new JsonResponse();

        List<User> userList = loginService.userLogin(user);

        if (userList != null && userList.size() == 1) {
            request.getSession().setAttribute("user",userList.get(0));//用户名存入该用户的session 中
            jsonResponse.setCode("0");
            jsonResponse.setMsg("登录成功");
        } else {
            jsonResponse.setCode("1");
            jsonResponse.setMsg("用户名或密码错误");
        }
        return jsonResponse;
    }
}