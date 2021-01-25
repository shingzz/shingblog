package com.zzcheng.controller;

import com.zzcheng.dao.ArticleDao;
import com.zzcheng.dao.UserDao;
import com.zzcheng.pojo.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zzcheng.pojo.User;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    ArticleDao articleDao;
    @Autowired
    UserDao userDao;

    @GetMapping(value = {"/","/index","/blog"})
    public String blogIndex(Model model, HttpServletRequest request){
        List<Article> articles = articleDao.getLists();
        model.addAttribute("articleLists", articles);
        User user = userDao.getInformation(2);
        System.out.println(user);
        model.addAttribute("userInformation",user);
        return "home/home";
    }
    @GetMapping(value = {"/blog/content/{articleId}"})
    public String blogContent(@PathVariable("articleId") Integer id, Model model){
        Article article = articleDao.getArticleById(id);

        model.addAttribute("article",article);
        return "home/content";
    }
}
