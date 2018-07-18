package com.wxstc.bigdata.config;

import com.wxstc.bigdata.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class CustomWebMvcConfigurerAdapter extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/page/**");  //对来自/page/** 这个链接来的请求进行拦截
    }
}