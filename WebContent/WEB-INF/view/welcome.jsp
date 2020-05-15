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

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<title>诊所首页</title>
</head>
<body>
<div class="page-container">
	<p class="f-20 text-success">欢迎使用好医生医疗诊所 <span class="f-14">v1.0.0</span></p>

</div>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 

</body>
</html>