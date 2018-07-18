package com.wxstc.bigdata;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import javax.servlet.MultipartConfigElement;

@EnableAutoConfiguration
@EnableTransactionManagement
@SpringBootApplication
@MapperScan("com.wxstc.bigdata.mapper")
public class SuperClass extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(SuperClass.class, args);
    }

    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        //文件最大
        factory.setMaxFileSize("5MB"); //KB,MB
        /// 设置总上传数据总大小
        factory.setMaxRequestSize("30MB");
        return factory.createMultipartConfig();
    }

    @Bean
    public InternalResourceViewResolver resolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

//    @Bean
//    public FreeMarkerConfigurer freeMarkerConfigurer(){
//        FreeMarkerConfigurer cf = new FreeMarkerConfigurer();
//        cf.setTemplateLoaderPath("/WEB-INF/html/");
//        return  cf;
//    }
//
//    @Bean
//    public FreeMarkerViewResolver freeMarkerViewResolver(){
//        FreeMarkerViewResolver re = new FreeMarkerViewResolver();
//        re.setSuffix(".html");
//        re.setContentType("text/html;charset=UTF-8");
//        return re;
//    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        // 注意这里要指向原先用main方法执行的Application启动类
        return builder.sources(SuperClass.class);
    }
}