package com.wxstc.bigdata.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.wxstc.bigdata.bean.SchoolCountByProvince;
import com.wxstc.bigdata.bean.School_count;
import com.wxstc.bigdata.mapper.school_countMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SchoolCountController {
    @Autowired
    private school_countMapper school_countmapper;

    /**
     * 根据省份获取学校在全国分布数据
     * @return
     */
    @RequestMapping("/superclass/scoolCountByProvince")
    @ResponseBody
    public List<SchoolCountByProvince> scool_countByProvince(){
       /* //获取1-30万 省份学校
        List<SchoolCountByProvince> s1 = school_countmapper.schoolCountByProvince(0, 300000);
        //30万-50万
        List<SchoolCountByProvince> s2 = school_countmapper.schoolCountByProvince(300000, 500000);
        //50万-100万
        List<SchoolCountByProvince> s3 = school_countmapper.schoolCountByProvince(500000, 1000000);
        //100万-200万
        List<SchoolCountByProvince> s4 = school_countmapper.schoolCountByProvince(1000000, 2000000);
        //200万-300万
        List<SchoolCountByProvince> s5 = school_countmapper.schoolCountByProvince(2000000, 3000000);*/
        List<SchoolCountByProvince> res = school_countmapper.schoolCountByProvince(0, 3000000);
        Map<String,List<SchoolCountByProvince>> result = new LinkedHashMap();
        return res;
    }

    @RequestMapping("/superclass/getAllSchoolCount")
    @ResponseBody
    public Map<String, Integer> getAllSchoolCount(){
        Integer all = school_countmapper.selectCount(new EntityWrapper<School_count>());
        Integer benke = school_countmapper.selectCount(new EntityWrapper<School_count>().eq("level", "本科"));
        Integer zhuanke = school_countmapper.selectCount(new EntityWrapper<School_count>().eq("level", "专科"));
        Integer gongban = school_countmapper.selectCount(new EntityWrapper<School_count>().eq("schoolnature", "公办"));
        Integer minban = school_countmapper.selectCount(new EntityWrapper<School_count>().eq("schoolnature", "民办"));
        Map<String,Integer> result = new LinkedHashMap();
        result.put("all",all);
        result.put("benke",benke);
        result.put("zhuanke",zhuanke);
        result.put("gongban",gongban);
        result.put("minban",minban);
        return result;
    }
}
