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
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<!-- layui的时间插件 -->
<link rel="stylesheet" type="text/css" href="laydate/theme/default/laydate.css" />

<!--/meta 作为公共模版分离出去-->

<title>员工 - 好医生医疗诊所 v1.0.0</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="userForm">
		<!-- 有id时才显示，没有（新增）时不显示 -->
		<c:if test="${not empty user.userId}">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">编号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${user.userId}" placeholder="" id="userId" name="userId" readonly>
				</div>
			</div>
		</c:if>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" ${user != null?'disabled':''} value="${user.username}" placeholder="请输入账号" id="username" name="username">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>真实名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.realname}" placeholder="请输入真实名称" id="realname" name="realname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<label>
					<input name="gender" type="radio" value="1" ${user.gender == '1'? 'checked':''}>
					男
				</label>
				<label>
					<input name="gender" type="radio" value="2" ${user.gender == '2'? 'checked':''}>
					女
				</label>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>年龄：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.age}" placeholder="请输入年龄" id="age" name="age">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>入职日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="createTime" name="createTime" value="${createTime}" placeholder="请选择入职日期" class="input-text layui-input" readonly>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>科室：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
					<select name="deptId" class="select" >
						<option value="" style="diaplay:none">请选择科室</option>
						<c:forEach items="${depts}" var="dept">
							<option ${user.deptId eq dept.deptId? 'selected' : ''} value="${dept.deptId}">${dept.deptName}</option>
						</c:forEach>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">级别?：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
					<select name="deptId" class="select" >
						<option value="" style="diaplay:none">请选择级别</option>
						<c:forEach items="${depts}" var="dept">
							<option ${user.deptId eq dept.deptId? 'selected' : ''} value="${dept.deptId}">${dept.deptName}</option>
						</c:forEach>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>职位：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
					<select name="jobId" class="select" >
						<option value="" style="diaplay:none">请选择职位</option>
						<c:forEach items="${jobs}" var="job">
							<option ${user.jobId eq job.jobId? 'selected' : ''} value="${job.jobId}">${job.jobName}</option>
						</c:forEach>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>手机号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.phone}" placeholder="请输入手机号" id="phone" name="phone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.email}" placeholder="请输入邮箱" id="email" name="email">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>身份证：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.idCard}" placeholder="请输入身份证" id="idCard" name="idCard">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>学历：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<label>
					<input name="education" type="radio" value="1" ${user.education == '1'? 'checked':''}>
					高中及以下
				</label>
				<label>
					<input name="education" type="radio" value="2" ${user.education == '2'? 'checked':''}>
					本科
				</label>
				<label>
					<input name="education" type="radio" value="3" ${user.education == '3'? 'checked':''}>
					研究生
				</label>
				<label>
					<input name="education" type="radio" value="4" ${user.education == '4'? 'checked':''}>
					硕士及以上
				</label>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">擅长：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea class="textarea" rows="5" cols="201" id="goodAt" name="goodAt">${user.goodAt}</textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">简介：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea class="textarea" rows="5" cols="201" id="introduction" name="introduction">${user.introduction}</textarea>
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

<!-- layui的时间插件 -->
<script type="text/javascript" src="laydate/laydate.js"></script>

<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//表单验证
	$("#userForm").validate({
		rules:{
			username:{
				required:true,
				minlength:2,
				/* 名字不能重复 */
				remote: {
					url: "../system/user/checkUsername.do",	//后台处理程序
					type: "post",					//数据发送方式
					dataType: "json",				//接收数据格式
					data: {							//要传递的数据
						username: function() {
							return $("#username").val();
						}
					},
				},
			},
			realname:{
				required:true,
				minlength:2,
				isChinese:true,
			},
			gender:"required",
			age:"required",
			createTime:"required",
			deptId:"required",
			/* deptId:"required", */
			jobId:"required",
			phone:"required",
			idCard:"required",
			education:"required",
		},
		/* 校验失败的提示信息 */
		messages: {
			username:{
				required:"账号名不能为空",
				minlength:"账号名最少2位",
				remote:"账号已经存在，清使用其他账号名",
			},
			realname:{
				required:"真实姓名不能为空",
				minlength:"最少两位汉字",
				isChinese:"请输入中文",
			},
			gender:"请选择性别",
			age:"年龄不能为空",
			createTime:"入职时间不能为空",
			deptId:"部门不能为空",
			/* deptId:"级别不能为空", */
			jobId:"职位不能为空",
			phone:"手机号不能为空",
			idCard:"身份证不能为空",
			education:"学历不能为空",
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		/* 校验成功的处理 */
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "${user}"==""?"../system/user/insert.do":"../system/user/update.do",
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
	/* layui的时间插件 */
	laydate.render({
		elem: '#createTime',
		trigger: 'click',
		value: "${createTime}",
		position: 'fixed',
	});

});
</script>

<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>