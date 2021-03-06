<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml,http://open.weibo.com/wb">
  <head>
    <base href="<%=basePath%>">
    
    <title>安之原创|安之原创基地</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="安之原创基地、安之原创、小说、小说排行榜、言情小说、玄幻都市、免费小说" />
	<meta name="description" content="安之原创|安之原创基地|小说|小说排行榜|言情小说|玄幻都市|免费小说" />
	<meta property="qc:admins" content="2315067207612132463757" />
	<meta property="wb:webmaster" content="3a36f523124c3619" />
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/azycjs.css">
	<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2050043132" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101296266" data-redirecturi="http://www.azycjd.com/qq_back.jsp" charset="utf-8"></script>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript" src="js/jquery.js"></script>
	<script language="javascript" src="js/jquery.color.js"></script>
	<script language="javascript" src="js/azycjd.js"></script>
	<script language="javascript">
		$(function(){
			$("#searchText").focus(function(){
				if($(this).val()=="请输入搜素内容"){
					$(this).val("");
				}
			});
			$("#searchText").blur(function(){
				if($(this).val()==""){
					$(this).val("请输入搜素内容");
				}
			});
		});
	</script>
	<style type="text/css">
		.selectDivCss{margin-left: 552px;}
		.div_css_test{display: none;padding: 15px;}
	 </style>
	 <script type="text/javascript">
		function showDivFn(id){
			$("#"+id).slideToggle();
		}
	 </script>
	<!--[if lte IE 7]>
		<div id="browseTips" style="width:830px;background-color:#FFFFFF; margin:0 auto; margin-top:40px;margin-bottom:20px;line-height:23px;">
			我们发现您使用的IE浏览器版本距离现在已经很遥远了。为了更好的体验本系统，我们建议您升级浏览器。您可以选择：<br />
 			<a target="_blank" href="http://rj.baidu.com/soft/detail/14917.html?ald">IE10</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/11843.html?ald">火狐浏览器</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>|<a href="javascript:closeBrowseTip()">关闭</a>
		</div>
 		
	<![endif]-->
  </head>
  
  <body id="top_banner" style="padding:0px; margin:0px; background:url(${sessionYonghuzhinantoubu})  center 0px no-repeat #f0f0f0;">
  	<jsp:include page="other_head.jsp" flush="false" />
	<div class="main_2_div">
		<div class="div_title_css_main">
			<div class="div_title_css_sec">用户指南</div>
			<div class="div_title_css_conetent">
				<div>${otherContent.yonghuzhinan }</div>
				<div>
					<div class="divTableCss">
						<table class="tableCss" width="100%" >
						    <tr  class="tableTitleCss">
						        <td>序号</td>
						        <td>公告标题</td>
						        <td>公告时间</td>
						        <td>操作</td>
						    </tr>
						    <c:forEach items="${yonghuzhinan.list}" var="s" varStatus="ind">
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
		</div>
	</div>
<jsp:include page="foot.jsp"></jsp:include>