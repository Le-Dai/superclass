package com.wxstc.bigdata.interceptor;

import com.wxstc.bigdata.bean.User_Login;
import com.wxstc.bigdata.redis.JedisClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登陆拦截器
 */
public class LoginInterceptor implements HandlerInterceptor{
    @Autowired
    private JedisClient jedisClient;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        User_Login user = (User_Login) request.getSession().getAttribute("user-token");
        if(user==null){
            //跳转到用户登陆首页
            response.sendRedirect(request.getContextPath()+"/");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
