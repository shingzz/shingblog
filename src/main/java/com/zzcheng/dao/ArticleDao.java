package com.zzcheng.dao;

import com.zzcheng.pojo.Article;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ArticleDao {
    List<Article> getLists();

    Article getArticleById(Integer articleId);

    void insertArticle(Article article);
    void updateArticle(Article article);
    void deleteArticle(Integer id);
}
