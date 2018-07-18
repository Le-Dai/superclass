package com.wxstc.bigdata.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;

@Controller
public class PageController {
    @RequestMapping("/page/{page}")
    public String toPage(@PathVariable String page,Model model,ModelAndView view){
        return page;
    }

    @RequestMapping("/page/{dir}/{page}")
    public String toPage3(@PathVariable String page,@PathVariable String dir,ModelAndView view){
        return dir+"/"+page;
    }

    @RequestMapping("/")
    public String index(){
        return "index";
    }

    /*@RequestMapping("/{page}")
    public String index(@PathVariable String page,Model model,ModelAndView view){
        return page;
    }*/

    @RequestMapping("/page/page/{page}")
    public String toPage2(@PathVariable String page,Model model){
        return page;
    }
}
