package com.zzcheng.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class BlogMvcConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/admin/login").setViewName("admin/login");
        registry.addViewController("/admin/index").setViewName("admin/index");
        registry.addViewController("/admin").setViewName("admin/index");
    }

    @Bean
    public LocaleResolver localeResolver(){
        return new BlogLocaleResolver();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new BlogHandlerIntercepter()).addPathPatterns("/admin/**").excludePathPatterns("/admin/login","/admin/signin","/admin/css/**","/admin/js/**","/admin/img/**","/admin/data/**","/admin/vendor/**");
    }
}
