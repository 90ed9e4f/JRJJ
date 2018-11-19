<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${blog.title }</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">

<style type="text/css">
	body{
		padding-top:0px;
		padding-bottom: 10px;
	}
</style>
</head>
<body>
<div class="layui-container">
	<!-- 导航 begin -->
	<div class="layui-row" style="padding-top: 10px;padding-bottom: 10px">
		<div class="layui-col-md12">
			<ul class="layui-nav">
			  <li class="layui-nav-item"><a href="${pageContext.request.contextPath}">首页</a></li>
			  <li class="layui-nav-item layui-this"><a href="">所有博客</a></li>
			  <li class="layui-nav-item">
			    <a href="javascript:;">博客分类</a>
			    <dl class="layui-nav-child">
			    	<c:forEach var="blogType" items="${blogTypeList }" varStatus="status">
				      <dd><a href="${pageContext.request.contextPath}/blog/all.html?typeId=${blogType.id}">${blogType.typeName}</a></dd>
				    </c:forEach>
			    </dl>
			  </li>
			  <li class="layui-nav-item">
			    <a href="javascript:;">友情链接</a>
			    <dl class="layui-nav-child">
				    <c:forEach var="link" items="${linkList }" varStatus="status">
			      		<dd><a href="${link.linkUrl }">${link.linkName }</a></dd>
			      	</c:forEach>
			    </dl>
			  </li>
			  <li class="layui-nav-item"><a href="">社区</a></li>
			</ul>
		</div>
	</div>
	<!-- 导航 end -->
	<!-- 博客内容 begin -->
	<div class="layui-row" style="padding-top: 10px;padding-bottom: 10px">
		<div class="layui-col-md12">
			<blockquote class="layui-elem-quote" style="font-size: 30px;font-family:'STHupo';">${blog.title }</blockquote>
		</div>
	</div>
	<div class="layui-row" style="padding-top: 10px;padding-bottom: 10px">
		<div class="layui-col-md12">
		  <fieldset class="layui-elem-field">
			  <legend style="font-family:'STCaiyun',微软雅黑;">正文</legend>
			  <div class="layui-field-box">
			  	${blog.content }
			  </div>
		  </fieldset>
		</div>
	</div>
	<!-- 博客内容 end -->
</div>



<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/index.js"></script>
</body>
</html>