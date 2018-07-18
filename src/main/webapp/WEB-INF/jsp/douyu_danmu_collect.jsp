<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>弹幕汇总</title>
		<link href="http://cdn.bootcss.com/bootstrap-table/1.9.1/bootstrap-table.min.css" rel="stylesheet"/>
		<script src="http://cdn.bootcss.com/bootstrap-table/1.9.1/bootstrap-table.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap-table/1.9.1/locale/bootstrap-table-zh-CN.min.js"></script>
		<link rel="stylesheet" href="/assets/css/amazeui.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/core.css" />
		<link rel="stylesheet" href="/assets/css/menu.css" />
		<link rel="stylesheet" href="/assets/css/index.css" />
		<link rel="stylesheet" href="/assets/css/admin.css" />
		<link rel="stylesheet" href="/assets/css/page/typography.css" />

		<script src="http://www.miniui.com/scripts/boot.js"></script>
		<script src="http://www.miniui.com/scripts/miniui/miniui.js"></script>
		<link rel="stylesheet" href="http://www.miniui.com/scripts/miniui/themes/default/miniui.css" />
	</head>
	<body>
	<div style="padding: 10px;">
			<div style="width:100%;">
				<div class="mini-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td style="white-space:nowrap;">
                                <input id="key" class="mini-textbox" emptyText="请输入关键字" style="width:350px;" onenter="onKeyEnter"/>
                                <a class="mini-button" onclick="search()">查询</a>
                            </td>
						</tr>
					</table>
				</div>
			</div>
			<div id="datagrid1" class="mini-datagrid" style="width:100%;height:800px;" allowResize="true"
				 url="${pageContext.request.contextPath }/douyu/danmu/getAllDanMu"  idField="id" multiSelect="true" pageSize="50"
			>
				<div property="columns">
					<!--<div type="indexcolumn"></div>        -->
					<%--<div type="checkcolumn" >选择</div>--%>
					<div field="id" width="100" headerAlign="center">ES_ID</div>
					<div field="uid" width="100" headerAlign="center">用户ID</div>
					<div field="snick" width="100" headerAlign="center" >用户昵称</div>
					<div field="content" width="100" headerAlign="center" >弹幕内容</div>
					<div field="rid" width="100" headerAlign="center" >直播间号</div>
					<div field="date" width="100" headerAlign="center" <%--renderer="onBirthdayRenderer"--%>>日期</div>
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
		<%--<script type="text/javascript" src="../assets/js/charts/pieChart.js" ></script>--%>
	</body>
	<script type="text/javascript">
        mini.parse();

        var grid = mini.get("datagrid1");
        grid.load();
        function search() {
            var key = mini.get("key").getValue();
            grid.load({ key: key });
        }
        function onKeyEnter(e) {
            search();
        }

        function onBirthdayRenderer(e) {
            pattern = "yyyy-MM-dd hh:mm:ss";
            //var value = e.value;
            //if (value) return mini.formatDate(value, 'yyyy-MM-dd HH:ss:mm');
            //return getFormatDate(new Date(e), pattern);
			var a = new Date(e);
			console.log(a)
            return e;
        }

        function getFormatDate(date, pattern) {
            if (date == undefined) {
                date = new Date();
            }
            if (pattern == undefined) {
                pattern = "yyyy-MM-dd hh:mm:ss";
            }
            return date.format(pattern);
        }

	</script>
</html>
