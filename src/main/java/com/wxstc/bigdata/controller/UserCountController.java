package com.wxstc.bigdata.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.SqlHelper;
import com.wxstc.bigdata.bean.User_distribution;
import com.wxstc.bigdata.bean.User_live;
import com.wxstc.bigdata.bean.User_rate;
import com.wxstc.bigdata.mapper.user_distributionMapper;
import com.wxstc.bigdata.mapper.user_liveMapper;
import com.wxstc.bigdata.mapper.user_rateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.LinkedHashMap;
import java.util.Map;

@Controller
public class UserCountController {
    @Autowired
    private user_distributionMapper user_distributionmapper;

    @Autowired
    private user_rateMapper user_ratemapper;

    @Autowired
    private user_liveMapper user_livemapper;
    @RequestMapping("/superclass/userCountBySex")
    @ResponseBody
    public User_distribution userCountBySex(){
        User_distribution user_distribution = SqlHelper.getObject(user_distributionmapper.selectList(new EntityWrapper<User_distribution>()));
        return user_distribution;
    }

    @RequestMapping("/superclass/getUserLive")
    @ResponseBody
    public Map<String, Long> getUserLive(){
        User_rate rate = SqlHelper.getObject(user_ratemapper.selectList(new EntityWrapper<User_rate>()));
        User_live live = SqlHelper.getObject(user_livemapper.selectList(new EntityWrapper<User_live>()));
        Map<String, Long> result = new LinkedHashMap<String, Long>();
        result.put("jiangshi",rate.die);
        result.put("putong",rate.general);
        result.put("gaoji",rate.senior);
        result.put("bu",live.inactive);
        result.put("bijiao",live.more_active);
        result.put("feichang",live.very_active);
        return result;
    }
}
