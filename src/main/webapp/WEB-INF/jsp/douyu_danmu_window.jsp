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
<div class="admin">
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="am-g" style="display: block;height: 100%;">
                <div class="am-u-md-6" >
                    <!-- 折线图堆叠 -->
                    <div class="card-box">
                        <div  id="pie1" style="width: 100%;height: 400px;"></div>
                    </div>
                </div>

                <div class="am-u-md-6">
                    <!-- 堆叠区域图  -->
                    <div class="card-box">
                        <div  id="pie2" style="width: 100%;height: 400px;"></div>
                    </div>
                </div>
            </div>
            <div class="am-g" style="height: 100%">
                <div class="am-u-md-12">
                    <!-- Step Line -->
                    <div class="card-box">
                        <div  id="pie3" style="height: 380px;"></div>
                    </div>
                </div>

                <div class="am-u-md-6" style="display: none;">
                    <!-- 大数据面积图  -->
                    <div class="card-box">
                        <div  id="pie4" style="height: 720px;"></div>
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
<script type="text/javascript" src="../assets/js/dataTool.min.js" ></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>

</body>
<script type="text/javascript">
    function updatetop2() {
        getonlineRoom();
        $.ajax({
            url: "/douyu/danmu/getDanMuCountByWindows",
            type: "GET",
            data: {"type": "1"},
            //dataType: "jsonp",  //指定服务器返回的数据类型
            //jsonp: "callback",
            //jsonpCallback:'showVideoCateData',
            success: function (data) {
                var keys = new Array()
                var values = new Array()
                var a = 0
                console.log(keys)
                $.each(data, function (i, val) {
                    keys[a] = val._1
                    var rows = new Object()
                    rows.name = val._1 + ":" + val._2
                    rows.value = val._2
                    values[a] = rows
                    a++
                })
                console.log(keys)
                var pie1 = echarts.init(document.getElementById("pie1"));
                option = {
                    title: {
                        text: '实时词频统计',
                        subtext: '',
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        data: keys
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            mark: {show: true},
                            dataView: {show: true, readOnly: false},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    /*polar : [
                        {
                            indicator : [
                                { text : '指标一' },
                                { text : '指标二' },
                                { text : '指标三' },
                                { text : '指标四' },
                                { text : '指标五' }
                            ],
                            //center : [document.getElementById('main').offsetWidth - 250, 225],
                            radius : 100
                        }
                    ],*/
                    calculable: false,
                    series: [
                        {
                            name: '分词',
                            type: 'pie',
                            radius: [0, 110],
                            center: [250, 225],
                            data: (function () {
//                                var res = [];
//                                var len = 0;
//                                while (len++ < 5) {
//                                    res.push({
//                                        name: '随机数据' + len,
//                                        value: Math.round(Math.random()*10)
//                                    });
//                                }
                                return values;
                            })()
                        },
                        {
                            name: 'radar',
                            type: 'radar',
                            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                            data: (function () {
                                var res = [];
                                var len = 0;
                                while (len++ < 3) {
                                    res.push({
                                        name: 'data' + len,
                                        value: [
                                            Math.round(Math.random() * 100),
                                            Math.round(Math.random() * 100),
                                            Math.round(Math.random() * 100),
                                            Math.round(Math.random() * 100),
                                            Math.round(Math.random() * 100)
                                        ]
                                    });
                                }
                                return res;
                            })()
                        }
                    ]
                };
                var lastIndex = 5;
                var axisData;
                //clearInterval(timeTicket);
                timeTicket = setInterval(function () {
                })
                lastIndex += 1;
                // 动态数据接口 addData
                pie1.setOption(option);
            }
        });

        $.ajax({
            url: "/douyu/danmu/getDanMuCountByWindows",
            type: "GET",
            data: {"type": "3"},
            //dataType: "jsonp",  //指定服务器返回的数据类型
            //jsonp: "callback",
            //jsonpCallback:'showVideoCateData',
            success: function (data) {
                var keys = new Array()
                var values = new Array()
                var a = 0
                console.log(keys)
                $.each(data, function (i, val) {
                    keys[a] = val._1
                    var rows = new Object()
                    rows.name = val._1 + ":" + val._2
                    rows.value = val._2
                    values[a] = rows
                    a++
                })
                var pie2 = echarts.init(document.getElementById("pie2"));
                option = {
                    title: {
                        text: '用户活跃实时统计',
                        subtext: '',
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        data: keys
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            mark: {show: true},
                            dataView: {show: true, readOnly: false},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    /*polar : [
                        {
                            indicator : [
                                { text : '指标一' },
                                { text : '指标二' },
                                { text : '指标三' },
                                { text : '指标四' },
                                { text : '指标五' }
                            ],
                            //center : [document.getElementById('main').offsetWidth - 250, 225],
                            radius : 100
                        }
                    ],*/
                    calculable: false,
                    series: [
                        {
                            name: '昵称',
                            type: 'pie',
                            radius: [0, 110],
                            center: [250, 225],
                            data: (function () {
//                                var res = [];
//                                var len = 0;
//                                while (len++ < 5) {
//                                    res.push({
//                                        name: '随机数据' + len,
//                                        value: Math.round(Math.random()*10)
//                                    });
//                                }
                                return values;
                            })()
                        },
                        {
                            name: 'radar',
                            type: 'radar',
                            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                            data: (function () {
                                var res = [];
                                var len = 0;
                                while (len++ < 3) {
                                    res.push({
                                        name: 'data' + len,
                                        value: [
                                            Math.round(Math.random() * 100),
                                            Math.round(Math.random() * 100),
                                            Math.round(Math.random() * 100),
                                            Math.round(Math.random() * 100),
                                            Math.round(Math.random() * 100)
                                        ]
                                    });
                                }
                                return res;
                            })()
                        }
                    ]
                };
                var lastIndex = 5;
                var axisData;
                //clearInterval(timeTicket);
                timeTicket = setInterval(function () {
                })
                lastIndex += 1;
                // 动态数据接口 addData
                pie2.setOption(option);
            }

        });
    }
        updatetop2();
    setInterval(function(){updatetop2()}, 3*1000);

    var result = null
    var keys = new Array()
    var series2 = new Array()
    var myChart  = echarts.init(document.getElementById("pie3"));
    function getonlineRoom() {
        $.ajax({
            url: "/douyu/danmu/getDanMuCountByWindows",
            type: "GET",
            data: {"type": "2"},
            //dataType: "jsonp",  //指定服务器返回的数据类型
            //jsonp: "callback",
            //jsonpCallback:'showVideoCateData',
            success: function (data) {
                result = data
                console.log(result)
                var keys = new Array()
                var values = new Array()
                var keys2 = new Array()
                var values2 = new Array()
                var a = 0
                var b = 0
                var sers = new Array()
                $.each(result, function (i, val) {
                    var nseries = new Object()
                    nseries.name=val._1;
                    nseries.type='line'
                    nseries.data=[val._2,val._2,val._2,val._2,val._2,val._2,val._2,val._2,val._2,val._2]
                    sers[a] = nseries
                    keys[a] = val._1;
                    values[a] = val._2;
                    a++;
                })
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
                var pie3 = echarts.init(document.getElementById("pie3"));
                option = {
                    title : {
                        text: '拉钩网职公司领域分布',
                        subtext: ''
                    },
                    tooltip : {
                        trigger: 'axis'
                    },
                    legend: {
                        data:['数量']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',
                            data : keys
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'数量',
                            type:'bar',
                            data:values,
                            markPoint : {
                                data : [
                                    {type : 'max', name: '最大值'},
                                    {type : 'min', name: '最小值'}
                                ]
                            },
                            markLine : {
//                            data : [
//                                {type : 'average', name: '平均值'}
//                            ]
                            }
                        }
                    ]
                };


                pie3.setOption(option);
            }
        });
    }

//    function addDateRoom() {
//        var lastData = 11;
//        var axisData;
//        clearInterval(timeTicket);
//        timeTicket = setInterval(function () {
//            lastData += Math.random() * ((Math.round(Math.random() * 10) % 2) == 0 ? 1 : -1);
//            lastData = lastData.toFixed(1) - 0;
//            axisData = (new Date()).toLocaleTimeString().replace(/^\D*/, '');
//
//            // 动态数据接口 addData
//            myChart.addData([
//                [
//                    0,        // 系列索引
//                    Math.round(Math.random() * 1000), // 新增数据
//                    true,     // 新增数据是否从队列头部插入
//                    false     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
//                ]/*,
//                [
//                    1,        // 系列索引
//                    lastData, // 新增数据
//                    false,    // 新增数据是否从队列头部插入
//                    false,    // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
//                    axisData  // 坐标轴标签
//                ]*/
//            ]);
//        }, 2100);
//    }
    getonlineRoom();
//    addDateRoom();
    //setInterval(function(){addDateRoom()}, 5*1000);

    //饼状图
</script>
</html>