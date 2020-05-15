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

<!--/meta 作为公共模版分离出去-->

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap-3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap-table/bootstrap-table.min.css" />

<!-- registerSub表格 -->
<style type="text/css">
	.registerSubsTag{
		background-color: durkgray;
		border: 1px solid black;
		border-right: 0; 
		height: 40px;
		line-height: 40px;
	}
	.registerSubsTag input{
		height: 30px;
		text-align: center;
	}
	.registerSubsTag_add{
		border: 1px solid black;
	}
	#registerSubsTag{
		text-align: center;
	}
	.hidden{
		display: none;
	}

</style>

<title>挂号费 - 好医生医疗诊所 v1.0.0</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="registerForm">
		<!-- 有id时才显示，没有（新增）时不显示 -->
		<c:if test="${not empty register.registerId}">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">编号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${register.registerId}" placeholder="" id="registerId" name="registerId" readonly>
				</div>
			</div>
		</c:if>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>挂号费名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${register.registerName}" placeholder="请输入挂号费名" id="registerName" name="registerName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
					<select name="registerType" class="select" >
						<option value="" style="diaplay:none">请选择类型</option>
						<c:forEach items="${types}" var="type">
							<option ${register.registerType eq type.dictionaryId? 'selected' : ''} value="${type.dictionaryId}">${type.dictionaryName}</option>
						</c:forEach>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>挂号金额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${register.money}" placeholder="请输入挂号金额" id="money" name="money" 
						onkeyup="operationTotalPrice();">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">总费用（挂号金额+自费用）：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${register.totalMoney}" placeholder="请输入总费用" id="totalMoney" name="totalMoney" readonly>
			</div>
		</div>
		
		<!-- 子费用 -->
		<div id="registerSubsTag" class="row cl">
			<div>
				<div class="col-xs-3 col-sm-3 registerSubsTag">子费用编号</div>
				<div class="col-xs-3 col-sm-3 registerSubsTag">子费用类型名</div>
				<div class="col-xs-3 col-sm-3 registerSubsTag">子费用价格</div>
				<div class="col-xs-3 col-sm-3 registerSubsTag registerSubsTag_add">
					<span style="font: 30px;cursor: pointer;color: green" 
						class="glyphicon glyphicon-plus"
						onclick="add_registerSub();">
					</span>
				</div>
			</div>
			
			<!-- 有信息（修改） -->
			<c:if test="${register != null}">
				<c:forEach items="${registerSubs}" var="obj">
					<div class="registerSubBox" id="registerSubBox">
						<div class="col-xs-3 col-sm-3 registerSubsTag">
							${obj.registerSubId}
						</div>
						<div class="col-xs-3 col-sm-3 registerSubsTag">
							<select name="registerSubs[][registerSubType]">
								<c:forEach items="${registerSubType}" var="obj1">
									<option ${obj.registerSubType eq obj1.dictionaryId?'selected':''} value="${obj1.dictionaryId}">${obj1.dictionaryName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-xs-3 col-sm-3 registerSubsTag">
							<input type="text" size="3" onkeyup="operationTotalPrice();" value="${obj.registerSubMoney}" name="registerSubs[][registerSubMoney]" oninput="value=value.replace(/[^\d\.]/g,'')">
						</div>
						<div class="col-xs-3 col-sm-3 registerSubsTag registerSubsTag_add">
							<span id="removeSpan" style="font: 30px;cursor: pointer;color: red" 
							class="glyphicon glyphicon-remove"
							onclick="remove_registerSub(this);"
							></span>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
			<!-- 新增样板，点击加号复制这堆，取消hidden -->
			<div class="registerSubBox hidden" id="registerSubBoxExample">
				<div class="col-xs-3 col-sm-3 registerSubsTag">
				</div>
				<div class="col-xs-3 col-sm-3 registerSubsTag">
					<select name="registerSubs[][registerSubType]">
						<c:forEach items="${registerSubType}" var="obj1">
							<option ${obj.registerSubType eq obj1.dictionaryId?'selected':''} value="${obj1.dictionaryId}">${obj1.dictionaryName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-xs-3 col-sm-3 registerSubsTag">
					<input type="text" size="3" onkeyup="operationTotalPrice();" name="registerSubs[][registerSubMoney]" oninput="value=value.replace(/[^\d\.]/g,'')">
				</div>
				<div class="col-xs-3 col-sm-3 registerSubsTag registerSub_add">
					<span id="removeSpan" style="font: 30px;cursor: pointer;color: red" 
					class="glyphicon glyphicon-remove"
					onclick="remove_registerSub(this);"
					></span>
				</div>
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

<!-- bootstrap -->
<script type="text/javascript" src="bootstrap/bootstrap-table/bootstrap-table.min.js"></script> 
<script type="text/javascript" src="bootstrap/bootstrap-table/bootstrap-table-zh-CN.min.js"></script> 
<!-- json -->
<script type="text/javascript" src="jquery/jquery.serializejson.min.js"></script>  

<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//表单验证
	$("#registerForm").validate({
		rules:{
			registerName:{
				required:true,
			},
			registerType:{
				required:true,
			},
			money:{
				required:true,
				isNumber:true,
			},
		},
		/* 校验失败的提示信息 */
		messages: {
			registerName:{
				required:"挂号费名不能为空",
			},
			registerType:{
				required:"类型不能为空",
			},
			money:{
				required:"挂号金额不能为空",
				isNumber:"挂号金额必须是数字",
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		/* 校验成功的处理 */
		submitHandler:function(form){
			/* 提交前删除样本registerSubBoxExample，不然会有空数据出现 */
			$("#registerSubBoxExample").remove();

			//序列化表单: 序列化的是一个JSON对象
			var obj = $('#registerForm').serializeJSON();
			//将JSON对象转换成标准JSON格式的字符串，后台SpringMVC不能接受json对象，但是可以接受标准JSON格式字符串
			//然后转换成对象
			var jsonString = JSON.stringify(obj);
			//使用Ajax将json字符串提交给后台
			console.log(jsonString)
			$.ajax({
				url:"${register}"==""?"../system/register/insert.do":"../system/register/update.do",
				type:"post",
				contentType:"application/json;charset=utf-8",
				data:jsonString,
				success:function(data){
					layer.msg(data.msg,{icon:data.code},function(){
						if(data.code == 1){
							//刷新父页面
							parent.refreshTable();
							//关闭父页面
							parent.layer.closeAll();
						}
					});
				}
			});
			/* $(form).ajaxSubmit({
				type: 'post',
				url: "${register}"==""?"../system/register/insert.do":"../system/register/update.do",
				data: {
					/* 自动会配参数 */
				/* },
				success: function(data){
					layer.msg(data.msg,
						{icon:data.code,time:1000}, */
						/* 回调函数 */
						/* function(layero){
							if(data.code) { */
								/* 获取窗口号码，刷新父级表格、关闭窗口 */
								/* var index = parent.layer.getFrameIndex(window.name);
								parent.$('[name=refresh]').click();
								parent.layer.close(index);
							}
						});
				},
                error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('error!',{icon:0,time:1000});
				}
			}); */
		}
	});

});
</script>

<script>
/* 显示子费用 */

/**
 * 点击添加按钮新增 子费用详情操作
 */
function add_registerSub(){
	//目标：将原本的设置为隐藏，新增的时候复制并取消新的隐藏
	$("#registerSubBoxExample").removeClass("hidden");
	
	//克隆 id=registerSub 子费用div
	var registerSub = $("#registerSubBoxExample").clone();
	registerSub.attr("id","registerSubBox");
	//清除所有文本框的内容
	registerSub.find("input").val("");
	
	//目标：将原本的设置为隐藏，新增的时候复制并取消新的隐藏
	$("#registerSubBoxExample").addClass("hidden");
	
	//将克隆的div追加到外层div
	$("#registerSubsTag").append(registerSub);

}
/**
 * 删除子费用
   思路：获取删除按钮的父标签的父标签删除
 */
function remove_registerSub(obj){
	
	//获取所有的子费用详情 使用 类选择器
	var registerSub = $(".registerSub");

	$(obj).parent().parent().remove();
}

/**
 * 计算总费用的 单价X数量=总价
 */
function operationTotalPrice(){
	/* 获取总价input */
	var totalMoney = $("#totalMoney");
	
	/* 获取挂号金额 */
	var money = $("#money").val();
	
	/* 获取子费用 */
	var inputs = $("[name='registerSubsTag[][registerSubMoney]']");

	var total = Number(money);
	for(var i=0; i<inputs.length; i++) {
		total += Number(inputs[i].value);
	}
	
	totalMoney.val(total);
}
</script>

<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>