package com.bdqn.controller;

import com.bdqn.entity.TUser;
import com.bdqn.services.TUserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by 祖龙浩 on 2018/2/2.
 */
@Controller
@RequestMapping("user")
public class TUserController {
    @Autowired
    private TUserServices tUserServices;
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(TUser user, HttpSession session, Model model){
        TUser loginUser = tUserServices.login(user);
        if (loginUser != null) {
            session.setAttribute("loginUser", loginUser);
            return "main";
        } else {
            model.addAttribute("message", "用户名或密码错误");
            return "index";
        }
    }
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginUser");
        return "index";
    }
}
