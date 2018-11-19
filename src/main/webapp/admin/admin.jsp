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
<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function changeTab(url) {
	var na = document.getElementById("adminTab"); 
	na.src=url
}

</script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo"><a href="${pageContext.request.contextPath }" style="color:green">渐入佳境</a></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">首页</a></li>
      <li class="layui-nav-item"><a href="">友情链接</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="${pageContext.request.contextPath }/admin/writeBlog.jsp">写博客</a></dd>
          <dd><a href="${pageContext.request.contextPath }/admin/typeManage.jsp">分类管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="${pageContext.request.contextPath }/static/image/touxiang.jpg" class="layui-nav-img">
         	郭鹏
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">博客管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:changeTab('writeBlog.jsp')">发布博客</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="javascript:changeTab('writeBlog.jsp')">修改博客</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">分类管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:changeTab('typeManage.jsp')">分类管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">链接管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:changeTab('typeManage.jsp')">链接管理</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
   <iframe src="mainPage.jsp" frameborder="0" id="adminTab" style="width: 100%; height: 100%;">
   </iframe>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © 52crawl.com - 懒惰致富集团
  </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/admin.js"></script>
</body>
</html>