<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>超级课程表用户所在校区分布</title>
		<link rel="stylesheet" href="/assets/css/amazeui.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/core.css" />
		<link rel="stylesheet" href="/assets/css/menu.css" />
		<link rel="stylesheet" href="/assets/css/index.css" />
		<link rel="stylesheet" href="/assets/css/admin.css" />
		<link rel="stylesheet" href="/assets/css/page/typography.css" />
	</head>
	<body>
		<div class="admin">
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<%--<div class="am-g" style="display: block;height: 100%;">
					<div class="am-u-md-6" >
						<!-- 折线图堆叠 -->
						<div class="card-box">
							<div  id="pie1" style="width: 100%;height: 400px;"></div>
						</div>
					</div>

					<div class="am-u-md-12">
						<!-- 堆叠区域图  -->
						<div class="card-box">
							<div  id="pie2" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</div>--%>
					<div id="title" class="card-box" style="margin-left: 1.5rem;margin-right: 1.5rem;" >
						据统计:截止2018年2月6日 超级课程表APP 用户学校全国分布数据统计 共
					</div>
				<div class="am-g" style="height: 100%">
					<div class="am-u-md-12">
						<!-- Step Line -->
						<div class="card-box">
							<div  id="pie3" style="width: 100%;height: 720px;"></div>
						</div>
					</div>
					
					<%--<div class="am-u-md-6">
						<!-- 大数据面积图  -->
						<div class="card-box">
							<div  id="pie4" style="width: 100%;height: 400px;"></div>
						</div>
					</div>--%>
				</div>
				
			</div>
		</div>
		</div>
		</div>
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		<script type="text/javascript" src="../assets/js/jquery-2.1.0.js" ></script>
        <%--<script type="text/javascript" src="../assets/js/amazeui.min.js"></script>
        <script type="text/javascript" src="../assets/js/app.js" ></script>
        <script type="text/javascript" src="../assets/js/blockUI.js" ></script>
        <script type="text/javascript" src="../assets/js/charts/echarts.min.js" ></script>--%>
		<%--<script type="text/javascript" src="../assets/js/charts/pieChart.js" ></script>--%>
        <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
        <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
        <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
        <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
        <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
        <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
        <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
        <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
        <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
        <script type="text/javascript" src="../echarts/macarons.js" ></script>
	</body>
	<script type="text/javascript">
        var result = null
        var keys = new Array()
        var series2 = new Array()
		$.ajax({
			url:"/superclass/getAllSchoolCount",
			type:'GET',
			success:function(data){
                $("#title").text("据统计:截止2018年2月6日 超级课程表APP 用户学校全国分布数据统计 共"+data.all+"所高校  用户在全国分布情况如下图")
			}
		});
        $.ajax({
            url: "/superclass/scoolCountByProvince",
            type: "GET",
            //dataType: "jsonp",  //指定服务器返回的数据类型
            //jsonp: "callback",
            //jsonpCallback:'showVideoCateData',
            success: function (data) {
                result = data
                //result = JSON.parse(data)
                /*result = data
                var a = 0
                $.each(result, function(i, val) {
                    var b = 0
                    keys[a] = i
                    var serie = new Object()
                    serie.name = i
                    serie.type='map'
                    serie.mapType='china'
                    serie.roam=false
                    serie.itemStyle = {
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    }
                    //serie.data=option2.series[a].data
                    serie.data=val
                    series2[a] = serie
                    //console.log(val)
                    //console.log(option2.series[a].data)
                    //text = text + "Key:" + i + ", Value:" + val;
                    a=a+1*/
                    var pie3 = echarts.init(document.getElementById("pie3"),"macarons");
                    option = {
                        title: {
                            text: '超级课程表全国用户高校分布',
                            subtext: '',
                            x: 'center'
                        },
                        tooltip: {
                            trigger: 'item'
                        },
                        legend: {
                            orient: 'vertical',
                            x: 'left',
                            data: ['用户量']
                        },
                        dataRange: {
                            x: 'left',
                            y: 'bottom',
                            splitList: [
                                {start: 3000000},
                                {start: 2000000, end: 3000000},
                                {start: 1000000, end: 2000000},
                                {start: 500000, end: 1000000},
                                {start: 300000, end: 500000},
                                //{start: 10, end: 200, label: '10 到 200（自定义label）'},
                                //{start: 5, end: 5, label: '5（自定义特殊颜色）', color: 'black'},
                                {end: 300000}
                            ],
                            color: ['#E0022B', '#E09107', '#A3E00B', '#888888', '#FF0000', '#FF00FF']
                        },
                        toolbox: {
                            show: true,
                            orient: 'vertical',
                            x: 'right',
                            y: 'center',
                            feature: {
                                mark: {show: true},
                                dataView: {show: true, readOnly: false},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                        roamController: {
                            show: true,
                            x: 'right',
                            mapTypeControl: {
                                'china': true
                            }
                        },
                        series: [
                            {
                                name: '用户量',
                                type: 'map',
                                mapType: 'china',
                                roam: false,
                                itemStyle: {
                                    normal: {
                                        label: {
                                            show: true,
                                            textStyle: {
                                                color: "rgb(249, 249, 249)"
                                            }
                                        }
                                    },
                                    emphasis: {label: {show: true}}
                                },
                                data:result/*[
                                    {name: '北京',value: Math.round(Math.random()*2000)},
                                    {name: '天津',value: Math.round(Math.random()*2000)},
                                    {name: '上海',value: Math.round(Math.random()*2000)},
                                    {name: '重庆',value: Math.round(Math.random()*2000)},
                                    {name: '河北',value: 0},
                                    {name: '河南',value: Math.round(Math.random()*2000)},
                                    {name: '云南',value: 5},
                                    {name: '辽宁',value: 305},
                                    {name: '黑龙江',value: Math.round(Math.random()*2000)},
                                    {name: '湖南',value: 200},
                                    {name: '安徽',value: Math.round(Math.random()*2000)},
                                    {name: '山东',value: Math.round(Math.random()*2000)},
                                    {name: '新疆',value: Math.round(Math.random()*2000)},
                                    {name: '江苏',value: Math.round(Math.random()*2000)},
                                    {name: '浙江',value: Math.round(Math.random()*2000)},
                                    {name: '江西',value: Math.round(Math.random()*2000)},
                                    {name: '湖北',value: Math.round(Math.random()*2000)},
                                    {name: '广西',value: Math.round(Math.random()*2000)},
                                    {name: '甘肃',value: Math.round(Math.random()*2000)},
                                    {name: '山西',value: Math.round(Math.random()*2000)},
                                    {name: '内蒙古',value: Math.round(Math.random()*2000)},
                                    {name: '陕西',value: Math.round(Math.random()*2000)},
                                    {name: '吉林',value: Math.round(Math.random()*2000)},
                                    {name: '福建',value: Math.round(Math.random()*2000)},
                                    {name: '贵州',value: Math.round(Math.random()*2000)},
                                    {name: '广东',value: Math.round(Math.random()*2000)},
                                    {name: '青海',value: Math.round(Math.random()*2000)},
                                    {name: '西藏',value: Math.round(Math.random()*2000)},
                                    {name: '四川',value: Math.round(Math.random()*2000)},
                                    {name: '宁夏',value: Math.round(Math.random()*2000)},
                                    {name: '海南',value: Math.round(Math.random()*2000)},
                                    {name: '台湾',value: Math.round(Math.random()*2000)},
                                    {name: '香港',value: Math.round(Math.random()*2000)},
                                    {name: '澳门',value: Math.round(Math.random()*2000)}
                                ]*/
                            }
                        ]
                    };
                    //console.log(option)
                    //console.log(option2)
                    pie3.setOption(option);
            }
        });
        //饼状图
    </script>
</html>
