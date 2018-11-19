<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分类管理</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/blogType/addBlogType.do" method="post">
	分类名：<input type="text" name="typeName"/>
	<input type="submit" value="添加"/>
</form>
</body>
</html>