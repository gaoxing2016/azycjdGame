<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>"/>
    
    <title>安之原创|安之原创基地</title>
    
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css"/>
	-->
	<link rel="stylesheet" type="text/css" href="css/azycjs.css"/>
	<script language="javascript" src="js/jquery.js"></script>
	<script language="javascript" src="js/jquery.color.js"></script>
	<script language="javascript" src="js/azycjd.js"></script>
	<style type="text/css">
		.selectDivCss{margin-left: 552px;}
		.div_css_test{display: none;padding: 15px;}
	 </style>
	 <script type="text/javascript">
		function showDivFn(id){
			$("#"+id).slideToggle();
		}
	 </script>
  </head>
  
  <body style="padding:0px; margin:0px;">
    <div class="activity_top">
    <div class="activity_topone">
    	<div class="headlogoimg"><img src="images/12_p_3.png"></img></div>
    	<div class="backindex" onclick="window.location.href='<%=request.getContextPath()%>/index.html'">返回首页</div>
    </div>
    	
    </div>
    <div class="activity_two" style="background-color:#ff4f52;">
    	<div class="activity_twofirst"><img src="${sessionHuodongzhuanqu}"/></div>
    	<div class="activity_twotwo"></div>
    </div>
    <div class="activity_main">
    	<div>${otherContent.huodongzhuanqu }</div>
    	<div>
			<div class="divTableCss">
				<table class="tableCss" width="100%" >
				    <tr  class="tableTitleCss">
				        <td>序号</td>
				        <td>公告标题</td>
				        <td>公告时间</td>
				        <td>操作</td>
				    </tr>
				    <c:forEach items="${huodongzhuanqu.list}" var="s" varStatus="ind">
						<tr>
					        <td>${ind.index+1 }</td>
					        <td style="cursor: pointer;" onclick="showDivFn('div${s.id }')"><a style="color: blue">${s.newsTitle }</a></td>
					        <td>${s.addTime }</td>
					        <td><a href="javascript:showDivFn('div${s.id }')">查看</a></td>
					    </tr>
					    <tr>
							<td colspan="4">
								<div id="div${s.id }" class="div_css_test">
									${s.newsContent }
									<br/>[<fmt:formatDate value="${s.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/> ]
								</div>
							</td>
						</tr>
					</c:forEach>
			    </table>
			</div>
		</div>
    </div>
    <div class="activity_three">
       <div class="activity_foot_css">
       <div class="activity_foottitle">活动详细参与方式</div>
		<table width="60%" style="margin:0 auto;padding-left:30px;" class="activity_foot_tab">
		  <tr>
			<td width="50%" valign="top">
				<div>电话：0871-67375096</div>
				<div>邮箱：1577415284@qq.com</div>
				<div>邮编：650200</div>
			</td>
			<td width="50%" valign="top">
				<div>版权合作事宜联系方式：</div>
				<div>邮箱：安之·迷糊 1810154217@qq.com</div>
			</td>
		  </tr>
		</table>
	   </div>
    </div>
    <div class="activity_foot">
    	<div>Copyright© 2006-2012 www.azycjd.com  All Rights Reserved 版权所有 云南安柔科技有限公司</div>
		<div>滇ICP备12006807号-1 滇网文许字【2014】1100-002号</div>
    </div>
  </body>
</html>
