<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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