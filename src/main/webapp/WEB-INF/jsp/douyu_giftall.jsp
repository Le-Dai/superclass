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
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
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
                <div class="am-u-md-12" style="display: none;">
                    <!-- 折线图堆叠 -->
                    <div id="bts" class="card-box" style="height: 200px;">
                        <div  id="pie1" style="width: 100%;height: 400px;"></div>
                    </div>
                </div>

                <div class="am-u-md-12">
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
                        <div  id="pie3" style="width: 100%;height: 400px;"></div>
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
<script type="text/javascript" src="http://echarts.baidu.com/echarts2/doc/example/www/js/chart/radar.js"></script>
<script type="text/javascript" src="../echarts/macarons.js" ></script>

</body>
<script type="text/javascript">
    var room = "9293";
    function btck(node) {
        room = $(node).text()
        getonlineRoom()
    }
    $.ajax({
        url: "/douyu/danmu/getAllGiftRoom",
        type: "GET",
        data: {"type": "1"},
        //dataType: "jsonp",  //指定服务器返回的数据类型
        //jsonp: "callback",
        //jsonpCallback:'showVideoCateData',
        success: function (data) {
            var keys = new Array()
            var values = new Array()
            var a = 0
            $.each(data, function (i, val) {
                $("#bts").append("<button type=\"button\" class=\"btn btn-primary\" onclick='btck(this);'>"+val.rid+"</button>")
            })
            console.log(keys)

            var lastIndex = 5;
            var axisData;
            //clearInterval(timeTicket);
            timeTicket = setInterval(function () {
            })
            lastIndex += 1;
            // 动态数据接口 addData
        }
    });
    function updatetop2() {
        getonlineRoom();
        $.ajax({
            url: "/douyu/danmu/getGiftAll",
            type: "GET",
            data: {"type": "3"},
            //dataType: "jsonp",  //指定服务器返回的数据类型
            //jsonp: "callback",
            //jsonpCallback:'showVideoCateData',
            success: function (data) {
                var keys = data.keys;
                var values = data.values
                var pie2 = echarts.init(document.getElementById("pie2"),'macarons');
                option = {
                    title : {
                        text: '斗鱼礼物总量分析',
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
                            magicType: {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'value',
                            boundaryGap : [0, 0.01]
                        }
                    ],
                    yAxis : [
                        {
                            type : 'category',
                            data : keys
                        }
                    ],
                    series : [
                        {
                            name:'礼物总量',
                            type:'bar',
                            data:values
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
    var data = [];
    var now = +new Date(1997, 9, 3);
    var oneDay = 24 * 3600 * 1000;
    var value = Math.random() * 1000;
    for (var i = 0; i < 1000; i++) {
        data.push(randomData());
    }
    var myChart  = echarts.init(document.getElementById("pie3"),'macarons');
    function getonlineRoom() {
        $.ajax({
            url: "/douyu/danmu/getGiftByRoomAll",
            type: "GET",
            data: {"type": room},
            //dataType: "jsonp",  //指定服务器返回的数据类型
            //jsonp: "callback",
            //jsonpCallback:'showVideoCateData',
            success: function (data) {
                result = data
                var keys = result.keys
                var values = result.values
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
                var pie3 = echarts.init(document.getElementById("pie3"),"vintage");
                option = {
                    title : {
                        text: '斗鱼直播间礼物分析',
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
                            magicType: {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'value',
                            boundaryGap : [0, 0.01]
                        }
                    ],
                    yAxis : [
                        {
                            type : 'category',
                            data : keys
                        }
                    ],
                    series : [
                        {
                            name:'礼物总量',
                            type:'bar',
                            data:values
                        }
                    ]
                };
                /*             option = {
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
                             };*/


                pie3.setOption(option);
            }
        });
    }

    function addDateRoom() {
        setInterval(function () {
            for (var i = 0; i < 10; i++) {
                data.shift();
                data.push(randomData());
            }
            chart.setOption({
                series: [{
                    data: data
                }]
            });
        }, 1000);
    }

    function randomData() {
        now = new Date(+now + oneDay);
        value = value + Math.random() * 21 - 10;
        return {
            name: now.toString(),
            value: [
                [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),
                Math.round(value)
            ]
        }
    }
    getonlineRoom();
    //addDateRoom();
    //setInterval(function(){getonlineRoom()}, 3*1000);
</script>
</html>