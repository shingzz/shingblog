package com.zzcheng.controller;

import com.zzcheng.dao.ArticleDao;
import com.zzcheng.pojo.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ArticleController {
    @Autowired
    ArticleDao articleDao;

    @RequestMapping("/articleList")
    public String articleList(Model model){
        List<Article> articles = articleDao.getLists();
        model.addAttribute("articleLists", articles);
        return "admin/Article/list";
    }
    @RequestMapping("/articleAddPage")
    public String articleAddPage(){
        return "admin/Article/add";
    }
    @RequestMapping("/articleAdd1Page")
    public String articleAdd1Page(){
        return "admin/Article/add1";
    }
    @RequestMapping("/add")
    public String articleAdd(Article article){
        System.out.println(article);
        System.out.println("add成功");
        article.setArticleCommentCount(0);
        article.setArticleViewCount(0);
        article.setArticleCreateTime(new Date());
        article.setArticleUpdateTime(new Date());
        articleDao.insertArticle(article);
        return "redirect:/admin/articleList";
    }
    @RequestMapping("/articleEditPage/{articleId}")
    public String articleEditPage(@PathVariable("articleId") Integer id, Model model){
        Article article = articleDao.getArticleById(id);

        model.addAttribute("article",article);
        return "admin/Article/edit";
    }
    @RequestMapping("/edit")
    public String articleEdit(Article article){
        article.setArticleUpdateTime(new Date());
        System.out.println(article);
        articleDao.updateArticle(article);
        System.out.println("edit成功");
        return "redirect:/admin/articleList";
    }
    @RequestMapping("/save")
    @ResponseBody
    public String articleSave(Article article){
        article.setArticleUpdateTime(new Date());
        System.out.println(article);
        articleDao.updateArticle(article);
        System.out.println("edit成功");
        return "保存成功";
    }
    @RequestMapping("/articleDelete/{articleId}")
    public String articleDelete(@PathVariable("articleId")Integer id){
        articleDao.deleteArticle(id);
        return "redirect:/admin/articleList";
    }
}
