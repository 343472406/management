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
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,dictionary-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<!--/meta 作为公共模版分离出去-->

<title>字典表 - 好医生医疗诊所 v1.0.0</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="dictionaryForm">
		<!-- 有id时才显示，没有（新增）时不显示 -->
		<c:if test="${not empty dictionary.dictionaryId}">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">编号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${dictionary.dictionaryId}" placeholder="" id="dictionaryId" name="dictionaryId" readonly>
				</div>
			</div>
		</c:if>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>字典表名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${dictionary.dictionaryName}" placeholder="请输入字典表名" id="dictionaryName" name="dictionaryName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">字典表描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea class="textarea" rows="5" cols="201" id="dictionaryDesc" name="dictionaryDesc">${dictionary.dictionaryDesc}</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">父字典表：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
					<select name="parentId" class="select" >
						<option value="" style="diaplay:none">请选择父字典表</option>
						<c:forEach items="${parents}" var="parent">
							<option ${dictionary.parentId eq parent.dictionaryId? 'selected' : ''} value="${parent.dictionaryId}">${parent.dictionaryName}</option>
						</c:forEach>
					</select>
				</span>
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

<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//表单验证
	$("#dictionaryForm").validate({
		rules:{
			dictionaryName:{
				required:true,
			},
		},
		/* 校验失败的提示信息 */
		messages: {
			dictionaryName:{
				required:"字典表名不能为空",
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		/* 校验成功的处理 */
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "${dictionary}"==""?"../system/dictionary/insert.do":"../system/dictionary/update.do",
				data: {
					/* 自动会配参数 */
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


<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>