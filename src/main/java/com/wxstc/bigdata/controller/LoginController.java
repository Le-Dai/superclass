package com.wxstc.bigdata.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.SqlHelper;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
import com.wxstc.bigdata.SchoolApi.School;
import com.wxstc.bigdata.SchoolApi.SchoolApi;
import com.wxstc.bigdata.bean.School_count;
import com.wxstc.bigdata.bean.User_Login;
import com.wxstc.bigdata.mapper.school_countMapper;
import com.wxstc.bigdata.mapper.user_loginMapper;
import com.wxstc.bigdata.utils.HttpClientUtil;
import com.wxstc.bigdata.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    private user_loginMapper userMapper;

    @Autowired
    private school_countMapper schoolmapper;
    @RequestMapping("/test")
    @ResponseBody
    public String test(){
        List<School_count> all_school = schoolmapper.selectList(new EntityWrapper<School_count>().where("id>{0}",829));
        for (School_count s:all_school) {
            String jsonschool = HttpClientUtil.doGet("https://data-gkcx.eol.cn/soudaxue/queryschool.html?messtype=json&callback=jQuery183015864380664897837_1518149981528&province=&schooltype=&page=1&size=30&keyWord1=" + s.schoolName + "&schoolprop=&schoolflag=&schoolsort=&schoolid=&_=1518149982318");
            SchoolApi schoolApi = JsonUtils.jsonToPojo(jsonschool, SchoolApi.class);
            if(schoolApi==null){
                continue;
            }else {
                if(schoolApi.school==null){
                    continue;
                }
                School school = schoolApi.school.get(0);
                s.setGuanwang(String.valueOf(school.guanwang));
                s.setLevel(school.level);
                s.setProvince(school.province);
                s.setSchoolnature(String.valueOf(school.schoolnature));
                schoolmapper.updateAllColumnById(s);
            }
        }
        return "";
    }

    @RequestMapping("/manage/login")
    public String login(String Username, String Password, HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {
        String jsStr ="";
        User_Login user = SqlHelper.getObject(userMapper.selectList(new EntityWrapper<User_Login>().eq("user_name", Username).eq("pass_word", Password)));
        if(user==null){
//            jsStr = "window.alert('" + "用户名或者密码不正确!" + "');";//+"window.history.back(-1);";
//            //response.setContentType("text/html; charset=UTF-8");
//            response.getWriter().write("<script>" + jsStr + "</script>");
//            response.getWriter().flush();
            model.addAttribute("loginMsg","用户名或者密码不正确!");
            return "index";
        }
        request.getSession().setAttribute("user-token",user);
        model.addAttribute("user",user);
        return "chart_columnar";
    }
}
