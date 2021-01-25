package com.zzcheng.config;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BlogHandlerIntercepter implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println(request.getRequestURI()+"进入拦截器");
        HttpSession session = request.getSession();
        Object loginUser = session.getAttribute("loginUser");

        if (loginUser == null){
            request.setAttribute("msg", "没有权限，请先登录");
            response.sendRedirect("/admin/login");
            //request.getRequestDispatcher("/login").forward(request,response);
            return false;
        }else {
            return true;
        }
    }
}
