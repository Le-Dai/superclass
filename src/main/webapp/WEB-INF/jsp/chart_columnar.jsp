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
<%--		<header class="am-topbar am-topbar-fixed-top" >
			&lt;%&ndash;<div class="am-topbar-left am-hide-sm-only">
                <a href="" class="logo"><span>DL数据分析系统<span></span></span><i class="zmdi zmdi-layers"></i></a>
            </div>&ndash;%&gt;

			&lt;%&ndash;<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">

					<li><h4 class="page-title">柱状图</h4></li>
				</ul>

				<ul class="am-nav am-navbar-nav am-navbar-right">
					&lt;%&ndash;<li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>&ndash;%&gt;
					&lt;%&ndash;<li class="hidden-xs am-hide-sm-only">
                        <form role="search" class="app-search">
                            <input type="text" placeholder="Search..." class="form-control">
                            <a href=""><img src="../assets/img/search.png"></a>
                        </form>
                    </li>&ndash;%&gt;
				</ul>
			</div>&ndash;%&gt;
		</header>--%>
		<!-- end page -->


		<div class="admin">
			<!--<div class="am-g">-->
		<!-- ========== Left Sidebar Start ========== -->
		<!--<div class="left side-menu am-hide-sm-only am-u-md-1 am-padding-0">
			<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 548px;">
				<div class="sidebar-inner slimscrollleft" style="overflow: hidden; width: auto; height: 548px;">-->
                  <!-- sidebar start -->
				  <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas" style="margin-top: 0px;">
				    <div class="am-offcanvas-bar admin-offcanvas-bar">
				    	<!-- User -->
						<div class="user-box am-hide-sm-only">
							<div class="" style="width: 100%;">
								<a href="" class="logo"><span>DL数据分析系统<span></span></span><i class="zmdi zmdi-layers"></i></a>
							</div>
	                        <div class="user-img">
	                            <img src="${user.avatarUrl}" alt="user-img" title="Mat Helme" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                        <h5><a href="#">${user.user_name}</a> </h5>
	                        <ul class="list-inline">
	                            <li>
	                                <a href="#">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>
	                                </a>
	                            </li>

	                            <li>
	                                <a href="#" class="text-custom">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>
	                                </a>
	                            </li>
	                        </ul>
	                    </div>
	                    <!-- End User -->

						 <ul class="am-list admin-sidebar-list">
						    <li><a href="#"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span> 超级课程表用户分析 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <li><a href="#" toPage="/page/chart_pie"  class="am-cf tocontent"> 用户性别分布</a></li>
								  <li><a href="#" toPage="/page/class_user_school" class="tocontent">用户全国分布图</a></li>
								  <li><a href="#" toPage="/page/user_school" class="tocontent">用户所在学校统计</a></li>
								  <li><a href="#" toPage="/page/superclass_live" class="tocontent">用户活跃度统计</a></li>
						 </ul>
						    </li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><i class="am-icon-line-chart" aria-hidden="true"></i> 拉钩网 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
						        <li><a href="#" class="am-cf" data-am-collapse="{target: '#collapse-nav3'}">
									<i class="am-icon-line-chart" aria-hidden="true"></i>拉钩网职位 <span class="am-icon-angle-right am-fr am-margin-right"></span>
									 </a>
									<ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav3">
										<li><a href="#" toPage="/page/laogou_jobdiqu" class="am-cf tocontent"> 地区分布</a></li>
										<li><a href="#" toPage="/page/lagou_xinzi" class="am-cf tocontent"> 薪资分布/工作类型</a></li>
										<li><a href="#" toPage="/page/lagou_jingyan" class="am-cf tocontent"> 经验年限</a></li>
										<li><a href="#" toPage="/page/lagou_xueli" class="am-cf tocontent"> 学历要求</a></li>
									</ul>
								</li>
								  <li><a href="#" class="am-cf" data-am-collapse="{target: '#collapse-nav4'}">
									  <i class="am-icon-line-chart" aria-hidden="true"></i>拉钩网公司 <span class="am-icon-angle-right am-fr am-margin-right"></span>
								  </a>
									  <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav4">
										  <li><a href="#" toPage="/page/company_ronggui" class="am-cf tocontent"> 公司融资/公司规模</a></li>
										  <li><a href="#" toPage="/page/company_area" class="am-cf tocontent"> 公司领域分类</a></li>
									  </ul>
								  </li>
						      </ul>
						    </li>
							 <li class="admin-parent">
								 <a class="am-cf" data-am-collapse="{target: '#collapse-nav6'}"><span class="am-icon-file"></span> 斗鱼 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
								 <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav6">
									 <li><a href="#" toPage="/page/douyu_danmu_set" class="am-cf tocontent"> 斗鱼直播间设置</a></li>
									 <li><a href="#" toPage="/page/douyu_danmu" class="am-cf tocontent"> 斗鱼弹幕</a></li>
									 <li><a href="#" toPage="/page/douyu_danmu_window" class="tocontent">斗鱼弹幕(spark-window 5min 10s refresh)</a></li>
									 <li><a href="#" toPage="/page/douyu_gift" class="am-cf tocontent"> 斗鱼直播间礼物</a></li>
									 <li><a href="#" toPage="/page/douyu_danmu_collect" class="am-cf tocontent"> 斗鱼弹幕汇总</a></li>
								 </ul>
							 </li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav5'}"><span class="am-icon-file"></span> WAF 防火墙数据统计 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav5">
						        <li><a href="#" toPage="/page/waf_index" class="am-cf tocontent"> 数据一览</a></li>
						      </ul>
						    </li>
						  </ul>
				</div>
				  </div>
				  <!-- sidebar end -->
    
				<!--</div>
			</div>
		</div>-->
		<!-- ========== Left Sidebar end ========== -->
		
		
		
	<!--	<div class="am-g">-->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<%--<div class="content-page">--%>
			<!-- Start content -->
			<iframe id="content" width="100%" height="100%" scrolling="no"></iframe>
			<%--<div class="content">
				<div class="am-g">
					<div class="am-u-md-6" >
						<!-- 折线图堆叠 -->
						<div class="card-box">
							<div  id="columnar1" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
					
					<div class="am-u-md-6">
						<!-- 堆叠区域图  -->
						<div class="card-box">
							<div  id="columnar2" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</div>
				
				<div class="am-g">
					<div class="am-u-md-6">
						<!-- Step Line -->
						<div class="card-box">
							<div  id="columnar3" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
					
					<div class="am-u-md-6">
						<!-- 大数据面积图  -->
						<div class="card-box">
							<div  id="columnar4" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</div>
				
			</div>
		</div>--%>
		<!-- end right Content here -->
		<!--</div>-->
		<%--</div>--%>
		</div>
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		
		<script type="text/javascript" src="../assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="../assets/js/amazeui.min.js"></script>
		<script type="text/javascript" src="../assets/js/app.js" ></script>
		<script type="text/javascript" src="../assets/js/blockUI.js" ></script>
		<script type="text/javascript" src="../assets/js/charts/echarts.min.js" ></script>
		<script type="text/javascript" src="../assets/js/charts/columnarChart.js" ></script>
	<script type="text/javascript">
		$(".tocontent").click(function () {
			$("#content").attr("src",$(this).attr("toPage"))
        })
        //$("#content").attr("src","/chart_pie");
	</script>
	</body>
	
</html>
