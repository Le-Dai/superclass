package com.wxstc.bigdata.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

@Configuration
//@ConfigurationProperties(value = "classpath:redis/redis.properties",prefix = "redis")  
public class RedisConfig {

	@Bean
    public JedisPool jedisPool(){
		JedisPoolConfig config = new JedisPoolConfig();
		config.setMaxWaitMillis(100000);
		config.setMaxIdle(10);config.setMaxTotal(100);
        //JedisPool j = new JedisPool(config,"47.94.196.195",6378);
		JedisPool j = new JedisPool(config,"47.94.196.195",6378,10000,"heiwofuwuqisiquanjiaCNM");
		return j;
    }

}