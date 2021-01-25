package com.zzcheng.controller;

import com.zzcheng.dao.UserDao;
import com.zzcheng.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    @Autowired
    UserDao userDao;
    @RequestMapping("/admin/signin")
    public String login(@RequestParam("loginUsername") String username, @RequestParam("loginPassword") String password, Model model, HttpSession session){
        User user = userDao.getUserByName(username);
        if(!StringUtils.isEmpty(username) && user.getUserPass().equals(password)){
            session.setAttribute("loginUser","username");
            return "redirect:/admin/index";
        }else{
            session.invalidate();
            model.addAttribute("msg","用户名或密码错误！");
            return "redirect:/admin/login";
        }
    }
    @RequestMapping("/admin/logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginUser");
        session.invalidate();
        return "redirect:/admin/login";
    }
}
