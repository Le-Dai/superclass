<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>学校分布</title>
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
				<div id="title" class="card-box" style="margin-left: 1.5rem;margin-right: 1.5rem;" >
					据统计:截止2018年2月6日 超级课程表APP 用户数据统计 总共用户:XX  男用户:XX 女用户:XX
				</div>
				<div class="am-g" >
					<div class="am-u-md-6" >
						<!-- 折线图堆叠 -->
						<div class="card-box">
							<div  id="pie1" style="width: 100%;height: 720px;"></div>
						</div>
					</div>

					<div class="am-u-md-6">
						<!-- Step Line -->
						<div class="card-box">
							<div  id="pie3" style="width: 100%;height: 720px;"></div>
						</div>
					</div>

				</div>
				
				<div class="am-g" style="display: none;">
					<div class="am-u-md-6">
						<!-- 堆叠区域图  -->
						<div class="card-box">
							<div  id="pie2" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
					
					<div class="am-u-md-6">
						<!-- 大数据面积图  -->
						<div class="card-box">
							<div  id="pie4" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		</div>
		</div>
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		
		<script type="text/javascript" src="../assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="../assets/js/amazeui.min.js"></script>
		<script type="text/javascript" src="../assets/js/app.js" ></script>
		<script type="text/javascript" src="../assets/js/blockUI.js" ></script>
		<script type="text/javascript" src="../assets/js/charts/echarts.min.js" ></script>
        <script type="text/javascript" src="../echarts/macarons.js" ></script>

        <%--<script type="text/javascript" src="../assets/js/charts/pieChart.js" ></script>--%>
	</body>
	<script type="text/javascript">
        $.ajax({
            url: "/superclass/getAllSchoolCount",
            type: "GET",
            //dataType: "jsonp",  //指定服务器返回的数据类型
            //jsonp: "callback",
            //jsonpCallback:'showVideoCateData',
            success: function (data) {
                $("#title").text("据统计:截止2018年2月6日 超级课程表APP 用户学校全国分布数据统计 共"+data.all+"所高校  其中本科院校"+data.benke+"所  专科院校"+data.zhuanke+"所  公办院校"+data.gongban+"所  民办院校"+data.minban+"所  有部分学校在全国高校网站未查询到相关信息未计入统计。")
                var pie1 = echarts.init(document.getElementById("pie1"),"macarons");

                option = {

                    title : {
                        text: "超级课程表用户学校等级分布",
                        x: 'center'
                    },

                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b}: {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        x: 'left',
                        data:['本科','专科']
                    },
                    series: [
                        {
                            name:'用户性别',
                            type:'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center'
                                },
                                emphasis: {
                                    show: true,
                                    textStyle: {
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: false
                                }
                            },
                            data:[
                                {value:data.benke, name:'本科'},
                                {value:data.zhuanke, name:'专科'}
                            ]
                        }
                    ]
                };

                pie1.setOption(option);

                var pie3 = echarts.init(document.getElementById("pie3"),"macarons");

                option = {
                    title : {
                        text: '超级课程表用户学校类别分布',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: ['公办','民办']
                    },
                    series : [
                        {
                            name: '所占比例',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:[
                                {value:data.gongban, name:'公办'},
                                {value:data.minban, name:'民办'}
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };

                pie3.setOption(option);
            }
		});
        /*----------------------饼状图-----------------------*/
        //环形图
        /*(function(){

            var pie1 = echarts.init(document.getElementById("pie1"));

            option = {

                title : {
                    text: "环形图",
                    x: 'center'
                },

                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
                },
                series: [
                    {
                        name:'访问来源',
                        type:'pie',
                        radius: ['50%', '70%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {
                                show: true,
                                textStyle: {
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:[
                            {value:335, name:'直接访问'},
                            {value:310, name:'邮件营销'},
                            {value:234, name:'联盟广告'},
                            {value:135, name:'视频广告'},
                            {value:1548, name:'搜索引擎'}
                        ]
                    }
                ]
            };

            pie1.setOption(option);
        })();


        //嵌套环形图
        (function(){

            var pie2 = echarts.init(document.getElementById("pie2"));

            option = {

                title : {
                    text: "环形图",
                    x: 'center'
                },

                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data:['直达','营销广告','搜索引擎','邮件营销','联盟广告','视频广告','百度','谷歌','必应','其他',
					'3','4','5','6','7','8','10','11','12','13','14','15'
					]
                },
                series: [
                    {
                        name:'比例',
                        type:'pie',
                        selectedMode: 'single',
                        radius: [0, '30%'],

                        label: {
                            normal: {
                                position: 'inner'
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:[
                            {value:335, name:'直达', selected:true},
                            {value:679, name:'营销广告'},
                            {value:1548, name:'搜索引擎'},
                            {value:679, name:'3'},
                            {value:679, name:'4'},
                            {value:679, name:'5'},
                            {value:679, name:'6'},
                            {value:679, name:'7'},
                            {value:679, name:'8'},
                            {value:679, name:'9'},
                            {value:679, name:'10'},
                            {value:679, name:'11'},
                            {value:679, name:'13'},
                            {value:679, name:'14'},
                            {value:679, name:'15'},
                            {value:679, name:'16'},
                            {value:679, name:'17'}
                        ]
                    }/!*,
                    {
                        name:'访问来源',
                        type:'pie',
                        radius: ['40%', '55%'],

                        data:[
                            {value:335, name:'直达'},
                            {value:310, name:'邮件营销'},
                            {value:234, name:'联盟广告'},
                            {value:135, name:'视频广告'},
                            {value:1048, name:'百度'},
                            {value:251, name:'谷歌'},
                            {value:147, name:'必应'},
                            {value:102, name:'其他'}
                        ]
                    }*!/
                ]
            };
            pie2.setOption(option);

            var pie3 = echarts.init(document.getElementById("pie3"));

            option = {
                title : {
                    text: '超级课程表用户性别分布',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['男','女']
                },
                series : [
                    {
                        name: '所占比例',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:[
                            {value:data.man_count, name:'男'},
                            {value:data.girl_count, name:'女'},
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };

            pie3.setOption(option);
        })();


        //饼状图
        (function(){

            var pie3 = echarts.init(document.getElementById("pie3"));

            option = {
                title : {
                    text: '超级课程表用户性别分布',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['男','女']
                },
                series : [
                    {
                        name: '所占比例',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:[
                            {value:335, name:'男'},
                            {value:310, name:'女'},
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };

            pie3.setOption(option);
        })();


        //南丁格尔玫瑰图
        (function(){

            var pie4 = echarts.init(document.getElementById("pie4"));

            option = {
                title : {
                    text: '南丁格尔玫瑰图',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    x : 'center',
                    y : 'bottom',
                    data:['男','女']
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
                        center : ['25%', '50%'],
                        roseType : 'radius',
                        label: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        lableLine: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        data:[
                            {value:10, name:'男'},
                            {value:5, name:'女'}
                        ]
                    },
                    {
                        name:'面积模式',
                        type:'pie',
                        radius : [30, 110],
                        center : ['75%', '50%'],
                        roseType : 'area',
                        data:[
                            {value:10, name:'男'},
                            {value:5, name:'女'}
                        ]
                    }
                ]
            };

            pie4.setOption(option);
        })();*/
	</script>
</html>
