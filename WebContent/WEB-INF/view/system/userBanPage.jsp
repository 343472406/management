<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 设置页面的 基本路径 -->
<c:set var="basePath" value="${pageContext.request.scheme}://${pageContext.request.serverName}
:${pageContext.request.serverPort}${pageContext.request.contextPath}/resources/" />

<!DOCTYPE HTML>
<html>
<head>
<!-- 设置页面的 基本路径，页面所有资源引入和页面的跳转全部基于 base路径 -->
<base href="${basePath}">

<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap-3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap-table/bootstrap-table.min.css" />

<title>员工管理</title>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 
	首页 
	<span class="c-gray en">&gt;</span> 
	管理员管理 <span class="c-gray en">&gt;</span> 
	员工管理
	<a class="btn btn-success radius r" style="line-height:0.8em;height:1.6em;width:1.6em;margin-top: 0.5em;" 
		href="javascript:location.replace(location.href);" title="刷新" >
		<i class="Hui-iconfont" style="margin-left:-0.4em">&#xe68f;</i>
	</a>
</nav>
<span id="toolbar" class="l">
</span>

<!-- 用bootstarp做的表格 -->
<table id="dataTable"></table>


<!-- jquery -->
<script type="text/javascript" src="jquery/1.11.3/jquery.min.js"></script> 
<!--_footer 作为公共模版分离出去-->
<!-- <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>  -->
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>

<!-- bootstrap -->
<script type="text/javascript" src="bootstrap/bootstrap-3.3.7/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="bootstrap/bootstrap-table/bootstrap-table.min.js"></script> 
<script type="text/javascript" src="bootstrap/bootstrap-table/bootstrap-table-zh-CN.min.js"></script> 



<script type="text/javascript">
$(function() {
	/* 使用bootstrap初始化表格 */
	$('#dataTable').bootstrapTable({
		url: '../system/user/userBanList.do',//ajax请求的url地址
		/*
			ajax请求以后回调函数的处理
			后台使用返回的PageInfo对象中的 结果 级的key是list，总条数是total
			而前台bootstrapTable插件需要的数据的key叫做rows ，总条数也是叫做total
			那么出现一个问题 : 总条数的key能对上，结果集对不上，就需要在ajax请求完成回调
			responseHandler 这个函数方法处理一下
			并且在自定义一个 json,rows做为key，返回json的 list作为值
				total：还是total
			这样才能满足 bootstrapTable插件数据的需要
		*/
		responseHandler: function(res) { 
			/*
				res: 后台分页对象PageInfo返回对应的json对象
				res.list : 结果集
				res.total : 总记录数
				
				将后台数据的key改为rows和total
			*/
			var data =  {rows: res.list,total: res.total};
			return data;
		},
		pagination: true,//显示分页条
		toolbar: "#toolbar",//顶部显示的工具条（添加和批量删除的）
		contentType: 'application/x-www-form-urlencoded',//条件搜索的时候ajax请求给后台数据的数据类型（条件搜索post提交必须设置）
		search: true,//是否显示搜索框
		pageNumber: 1,//默认的页面 第一页
		pageSize: 10,//默认的每页条数
		pageList:[10,25,50,100],//每页能显示的条数
		sidePagination: "server",//是否是服务器分页，每次请求都是对应的10条数据，下一页重新发送ajax请求
		paginationHAlign: 'right', //底部分页条
		/* showToggle: true, //是否显示详细视图和列表视图的切换按钮 */
		/* cardView: false, //是否默认显示详细视图 */
		/* showColumns: true, //是否显示所有的列 */
		showRefresh: true, //是否显示刷新按钮
		columns: [ //表格显示数据对应的表头设置，
			{ checkbox: true},//是否显示前台的复选框（多选）
			/*
				每列数据的表头的设置
				filed:返回json数据对应数据的key
				title:表头要显示的名
			*/
			{field: 'userId',title: '编号'}, 
			{field: 'realname',title: '姓名'}, 
			{field: 'gender',title: '性别',formatter:genderFormatter},
			{field: 'deptName',title: '科室'},
			{field: 'jobName',title: '职务'},
			{field: 'phone',title: '手机号'},
			{field: 'age',title: '年龄'},
			//操作列的设置（删除，修改）
			/*
				formatter: 格式化这一行，回调一个函数（下方有）
			*/
			{
				field:'userId',
				title:'操作',
				align:'center',
				formatter:operationFormatter,
		}],
		/* 设置ajax请求后台的参数
			params:bootstraptable 传递给后台的默认参数名称
			函数可以直接返回一个参数对象，设置给传递给后台的各种参数名称和值
		*/
		queryParams:function(params) {
			var paramsData = {keyword:params.search,
								pageSize:params.limit,
								pageNum:params.offset/params.limit+1}
			return paramsData;
		}
	});
})
	
/*
	列格式化函数
	value: 	userId值
	row:	整行数据
	index:	行号
	field:	字段名称：userId
	
	返回一个字符串，html自动解析渲染效果
*/
function operationFormatter(value, row, index, field) {
	var html = "";
	/* 管理员可以启用员工 */
	html += "<button onclick='user_switchStatus("+value+",\"启用\");' style='cursor:pointer' class='btn btn-danger radius'>启用</button>&nbsp;&nbsp;";
	
	return html;
}
function genderFormatter(value, row, index, field) {
	var html = "";
	if(value == 1) {
		html = "男";
	} else if(value == 2) {
		html = "女";
	} else {
		html = "性别有误";
	}
	return html;
}
	
</script>


<script type="text/javascript">
/*
	 参数解释：
	 title	标题
	 url		请求的url
	 id		需要操作的数据id
	 w		弹出层宽度（缺省调默认值）
	 h		弹出层高度（缺省调默认值）
 */

/* 切换员工状态 */
function user_switchStatus(userId, msg) {
	layer.confirm('确认要'+ msg +'吗？', function(index) {
		$.ajax({
			type : 'POST',
			url : '../system/user/switchStatus.do',
			dataType : 'json',
			data: {
				userId: userId,
			},
			success : function(data) { 
				layer.msg(data.msg, {
					icon : data.code,
					time : 1000
				});
				/* 操作成功时，刷新表格 */
				if(data.code) {
					/* 刷新父级表格 */
					parent.$('[name=refresh]').click();
					/* 刷新自己表格 */
					refreshTable();
				}
			},
               error: function(XmlHttpRequest, textStatus, errorThrown){
				layer.msg('error!',{icon:0,time:1000});
			}
		});
	});
}


/* 刷新表格 */
function refreshTable() {
	$("#dataTable").bootstrapTable('refresh');
}
</script>
</body>
</html>