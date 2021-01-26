package com.zzcheng.controller;

import com.zzcheng.dao.ArticleDao;
import com.zzcheng.pojo.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class ArticleController {
    @Autowired
    ArticleDao articleDao;
    @Autowired
    private Environment env;
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
    @RequestMapping("/image")
    @ResponseBody
    public Map<String, Object> ImageUpload(@RequestParam(value = "editormd-image-file") MultipartFile file, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        try {
            String realPath = System.getProperties().getProperty("user.home")+"/image/";
//            String realPath = request.getServletContext().getRealPath("/");
            System.out.println(realPath);
            String fileName = file.getOriginalFilename();
            System.out.println(fileName);
            String uuid = UUID.randomUUID().toString().replace("-", "");
            fileName = uuid + "_" + fileName;
            File targetFile = new File(realPath,fileName);
            if(!targetFile.getParentFile().exists())
                targetFile.getParentFile().mkdirs();
            file.transferTo(targetFile);
            result.put("success", 1);
            result.put("message", "成功");
            result.put("url", "/image/"+fileName);
            return result;
        } catch (IOException e) {
            result.put("success", 0);
            result.put("message", "上传失败");
            return result;
        }

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
