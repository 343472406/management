<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 设置页面的 基本路径 -->
<c:set var="basePath" value="${pageContext.request.scheme}://${pageContext.request.serverName}
:${pageContext.request.serverPort}${pageContext.request.contextPath}/resources/" />

<!DOCTYPE HTML>
<html>
<head>
<!-- 设置页面的 基本路径，页面所有资源引入和页面的跳转全部基于 base路径 -->
<base href="${basePath}">

<!--_meta 作为公共模版分离出去-->
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,job-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<!-- 引入zTree，做权限的树状表 -->
<link rel="stylesheet" href="zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">

<!--/meta 作为公共模版分离出去-->

<title>职位 - 好医生医疗诊所 v1.0.0</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="jobForm">
		<!-- 有id时才显示，没有（新增）时不显示 -->
		<c:if test="${not empty job.jobId}">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">编号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${job.jobId}" placeholder="" id="jobId" name="jobId" readonly>
				</div>
			</div>
		</c:if>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>职位名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${job.jobName}" placeholder="请输入职位名" id="jobName" name="jobName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea class="textarea" rows="5" cols="201" id="jobDesc" name="jobDesc">${job.jobDesc}</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>权限：</label>
			<div class="formControls col-xs-8 col-sm-9">
			    <ul id="permissionTree" class="ztree"></ul>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-3" style="position:absolute;bottom:50px;right:20px;">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;取消&nbsp;&nbsp;" onclick="parent.layer.close(parent.layer.getFrameIndex(window.name));">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>

<!-- 引入zTree，做权限的树状表 -->
<script type="text/javascript" src="zTree_v3/js/jquery.ztree.all.min.js"></script>

<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//表单验证
	$("#jobForm").validate({
		rules:{
			jobName:{
				required:true,
			},
		},
		/* 校验失败的提示信息 */
		messages: {
			jobName:{
				required:"职位名不能为空",
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		/* 校验成功的处理 */
		submitHandler:function(form){
			/* 整理权限列表，只需要ids */
			var permissions = getCheckedData();
			var jobPermissions = [];
			for(var i=0; i<permissions.length; i++) {
				jobPermissions.push(permissions[i].permissionId);
			}
			if(!jobPermissions.length) {
				layer.msg("请选择至少一项权限",{icon:0,time:1000});
				return false;
			}
			$(form).ajaxSubmit({
				type: 'post',
				url: "${job}"==""?"../system/job/insert.do":"../system/job/update.do",
				data: {
					/* 自动会配参数 */
					/* 额外配置选中的权限(String类型) */
					jobPermissions: jobPermissions.toString(),
				},
				success: function(data){
					layer.msg(data.msg,
						{icon:data.code,time:1000},
						/* 回调函数 */
						function(layero){
							if(data.code) {
								/* 获取窗口号码，刷新父级表格、关闭窗口 */
								var index = parent.layer.getFrameIndex(window.name);
								parent.$('[name=refresh]').click();
								parent.layer.close(index);
							}
						});
				},
                error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('error!',{icon:0,time:1000});
				}
			});
		}
	});


});
</script>

<script type="text/javascript"> -->
/* zTree的设置对象 */
var setting = {
	/* 异步加载 */
	async: {
		enable: true,
		url:"../system/permission/getAllPermission.do",
		/* 数据过滤，在请求后、渲染前，对数据进行预先处理 */
		dataFilter: ajaxDataFilter,
	},
	data: {
		/* 支持简单数据（不需要多级） */
		simpleData: {
			enable: true,
			/* 设置id名称和pId名称对应字段 */
			idKey:"permissionId",
			pIdKey:"parentId",
		},
		/* 默认显示字段为name，不同时应当手动设置 */
		key: {
			name:"permissionName",
		}
	},
	/* 显示复选框 */
	check: {
		enable: true,
		/* 
			Y选中时影响s子选项，
			N取消选中时影响p父选项和s子选项。
			也就是选中时连带子，取消了一个则父取消。
			问题：子全选时不会选中父。
			
			默认是ps、ps，选子带中父，子空父空，选父带子。
		*/
		/* chkboxType: { "Y": "s", "N": "ps" }, */
	},
	/* 异步的回调函数 */
	callback: {
		/* 异步加载成功的回调 */
		onAsyncSuccess:zTreeOnAsyncSuccess,
	}
};

function ajaxDataFilter(treeId, parentNode, responseData) {
	if(responseData) {
		//var selectedList = "${job.jobPermissions}".split(",");
		for(var i=0; i<responseData.length; i++) {
			/* 清空url地址，防止跳转 */
			responseData[i].url = null;
			/* 默认都展开 */
			responseData[i].open = true;
		}
	}
	/* 不返回会直接没有内容 */
	return responseData;
}

/* 获取zTree中选中的数据 */
function getCheckedData() {
	/* 不是id选择器，没有#。但是用的是id */
	var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
	var data = treeObj.getCheckedNodes(true);
	return data;
}

/* 异步加载成功的回调 */
function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
	/* 判断已选中 */
	if(!"${job.jobPermissions}") {
		return false;
	}
	var jobPermissionsArr = "${job.jobPermissions}".split(",");
	var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
	for(var i=0; i<jobPermissionsArr.length; i++) {
		var permissionId = jobPermissionsArr[i];
		/* 根据属性获取到对应树节点 */
		/*
			key			String
			需要精确匹配的属性名称
			value		?
			需要精确匹配的属性值，可以是任何类型，只要保证与 key 指定的属性值保持一致即可
			parentNode	JSON
			搜索范围，指定在某个父节点下的子节点中进行搜索(默认全部节点范围)
		*/
		var node = treeObj.getNodeByParam("permissionId", permissionId, null);
		/* 选中对应节点 */
		/*
			treeNodeJSON
			需要勾选 或 取消勾选 的节点数据(zTree对象)
			checkedBoolean
				checked = true 表示勾选节点
				checked = false 表示节点取消勾选
				省略此参数，则根据对此节点的勾选状态进行 toggle 切换
				不影响 treeNode.nocheck = true 的节点。
			checkTypeFlagBoolean
				checkTypeFlag = true 表示按照 setting.check.chkboxType 属性进行父子节点的勾选联动操作
				checkTypeFlag = false 表示只修改此节点勾选状态，无任何勾选联动操作
					checkTypeFlag = false 且 treeNode.checked = checked 时，不会触发回调函数，直接返回
				不影响父子节点中 treeNode.nocheck = true 的节点。
			callbackFlagBoolean
				callbackFlag = true 表示执行此方法时触发 beforeCheck & onCheck 事件回调函数
				callbackFlag = false 表示执行此方法时不触发事件回调函数
				省略此参数，等同于 false
		*/
		treeObj.checkNode(node, true, false);
	}
};

/* 初始化zTree */
$(function(){
	$.fn.zTree.init($("#permissionTree"), setting);
});
</script>

<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>