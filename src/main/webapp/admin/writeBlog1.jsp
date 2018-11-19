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

<script type="text/javascript">
function submitData(){
	var title=${"#title"}.val();
	var blogType=${"#blogType"}.combobox.val("getValue");
	var content=UE.getEditor('editor').getContent();
	
	if(title==null||title==''){
		alert("标题不能为空！");
	}else if(blogType==null||blogType==''){
		alert("博客分类不能为空！")
	}else if(content==null||content==''){
		alert("请填写博客内容！");
	}else{
		$.post("${pageContext.request.contextPath}/blog/addBlog.do",
				{'title':title,'blogType.id':blogType,'content':content},
				function(result){
			if(result.success){
				alert("博客发布成功！");
				resultValue();
			}else{
				alert("博客发布失败！");
			}
		},"json");
	}
}

function resultValue(){
	$("#title").val("");
	$("#blogType").combobox("setValue","");
	UE.getEditor('editor').setContent('');
}
</script>
</head>
<body>
开始编辑您的博客吧
<!--  <form action="${pageContext.request.contextPath }/addBlog.do" method="post">   -->
	标题：  <input type="text" id="title" name="title"/>
	分类：  <select id="blogType" name="blogType"> 
		  	  <option value="">请选择博客分类</option> 
		      <c:forEach var="blogType" items="${blogTypeList }">
				  <option value="${blogType.id }">${blogType.typeName }</option>
			  </c:forEach>
		    </select>
    		<script id="container" name="content" type="text/plain">请在这里开始写你的博客内容</script>
    		
    		<a href="javascript:submitData()" >发布博客</a>
    		<a href="javascript:a()">提交</a>
    		<button type="button" onclick="submitData()">保存</button>
    
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container');
    </script>

</body>
</html>