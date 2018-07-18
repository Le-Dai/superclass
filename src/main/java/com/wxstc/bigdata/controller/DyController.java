package com.wxstc.bigdata.controller;

import com.sun.org.apache.bcel.internal.util.ClassPath;
import com.wxstc.bigdata.bean.Es_DanMu;
import com.wxstc.bigdata.bean.ScalaYuanZu;
import com.wxstc.bigdata.es.Dy_DanMuSearchRepository;
import com.wxstc.bigdata.redis.JedisClient;
import com.wxstc.bigdata.utils.JsonUtils;
import org.elasticsearch.index.query.QueryStringQueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.*;

@Controller
public class DyController {
    @Autowired
    private JedisClient jedisClient;

    @Autowired
    private Dy_DanMuSearchRepository dy_danMuSearchRepository;

    @RequestMapping("/douyu/danmu/getDanMuCount")
    @ResponseBody
    public List<ScalaYuanZu> getDanMuCount(int type){
        if(type==1){
            String dy_danmu_words = jedisClient.get("dy_danmu_words");
            if("".equals(dy_danmu_words)){
                return null;
            }else {
                List<ScalaYuanZu> scalaYuanZus = JsonUtils.jsonToList(dy_danmu_words, ScalaYuanZu.class);
                return scalaYuanZus;
            }
        }else if(type==2){
            String dy_danmu_words = jedisClient.get("dy_danmu_room");
            if("".equals(dy_danmu_words)){
                return null;
            }else {
                List<ScalaYuanZu> scalaYuanZus = JsonUtils.jsonToList(dy_danmu_words, ScalaYuanZu.class);
                return scalaYuanZus;
            }
        }else if(type==3){
            String dy_danmu_words = jedisClient.get("dy_danmu_liveUser");
            if("".equals(dy_danmu_words)){
                return null;
            }else {
                List<ScalaYuanZu> scalaYuanZus = JsonUtils.jsonToList(dy_danmu_words, ScalaYuanZu.class);
                return scalaYuanZus;
            }
        }
        return null;
    }

    @RequestMapping("/douyu/danmu/getDanMuCountByWindows")
    @ResponseBody
    public List<ScalaYuanZu> getDanMuCountByWindows(int type){
        if(type==1){
            String dy_danmu_words = jedisClient.get("dy_danmu_wordsWindow");
            if("".equals(dy_danmu_words)){
                return null;
            }else {
                List<ScalaYuanZu> scalaYuanZus = JsonUtils.jsonToList(dy_danmu_words, ScalaYuanZu.class);
                return scalaYuanZus;
            }
        }else if(type==2){
            String dy_danmu_words = jedisClient.get("dy_danmu_roomWindow");
            if("".equals(dy_danmu_words)){
                return null;
            }else {
                List<ScalaYuanZu> scalaYuanZus = JsonUtils.jsonToList(dy_danmu_words, ScalaYuanZu.class);
                return scalaYuanZus;
            }
        }else if(type==3){
            String dy_danmu_words = jedisClient.get("dy_danmu_liveUserWindow");
            if("".equals(dy_danmu_words)){
                return null;
            }else {
                List<ScalaYuanZu> scalaYuanZus = JsonUtils.jsonToList(dy_danmu_words, ScalaYuanZu.class);
                return scalaYuanZus;
            }
        }
        return null;
    }

    @RequestMapping("/douyu/danmu/getAllDanMu")
    @ResponseBody
    public Map<String, Object> getAllDanMu(String qs,@RequestParam(defaultValue = "0") int pageIndex, @RequestParam(defaultValue = "10") int pageSize,String key){
        Map<String,Object> res = new HashMap<String,Object>();
        Pageable pageable = new PageRequest(pageIndex,pageSize);
        if(key==null){
            Page<Es_DanMu> search = dy_danMuSearchRepository.findAll(pageable);
            res.put("total",search.getTotalElements());
            res.put("data",search.getContent());
            return res;
        }
        String queryString = key;//搜索关键字
        key = key==null?"":key;
        QueryStringQueryBuilder builder = new QueryStringQueryBuilder(queryString);
        Page<Es_DanMu> search = dy_danMuSearchRepository.search(builder, pageable);

        res.put("total",search.getTotalElements());
        res.put("data",search.getContent());
        return res;
    }

}
