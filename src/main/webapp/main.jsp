<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>渐入佳境</title>
</head>
<body>
友情链接：<br>
<c:forEach var="link" items="${linkList }" varStatus="status">
	<a href="${link.linkUrl }">${status.index+1 } ${link.linkName } </a> <br>
</c:forEach>

所有分类：<br>
<c:forEach var="blogType" items="${blogTypeList }" varStatus="status">
	<a href="#">${status.index+1 } ${blogType.typeName } </a> <br> 
</c:forEach>
</body>
</html>