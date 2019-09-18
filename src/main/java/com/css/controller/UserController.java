package com.css.controller;

import com.css.entity.User;
import com.css.service.UserService;
import com.css.util.JsonResponse;
import com.css.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: rgy
 * @Date: 2019/9/17 9:19
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    UserService userService;

    @ResponseBody
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public JsonResponse loginIn(HttpServletRequest request) throws Exception {
        User user = new User();
        JsonResponse jsonResponse = new JsonResponse();
        user.setSjhm(request.getParameter("sjhm"));
        user.setPwd(MD5Utils.md52(request.getParameter("pwd")));
        List<User> userList = userService.userLogin(user);

        if (userList != null && userList.size() == 1) {
            request.getSession().setAttribute("user",userList.get(0));//用户名存入该用户的session 中
            jsonResponse.setCode("0");
            jsonResponse.setMsg("登录成功");
        } else {
            jsonResponse.setCode("-1");
            jsonResponse.setMsg("用户名或密码错误");
        }
        return jsonResponse;
    }

    @RequestMapping(value = "toHome", method = RequestMethod.GET)
    public String toHome(HttpServletRequest request) throws Exception {
        return "view/home/home";
    }
}