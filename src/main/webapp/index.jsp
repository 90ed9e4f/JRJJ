<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>渐入佳境</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">

<style type="text/css">
	body{
		padding-top:0px;
		padding-bottom: 10px;
	}
</style>
</head>
<body style="background-color: #eee;">
<div class="layui-container">
	<!-- 导航 begin -->
	<div class="layui-row" style="padding-top: 10px;padding-bottom: 10px">
		<div class="layui-col-md12">
			<ul class="layui-nav">
			  <li class="layui-nav-item layui-this"><a href="${pageContext.request.contextPath}">首页</a></li>
			  <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/blog/all.html">所有博客</a></li>
			  <li class="layui-nav-item">
			    <a href="javascript:;">博客分类</a>
			    <dl class="layui-nav-child">
			    	<c:forEach var="blogType" items="${blogTypeList }" varStatus="status">
				      <dd><a href="${pageContext.request.contextPath}/index.html?typeId=${blogType.id}">${blogType.typeName}</a></dd>
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
			</ul>
			<ul class="layui-nav layui-layout-right">
				<form action="${pageContext.request.contextPath }/blog/query.html">
					<li style="margin: 10px;float: left;">
					  	<input type="text" name="query" required lay-verify="required" placeholder="请输入搜索内容" autocomplete="off" class="layui-input">
				  	 </li>
				  	 <li style="margin: 10px;float: right;">
				  	 	<input type="submit" value="搜索" class="layui-btn"/>
				  	 </li>
			  	 </form>	
			</ul>
		</div>
	</div>
	<!-- 导航 end -->
	
	<div class="layui-row">
		<!-- 个人简介 begin -->
		<div class="layui-col-md4" style="padding-right: 10px;">
		      <div class="layui-card" style="height:440px;">
		        <div class="layui-card-header"><i class="layui-icon layui-icon-friends" >&nbsp;&nbsp;90ed9e4f</i></div>
		        <div class="layui-card-body" >
		          <center><img src="${pageContext.request.contextPath}/static/image/guopeng.jpg" style="width:273px;height:350px"></center>
		        	<center>人生路，道阻且长，渐入佳境</center>
		        </div>
		      </div>
		</div>
		<!-- 个人简介end -->
		<!-- 轮播图 begin -->
		<div class="layui-col-md8" >
			<div class="layui-carousel" id="test10">
			    <div carousel-item>
				    <div><img src="${pageContext.request.contextPath}/static/image/banner4.png" style="width:100%;height:100%"></div>
			    	<div><img src="${pageContext.request.contextPath}/static/image/banner2.png" style="width:100%;height:100%"></div>
			    	<div><img src="${pageContext.request.contextPath}/static/image/banner3.png" style="width:100%;height:100%"></div>
			    	<div><img src="${pageContext.request.contextPath}/static/image/banner1.png" style="width:100%;height:100%"></div>
			    </div>
			</div>
		</div>
	</div>
	<!-- 轮播图 end -->
	<!-- 所有博客 begin -->
	<div class="layui-row" style="padding-top: 10px;padding-bottom: 10px">
		<div class="layui-col-md12">
			<div class="layui-row" style="padding-top: 10px;padding-bottom: 10px;">
					<div class="layui-col-md12">
			<c:forEach var="blog" items="${blogList }" varStatus="status">
			<a href="${pageContext.request.contextPath}/blog/detail/${blog.id }.html">
			<div class="layui-card" style="height:100px;margin-top: 10px;margin-bottom: 10px;" >
			  <div class="layui-card-header">
			  	${status.index+1 } ${blog.title }
			  </div>
			  <div class="layui-card-body" >
			  	分类：${blog.blogType.typeName }&nbsp;&nbsp;|&nbsp;&nbsp;发布时间：<fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/>
			  </div>
			</div></a>
			</c:forEach>
		</div>
	</div>
	<!-- 所有博客 end -->
</div>

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/index.js"></script>
</body>
</html>