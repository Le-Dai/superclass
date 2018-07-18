<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>后台模板</title>
		<link rel="stylesheet" href="/assets/css/amazeui.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/core.css" />
		<link rel="stylesheet" href="/assets/css/menu.css" />
		<link rel="stylesheet" href="/assets/css/index.css" />
		<link rel="stylesheet" href="/assets/css/admin.css" />
		<link rel="stylesheet" href="/assets/css/page/typography.css" />
	</head>
	<body>
		<!-- Begin page -->
		<!-- end page -->
		
		
		<div class="admin">
			<!--<div class="am-g">-->
		<!-- ========== Left Sidebar Start ========== -->
		<!--<div class="left side-menu am-hide-sm-only am-u-md-1 am-padding-0">
			<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 548px;">
				<div class="sidebar-inner slimscrollleft" style="overflow: hidden; width: auto; height: 548px;">-->
                  <!-- sidebar start -->
				  <!-- sidebar end -->
    
				<!--</div>
			</div>
		</div>-->
		<!-- ========== Left Sidebar end ========== -->
		
		
		
	<!--	<div class="am-g">-->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div id="title" class="card-box" style="margin-left: 1.5rem;margin-right: 1.5rem;" >
					据统计:截止2018年2月6日 超级课程表APP 用户学校全国分布数据统计 共
				</div>
				<div class="am-g">
					<div class="am-u-md-6" >
						<!-- 折线图堆叠 -->
						<div class="card-box">
							<div  id="Stack" style="width: 100%;height: 250px;"></div>
						</div>
					</div>
					
					<div class="am-u-md-6">
						<!-- 堆叠区域图  -->
						<div class="card-box">
							<div  id="area" style="width: 100%;height: 250px;"></div>
						</div>
					</div>
				</div>
				
				<div class="am-g">
					<div class="am-u-md-6">
						<!-- Step Line -->
						<div class="card-box">
							<div  id="step" style="width: 100%;height: 250px;"></div>
						</div>
					</div>
					
					<div class="am-u-md-6">
						<!-- 大数据面积图  -->
						<div class="card-box">
							<div  id="shuju" style="width: 100%;height: 250px;"></div>
						</div>
					</div>
				</div>
				
				<div class="am-g">
					<div class="am-u-md-12">
						<!-- 动态数据+时间坐标轴 -->
						<div class="card-box">
							<div  id="trends" style="width: 100%;height: 300px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end right Content here -->
		<!--</div>-->
		</div>
		</div>
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		
		<script type="text/javascript" src="../assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="../assets/js/amazeui.min.js"></script>
		<script type="text/javascript" src="../assets/js/app.js" ></script>
		<script type="text/javascript" src="../assets/js/blockUI.js" ></script>
		<script type="text/javascript" src="../assets/js/charts/echarts.min.js" ></script>
		<script type="text/javascript" src="../assets/js/charts/lineChart.js" ></script>
	</body>
	
</html>
