<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 引入Shiro标签库 -->
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
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

<title>字典表管理</title>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 
	首页 
	<span class="c-gray en">&gt;</span> 
	管理员管理 <span class="c-gray en">&gt;</span> 
	字典表管理
	<a class="btn btn-success radius r" style="line-height:0.8em;height:1.6em;width:1.6em;margin-top: 0.5em;" 
		href="javascript:location.replace(location.href);" title="刷新" >
		<i class="Hui-iconfont" style="margin-left:-0.4em">&#xe68f;</i>
	</a>
</nav>
<span id="toolbar" class="l">
	<shiro:hasPermission name="dictionary:batchdel">
		<a href="javascript:;" onclick="dictionary_batch_del()" class="btn btn-danger radius">
			<i class="Hui-iconfont">&#xe6e2;</i>批量删除
		</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="dictionary:insert">
		<a class="btn btn-primary radius" href="javascript:;" onclick="dictionary_add('添加字典表','dictionary-role-add.html','800')"><i class="Hui-iconfont">&#xe600;</i> 
			添加字典表
		</a>
	</shiro:hasPermission>
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
		url: '../system/dictionary/list.do',//ajax请求的url地址
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
			{field: 'dictionaryId',title: '编号'}, 
			{field: 'dictionaryName',title: '字典表名'}, 
			{field: 'dictionaryDesc',title: '字典表描述',},
			{field: 'parentName',title: '父字典表名',},
			//操作列的设置（删除，修改）
			/*
				formatter: 格式化这一行，回调一个函数（下方有）
			*/
			{
				field:'dictionaryId',
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
	value: 	dictionaryId值
	row:	整行数据
	index:	行号
	field:	字段名称：dictionaryId
	
	返回一个字符串，html自动解析渲染效果
*/
function operationFormatter(value, row, index, field) {
	var html = "";
	html += "<shiro:hasPermission name='dictionary:delete'>";
		html += "<span onclick='dictionary_del(this,"+value+");' style='color:red;cursor:pointer' class='glyphicon glyphicon-trash'></span>&nbsp;&nbsp;";
	html += "</shiro:hasPermission>";
	html += "<shiro:hasPermission name='dictionary:update'>";
		html += "<span onclick='dictionary_edit("+value+");' style='color:red;cursor:pointer' class='glyphicon glyphicon-pencil'></span>";
	html += "</shiro:hasPermission>";
	
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
/*字典表-增加*/
function dictionary_add() {
	layer.open({
		type: 2,
		id: 'editWindow',
		shade: false,
		area: [$(window).width()+'px', $(window).height()+'px'],
		maxmin: true,
		title: "添加字典表",
		content: '../system/dictionary/editPage.do',
		/* 遮罩层 */
		shade :0.3,
	});
}

/*字典表-编辑*/
function dictionary_edit(dictionaryId) {
	layer.open({
		type: 2,
		id: 'editWindow',
		shade: false,
		area: [$(window).width()+'px', $(window).height()+'px'],
		maxmin: true,
		title: "修改字典表",
		content: '../system/dictionary/editPage.do?dictionaryId='+dictionaryId,
		/* 遮罩层 */
		shade :0.3,
	});    
}

/*字典表-删除*/
function dictionary_del(obj, id) {
		layer.confirm('确认要删除吗？', function(index) {
		$.ajax({
			type : 'POST',
			url : '../system/dictionary/delete.do',
			dataType : 'json',
			data: {
				dictionaryId:id
			},
			success : function(data) { 
				/* 
					将返回内容提示出来,
					icon是图标，0感叹号，1对勾，
					time是显示时间 
				*/
				layer.msg(data.msg, {
					icon : data.code,
					time : 1000
				});
				/* 操作成功时，刷新表格 */
				if(data.code) {
					refreshTable();
				}
			},
               error: function(XmlHttpRequest, textStatus, errorThrown){
				layer.msg('error!',{icon:0,time:1000});
			}
		});
	});
}

/*字典表-批量删除*/
function dictionary_batch_del(id) {
	/* 获取被选中的数据 */
	var selects = $("#dataTable").bootstrapTable('getSelections');
	if(selects.length == 0) {
		layer.msg("最少选择一条需要删除的数据。",{icon:0});
		return false;
	}
	var ids = [];
	for(var i=0; i< selects.length; i++) {
		ids.push(selects[i].dictionaryId);
	}
	var idsStr = ids.toString();/* 会自动变成1,2,3,4的格式 */
	
		layer.confirm('确认要删除吗？', function(index) {
		$.ajax({
			type : 'POST',
			url : '../system/dictionary/batchDelete.do',
			dataType : 'json',
			data: {
				ids: idsStr,
			},
			success : function(data) { 
				layer.msg(data.msg, {
					icon : data.code,
					time : 1000
				});
				/* 操作成功时，刷新表格 */
				if(data.code) {
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