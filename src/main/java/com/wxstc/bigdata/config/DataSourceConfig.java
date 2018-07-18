package com.wxstc.bigdata.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.baomidou.mybatisplus.spring.MybatisSqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

@Configuration
public class DataSourceConfig{

//    @Bean(name = "datasource")
//    @Primary
//    public DruidDataSource druidDataSource(){
//        return new DruidDataSource();
//    }

//    @Bean(name ="sessionFactory")
//    @ConfigurationProperties(prefix ="mybatis-plus")
//    //@ConfigurationPropertiesBinding()
//    public MybatisSqlSessionFactoryBean sqlSessionFactory2(@Qualifier(value ="datasource")DataSource dataSource){
//        MybatisSqlSessionFactoryBean bean =new MybatisSqlSessionFactoryBean();
//        bean.setDataSource(dataSource);
//        return bean;
//    }
}