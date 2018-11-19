<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>博客管理页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/JS/jquery-3.3.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
<form action="${pageContext.request.contextPath }/blog/addBlog.do" method="post">
	标题：  <input type="text" id="title" name="title"/>
	分类：  <select id="blogType" name="blogType.id"> 
		  	  <option value="">请选择博客分类</option> 
		      <c:forEach var="blogType" items="${blogTypeList }">
				  <option value="${blogType.id }">${blogType.typeName }</option>
			  </c:forEach>
		    </select>
    		<script id="container" name="content" type="text/plain">请在这里开始写你的博客内容</script>
    		<input type="submit" value="发布博客"/>
</form>    
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container');
    </script>

</body>
</html>