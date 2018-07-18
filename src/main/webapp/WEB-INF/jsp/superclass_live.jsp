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
					据统计:超级课程表APP 用户活跃度数据统计规则:用户等级 1为僵尸用户 1-5 为普通用户 5级以上为高级用户   访问 1-50 非活跃  50-100 比较活跃  大于100 为非常活跃用户
				</div>
				<div class="am-g" >
					<div class="am-u-md-6" >
						<!-- 折线图堆叠 -->
						<div class="card-box">
							<div  id="pie1" style="width: 100%;height: 320px;"></div>
						</div>
					</div>

					<div class="am-u-md-6">
						<!-- Step Line -->
						<div class="card-box">
							<div  id="pie2" style="width: 100%;height: 320px;"></div>
						</div>
					</div>

				</div>
				<div class="am-g" >
					<div class="am-u-md-6" >
						<!-- 折线图堆叠 -->
						<div class="card-box">
							<div  id="pie3" style="width: 100%;height: 320px;"></div>
						</div>
					</div>

					<div class="am-u-md-6">
						<!-- Step Line -->
						<div class="card-box">
							<div  id="pie4" style="width: 100%;height: 320px;"></div>
						</div>
					</div>

				</div>
				<%--<div id="title" class="card-box" style="margin-left: 1.5rem;margin-right: 1.5rem;" >
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
				</div>--%>
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
	<script type="text/javascript">
        $.ajax({
            url: "/superclass/getUserLive",
            type: "GET",
            //dataType: "jsonp",  //指定服务器返回的数据类型
            //jsonp: "callback",
            //jsonpCallback:'showVideoCateData',
            success: function (data) {
                var pie1 = echarts.init(document.getElementById("pie1"));
                option = {
                    title: {
                        x: 'center',
                        text: '用户活跃度按照等级分类',
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            dataView: {show: true, readOnly: false},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    calculable: true,
                    grid: {
                        borderWidth: 0,
                        y: 80,
                        y2: 60
                    },
                    xAxis: [
                        {
                            type: 'category',
                            show: false,
                            data: ['僵尸用户', '普通用户', '高级用户']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            show: false
                        }
                    ],
                    series: [
                        {
                            name: '用户个数',
                            type: 'bar',
                            itemStyle: {
                                normal: {
                                    color: function(params) {
                                        // build a color map as your need.
                                        var colorList = [
                                            '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                            '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                            '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                        ];
                                        return colorList[params.dataIndex]
                                    },
                                    label: {
                                        show: true,
                                        position: 'top',
                                        formatter: '{b}\n{c}'
                                    }
                                }
                            },
                            data: [data.jiangshi,data.putong,data.gaoji],
                            markPoint: {
                                tooltip: {
                                    trigger: 'item',
                                    backgroundColor: 'rgba(0,0,0,0)',
                                    formatter: function(params){
                                        return '<img src="'
                                            + params.data.symbol.replace('image://', '')
                                            + '"/>';
                                    }
                                },
                                data: [
                                    {xAxis:0, y: 700, name:'僵尸用户', symbolSize:20, symbol: 'image://../asset/ico/折线图.png'},
                                    {xAxis:1, y: 700, name:'普通用户', symbolSize:20, symbol: 'image://../asset/ico/柱状图.png'},
                                    {xAxis:2, y: 700, name:'高级用户', symbolSize:20, symbol: 'image://../asset/ico/散点图.png'},
                                ]
                            }
                        }
                    ]
                };
                pie1.setOption(option);

                var pie2 = echarts.init(document.getElementById("pie2"));
                option = {
                    title : {
                        text: '用户活跃度按照等级分类',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x : 'center',
                        y : 'bottom',
                        data:['僵尸用户','普通用户','高级用户']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true,
                                type: ['pie', 'funnel']
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    series : [
                        {
                            name:'半径模式',
                            type:'pie',
                            radius : [20, 110],
                            center : ['25%', 200],
                            roseType : 'radius',
                            width: '40%',       // for funnel
                            max: 40,            // for funnel
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                },
                                emphasis : {
                                    label : {
                                        show : true
                                    },
                                    labelLine : {
                                        show : true
                                    }
                                }
                            },
                            data:[
                                {value:data.jiangshi, name:'僵尸用户'},
                                {value:data.putong, name:'普通用户'},
                                {value:data.gaoji, name:'高级用户'}
                            ]
                        },
                        {
                            name:'面积模式',
                            type:'pie',
                            radius : [30, 110],
                            center : ['75%', 200],
                            roseType : 'area',
                            x: '50%',               // for funnel
                            max: 40,                // for funnel
                            sort : 'ascending',     // for funnel
                            data:[
                                {value:data.jiangshi, name:'僵尸用户'},
                                {value:data.putong, name:'普通用户'},
                                {value:data.gaoji, name:'高级用户'}
                            ]
                        }
                    ]
                };
                pie2.setOption(option);

                var pie3 = echarts.init(document.getElementById("pie3"));
                option = {
                    title: {
                        x: 'center',
                        text: '用户活跃度总访问数分类',
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            dataView: {show: true, readOnly: false},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    calculable: true,
                    grid: {
                        borderWidth: 0,
                        y: 80,
                        y2: 60
                    },
                    xAxis: [
                        {
                            type: 'category',
                            show: false,
                            data: ['非活跃用户', '比较活跃用户', '非常活跃用户']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            show: false
                        }
                    ],
                    series: [
                        {
                            name: '用户个数',
                            type: 'bar',
                            itemStyle: {
                                normal: {
                                    color: function(params) {
                                        // build a color map as your need.
                                        var colorList = [
                                            '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                            '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                            '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                        ];
                                        return colorList[params.dataIndex]
                                    },
                                    label: {
                                        show: true,
                                        position: 'top',
                                        formatter: '{b}\n{c}'
                                    }
                                }
                            },
                            data: [data.bu,data.bijiao,data.feichang],
                            markPoint: {
                                tooltip: {
                                    trigger: 'item',
                                    backgroundColor: 'rgba(0,0,0,0)',
                                    formatter: function(params){
                                        return '<img src="'
                                            + params.data.symbol.replace('image://', '')
                                            + '"/>';
                                    }
                                },
                                data: [
                                    {xAxis:0, y: 700, name:'非活跃用户', symbolSize:20, symbol: 'image://../asset/ico/折线图.png'},
                                    {xAxis:1, y: 700, name:'比较活跃用户', symbolSize:20, symbol: 'image://../asset/ico/柱状图.png'},
                                    {xAxis:2, y: 700, name:'非常活跃用户', symbolSize:20, symbol: 'image://../asset/ico/散点图.png'},
                                ]
                            }
                        }
                    ]
                };
                pie3.setOption(option);

                var pie4 = echarts.init(document.getElementById("pie4"));
                option = {
                    title : {
                        text: '用户活跃度总访问数分类',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x : 'center',
                        y : 'bottom',
                        data:['非活跃用户','比较活跃用户','非常活跃用户']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true,
                                type: ['pie', 'funnel']
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    series : [
                        {
                            name:'半径模式',
                            type:'pie',
                            radius : [20, 110],
                            center : ['25%', 200],
                            roseType : 'radius',
                            width: '40%',       // for funnel
                            max: 40,            // for funnel
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                },
                                emphasis : {
                                    label : {
                                        show : true
                                    },
                                    labelLine : {
                                        show : true
                                    }
                                }
                            },
                            data:[
                                {value:data.bu, name:'非活跃用户'},
                                {value:data.bijiao, name:'比较活跃用户'},
                                {value:data.feichang, name:'非常活跃用户'}
                            ]
                        },
                        {
                            name:'面积模式',
                            type:'pie',
                            radius : [30, 110],
                            center : ['75%', 200],
                            roseType : 'area',
                            x: '50%',               // for funnel
                            max: 40,                // for funnel
                            sort : 'ascending',     // for funnel
                            data:[
                                {value:data.bu, name:'非活跃用户'},
                                {value:data.bijiao, name:'比较活跃用户'},
                                {value:data.feichang, name:'非常活跃用户'}
                            ]
                        }
                    ]
                };
                pie4.setOption(option);
            }
		});
	</script>
</html>
