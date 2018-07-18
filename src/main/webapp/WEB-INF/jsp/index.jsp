<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>登陆</title>
		<link rel="stylesheet" href="/assets/css/core.css" />
		<link rel="stylesheet" href="/assets/css/menu.css" />
		<link rel="stylesheet" href="/assets/css/amazeui.css" />
		<link rel="stylesheet" href="/assets/css/component.css" />
		<link rel="stylesheet" href="/assets/css/page/form.css" />
	</head>
	<body>
		<div class="account-pages">
			<div class="wrapper-page">
				<div class="text-center">
	                <a href="index" class="logo"><span>DL数据分析系统<span></span></span></a>
	            </div>
	            
	            <div class="m-t-40 card-box">
	            	<div class="text-center">
	                    <h4 class="text-uppercase font-bold m-b-0">Sign In</h4>
	                </div>
	                <div class="panel-body">
	                	<form class="am-form" action="/manage/login" method="post">
	                		<div class="am-g">
	                			<div class="am-form-group">
							      <input type="email" class="am-radius" name="Username"  placeholder="Username">
							    </div>
							
							    <div class="am-form-group form-horizontal m-t-20">
							      <input type="password" class="am-radius" name="Password"  placeholder="Password">
							    </div>
								<c:if test="${loginMsg!=null}">
							    <div class="am-form-group ">
									<label style="color: red">${loginMsg}</label>
		                           	<%--<label style="font-weight: normal;color: #999;">--%>
								        <%--<input type="checkbox" class="remeber"> Remember me--%>
								    <%--</label>--%>
		                        </div>
								</c:if>
		                        <div class="am-form-group ">
		                        	<button type="submit" class="am-btn am-btn-primary am-radius" style="width: 100%;height: 100%;">Log In</button>
		                        </div>
		                        
		                        <div class="am-form-group ">
		                        <a href="page-recoverpw" class="text-muted"><i class="fa fa-lock m-r-5"></i> Forgot your password?</a>
		                        </div>
	                		</div>

	                	</form>
							
	                </div>
	            </div>
			</div>
		</div>
	</body>
</html>
