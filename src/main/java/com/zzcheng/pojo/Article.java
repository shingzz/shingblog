package com.zzcheng.pojo;

import lombok.Data;

import java.util.Date;
@Data
public class Article {
    Integer articleId;
    String articleTitle;
    String articleContent;
    String articleHtmlContent;
    Integer articleViewCount;
    Integer articleCommentCount;
    Date articleCreateTime;
    Date articleUpdateTime;
}
