package com.wxstc.bigdata.config;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.NoHandlerFoundException;

/**
 * 全局捕获异常
 * @author L
 *
 */
@ControllerAdvice
public class GlobalDeaultExceptionHander {
	
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public String deafaultExceptionHander(HttpServletRequest request,Exception e,HttpServletResponse response) throws IOException{
		e.printStackTrace();
		if(e.getClass().equals(NoHandlerFoundException.class)){
			return null;
		}
		String jsStr = "window.alert('" + "服务器繁忙，请稍后再试!" + "');";//+"window.history.back(-1);";
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write("<script>" + jsStr + "</script>");
		response.getWriter().flush();
		return null;
	} 
}
