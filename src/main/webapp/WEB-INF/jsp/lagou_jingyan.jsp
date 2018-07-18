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

            </div>
            <div class="am-g" style="height: 100%">
                <div class="am-u-md-12">
                    <!-- Step Line -->
                    <div class="card-box">
                        <div  id="pie3" style="width: 100%;height: 720px;"></div>
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
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>

</body>
<script type="text/javascript">


    var result = null
    var keys = new Array()
    var series2 = new Array()

    $.ajax({
        url:"/superclass/getAllSchoolCount",
        type:'GET',
        success:function(data){
            $("#title").text("")
        }
    });
    $.ajax({
        url: "/lagou/lagoucompany/getJingYanXueLi",
        type: "GET",
        data:{"types":"2,5"},
        //dataType: "jsonp",  //指定服务器返回的数据类型
        //jsonp: "callback",
        //jsonpCallback:'showVideoCateData',
        success: function (data) {
            result = data
            console.log(result)
            var keys = new  Array()
            var values = new Array()
            var keys2 = new  Array()
            var values2 = new Array()
            var a = 0
            var b = 0
            $.each(result, function(i, val) {
                if(i=="2"){
                    $.each(val, function(i, val) {
                        keys[a]=val.name
                        values[a]=val.value
                        a++
                    })
                }else if(i=="5"){
                    $.each(val,function(i, val){
                        keys2[b]=val.name
                        values2[b]=val.value
                        b++
                    })
                }

            });
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
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['职位个数']
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap : false,
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
                        name:'职位个数',
                        type:'line',
                        stack: '总量',
                        data:values
                    }
                ]
            };

            pie3.setOption(option);

            var pie4 = echarts.init(document.getElementById("pie4"));
            option = {
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['学历']
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap : false,
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
                        name:'学历',
                        type:'line',
                        stack: '总量',
                        data:values2
                    }
                ]
            };

            pie4.setOption(option);
        }
    });

    //饼状图
</script>
</html>