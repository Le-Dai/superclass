package com.wxstc.bigdata.controller;

import com.wxstc.bigdata.bean.DyRoomGift;
import com.wxstc.bigdata.bean.Es_DanMu;
import com.wxstc.bigdata.bean.GiftSum;
import com.wxstc.bigdata.bean.ScalaYuanZu;
import com.wxstc.bigdata.es.Dy_DanMuSearchRepository;
import com.wxstc.bigdata.redis.JedisClient;
import com.wxstc.bigdata.utils.JsonUtils;
import org.elasticsearch.index.query.QueryStringQueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/douyu/danmu/setDyDanMu")
    @ResponseBody
    public void setDyDanMu(){

    }

    @RequestMapping("/douyu/danmu/getGiftByRoom")
    @ResponseBody
    public Object getGiftByRoom(String type){
        String getGiftByRoom = jedisClient.get("dy_giftByRoom");
        List<DyRoomGift> dyRoomGifts = JsonUtils.jsonToList(getGiftByRoom, DyRoomGift.class);
        for (DyRoomGift row:dyRoomGifts){
            if(row.rid.equals(type)){
                return row.gifts;
            }else if(type.equals("")){
                return row.gifts;
            }
        }
        return null;
    }

    @RequestMapping("/douyu/danmu/getAllGiftRoom")
    @ResponseBody
    public Object getAllGiftRoom(){
        String getGiftByRoom = jedisClient.get("dy_giftByRoom");
        List<DyRoomGift> dyRoomGifts = JsonUtils.jsonToList(getGiftByRoom, DyRoomGift.class);
        return dyRoomGifts;
    }

    @RequestMapping("/douyu/danmu/getGiftByRoomAll")
    @ResponseBody
    public Object getGiftByRoomAll(){
        String getGiftByRoom = jedisClient.get("dy_giftByRoom");
        List<DyRoomGift> dyRoomGifts = JsonUtils.jsonToList(getGiftByRoom, DyRoomGift.class);
        HashMap<String,Object> m = new HashMap<String,Object>();

        List keys = new ArrayList();
        List values = new ArrayList();

        for (DyRoomGift row:dyRoomGifts){
            keys.add(row.rid);
            List gs = (List) row.gifts;
            long number = 0;
            for (Object s : gs){
                LinkedHashMap s1 = (LinkedHashMap) s;
                long tmp = s1.get("number")==null?0: Long.valueOf(s1.get("number").toString()) ;
                number += tmp;
            }
            values.add(number);
        }
        m.put("keys",keys);
        m.put("values",values);
        return m;
    }

    @RequestMapping("/douyu/danmu/getGiftAll")
    @ResponseBody
    public Object getGiftAll(){
        String json = jedisClient.get("dy_giftall");
        List<ScalaYuanZu> dyRoomGifts = JsonUtils.jsonToList(json, ScalaYuanZu.class);
        List keys = new ArrayList();
        List values = new ArrayList();
        HashMap<String,Object> m = new HashMap<String, Object>();
        for (ScalaYuanZu row:dyRoomGifts){
            keys.add(row._1);
            values.add(row._2);
        }
        m.put("keys",keys);
        m.put("values",values);
        return m;
    }

    @RequestMapping("/douyu/danmu/getGiftByType")
    @ResponseBody
    public Object getGiftByType(String type){
        String getGiftByRoom = jedisClient.get("dy_giftByGift");
        List<DyRoomGift> dyRoomGifts = JsonUtils.jsonToList(getGiftByRoom, DyRoomGift.class);
        return dyRoomGifts;
    }

    @RequestMapping("/douyu/danmu/getGiftByUser")
    @ResponseBody
    public Object getGiftByUser(String type){
        String getGiftByRoom = jedisClient.get("dy_giftByGift");
        List<DyRoomGift> dyRoomGifts = JsonUtils.jsonToList(getGiftByRoom, DyRoomGift.class);
        for (DyRoomGift row:dyRoomGifts){
            if(row.rid.equals(type)){
                return row.gifts;
            }else if(type.equals("")){
                return row.gifts;
            }
        }
        return null;
    }

}
