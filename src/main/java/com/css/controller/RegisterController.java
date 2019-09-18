package com.css.controller;

import com.css.entity.User;
import com.css.service.UserService;
import com.css.util.JsonResponse;
import com.css.util.MD5Utils;
import com.css.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class RegisterController {

    @Autowired
    UserService userService;

    @RequestMapping("/reg")
    public String reg(){
        return "view/register/reg";
    }

    @ResponseBody
    @RequestMapping("/reg_in")
    public JsonResponse regIn(HttpServletRequest request) throws Exception{
        User user = new User();
        JsonResponse jsonResponse = new JsonResponse();

        user.setSjhm(request.getParameter("sjhm"));
        user.setPwd(MD5Utils.md52(request.getParameter("pwd")));
        user.setZjhm(request.getParameter("zjhm"));
        user.setXm(request.getParameter("xm"));

        User u = userService.findByUser(user);
        if(u == null){//如果为null,则未注册
            //将user存入数据库中
            user.setId(UuidUtil.getUUID());
            user.setYhlx("0");
            user.setLrsj(new Date());
            user.setYxbz("Y");

            Integer count = userService.saveUser(user);
            if(count>0){
                jsonResponse.setCode("0");
                jsonResponse.setMsg("注册成功");
            }else{
                jsonResponse.setCode("1");
                jsonResponse.setMsg("保存失败");
            }

        }else{//已注册
            jsonResponse.setCode("1");
            jsonResponse.setMsg("用户已存在");
        }

        return jsonResponse;
    }
}
