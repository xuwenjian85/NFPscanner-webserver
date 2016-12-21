<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%response.setStatus(200);%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>

<script language="javascript">
	$(function(){
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
	$(window).resize(function(){  
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
    })  
});  
</script> 


</head>


<body style="background:#edf6fa;">

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${ctx}/login/main" target="_parent">首页</a></li>
    <li><a href="#">系统正在建设中</a></li>
    </ul>
    </div>
    
    <div class="error">
    
    <h2>系 统 正 在 建 设 中</h2>
    <div class="reindex"><a href="${ctx}/login/main" target="_parent">返回首页</a></div>
    
    </div>


</body>

</html>