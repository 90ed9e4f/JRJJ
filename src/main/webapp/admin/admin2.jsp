<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>博客管理页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
</head>
<body>
<iframe src="layuiAdmin.html?from=demo" id="demoAdmin" style="width: 100%; height: 300px;" frameborder="0">
	<a href="${pageContext.request.contextPath }/admin/writeBlog.jsp">写博客</a>
	<a href="${pageContext.request.contextPath }/admin/typeManage.jsp">分类管理</a>
</iframe> 

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/index.js"></script>
</body>
</html>