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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<title>好医生医疗诊所 v1.0.0</title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs" href="../index.do">好医生医疗诊所</a>
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0.0</span> 
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<!-- 用shiro显示员工职位 -->
					<li><shiro:principal property="jobName" /></li>
					<li class="dropDown dropDown_hover">
						<a href="#" class="dropDown_A">
							<!-- 用shiro显示用户名 -->
							<shiro:principal property="realname" />(<shiro:principal property="username" />)
							<i class="Hui-iconfont">&#xe6d5;</i>
						</a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
							<li><a href="../logout.do">切换账户</a></li>
							<li><a href="../logout.do">退出</a></li>
						</ul>
					</li>
					<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
							<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<shiro:hasPermission name="patient:patientManager">
			<dl id="menu-clinic">
				<dt><i class="Hui-iconfont">&#xe620;</i> 看病就诊<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<shiro:hasPermission name="patientDiagnose:insert">
							<li><a data-href="../patient/addVisitPage.do" data-title="新开就诊" href="javascript:void(0)">新开就诊</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="patientDiagnose:list">
							<li><a data-href="../patient/visitListPage.do" data-title="就诊列表" href="javascript:void(0)">就诊列表</a></li>
						</shiro:hasPermission>
						<!-- 待改，没有医生排班权限 -->
						<shiro:hasPermission name="admin:adminPage">
							<li><a data-href="../patient/schedulePage.do" data-title="医生排班" href="javascript:void(0)">医生排班</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="patientRegister:insert">
							<li><a data-href="../patient/registerPage.do" data-title="门诊挂号" href="javascript:void(0)">门诊挂号</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="patientRegister:list">
							<li><a data-href="../patient/registerListPage.do" data-title="挂号列表" href="javascript:void(0)">挂号列表</a></li>
						</shiro:hasPermission>
						<!-- 待改，用的就诊列表 -->
						<shiro:hasPermission name="patientDiagnose:list">
							<li><a data-href="../patient/patientPage.do" data-title="患者库" href="javascript:void(0)">患者库</a></li>
						</shiro:hasPermission>
					</ul>
				</dd>
			</dl>
		</shiro:hasPermission>
		<!-- 待改，数据库中没有相关数据 -->
		<shiro:hasPermission name="store:storeManager">
			<dl id="menu-store">
				<dt><i class="Hui-iconfont">&#xe613;</i> 药品进销存<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<shiro:hasPermission name="store:drugInfo">
							<li><a data-href="../store/drugInfo/page.do" data-title="药品信息维护" href="javascript:void(0)">药品信息维护</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="store:supplier">
							<li><a data-href="../store/supplier/page.do" data-title="供应商维护" href="javascript:void(0)">供应商维护</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="store:purchase">
							<li><a data-href="../store/purchase/page.do" data-title="采购入库" href="javascript:void(0)">采购入库</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="store:loadingRecord">
							<li><a data-href="../store/loadingRecord/page.do" data-title="入库审核" href="javascript:void(0)">入库审核</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="store:stock">
							<li><a data-href="../store/stock/page.do" data-title="库存查询" href="javascript:void(0)">库存查询</a></li>
						</shiro:hasPermission>
					</ul>
				</dd>
			</dl>
		</shiro:hasPermission>
		<shiro:hasPermission name="system:systemManager">
			<dl id="menu-system">
				<dt><i class="Hui-iconfont">&#xe616;</i> 系统设置<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<shiro:hasPermission name="dept:deptPage">
							<li><a data-href="../system/dept/page.do" data-title="科室管理" href="javascript:void(0)">科室管理</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="job:jobPage">
							<li><a data-href="../system/job/page.do" data-title="职位管理" href="javascript:void(0)">职位管理</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="user:userPage">
							<li><a data-href="../system/user/page.do" data-title="医生管理" href="javascript:void(0)">医生管理</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="register:registerPage">
							<li><a data-href="../system/register/page.do" data-title="挂号费管理" href="javascript:void(0)">挂号费管理</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="recipe:recipePage">
							<li><a data-href="../system/recipe/page.do" data-title="处方附加费" href="javascript:void(0)">处方附加费</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="exam:examPage">
							<li><a data-href="../system/exam/page.do" data-title="检查项目费" href="javascript:void(0)">检查项目费</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="dictionary:dictionaryPage">
							<li><a data-href="../system/dictionary/page.do" data-title="字典表维护" href="javascript:void(0)">字典表维护</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="permission:permissionPage">
							<li><a data-href="../system/permission/page.do" data-title="权限管理" href="javascript:void(0)">权限管理</a></li>
						</shiro:hasPermission>
						<li><a data-href="../system/information/page.do" data-title="诊所信息" href="javascript:void(0)">诊所信息</a></li>
					</ul>
				</dd>
			</dl>
		</shiro:hasPermission>
		<!-- 待改，数据库中没有对应权限 -->
		<dl id="menu-statistics">
			<dt><i class="Hui-iconfont">&#xe622;</i> 数据统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="statistics/payments/page.do" data-title="诊所收支统计" href="javascript:void(0)">诊所收支统计</a></li>
					<li><a data-href="statistics/drugSale/page.do" data-title="药品销售统计" href="javascript:void(0)">药品销售统计</a></li>
					<li><a data-href="statistics/exam/page.do" data-title="检查项目统计" href="javascript:void(0)">检查项目统计</a></li>
					<li><a data-href="statistics/report/page.do" data-title="年月报表统计" href="javascript:void(0)">年月报表统计</a></li>
					<li><a data-href="statistics/workload/page.do" data-title="工作量统计" href="javascript:void(0)">工作量统计</a></li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="../welcome.do">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="../welcome.do"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){

});
/*个人信息*/
function myselfinfo(){
	layer.open({
		type: 1,
		area: ['300px','200px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '查看信息',
		content: '<div>管理员信息</div>'
	});
}

/*资讯-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}


</script> 

</body>
</html>