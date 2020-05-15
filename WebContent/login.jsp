<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />

<title>登录 - 好医生医疗诊所 v1.0.0</title>
</head>
<body>
<div class="loginWraper">
  <div id="loginform" class="loginBox" style="height:370px;padding-top:0;">
    <form class="form form-horizontal" action="../system/user/login.do" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"></label>
        <div class="formControls col-xs-8">
          <span style="color:red;">${errorMsg}</span>
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="username" name="username" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="verifyCode" autocomplete="off" class="input-text size-L" type="text" placeholder="验证码" value="" style="width:150px;">
          <img onclick="changeVerifyCode();" id="verifyCodeImg" title="看不清，换一张" src="../verifyCode.jsp" style="cursor:pointer">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="rememberMe" id="rememberMe" checked>
           	 使我保持登录状态
          </label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright Cynthia by 好医生医疗诊所 v1.0.0</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>

<script>
/* 点击重新请求验证码 */
function changeVerifyCode() {
	$("#verifyCodeImg").prop("src", "../verifyCode.jsp?time=" + new Date().getTime());
}
</script>

</body>
</html>