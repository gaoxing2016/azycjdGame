<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("isMobileWeb", "yes");
%>
<script type="text/javascript">
	window.location.href="<%=path %>/index.html";
</script>
