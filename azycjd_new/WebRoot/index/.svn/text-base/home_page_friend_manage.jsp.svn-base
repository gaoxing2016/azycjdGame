<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<script>
	function checkSearch(){
		var tsss=/^.{1,100}$/;
		var v=$.trim($("#friendname").val());
		if((/^.{1,100}$/).test(v)){
			direcNum('anzhifriend/findMyFriendSearch.do','anzhiFriendSearch');
		}
	}
</script>
<style type="text/css">
	.search_div_new{ padding:10px; background-color:#fff; border:#dbdbdb 1px solid; border-radius:5px;}
	.search_text{ border:none; height:35px; line-height:35px;background-color:#fff; width:100%; font-family:"黑体"; font-size:16px;}
	.search_btn_new{ background:url(images/s_new.png) no-repeat 10px 4px; cursor:pointer; width:100%; height:32px;}
	.selectDivCss{margin-left:2px !important; }
	.saveBtnCss{ width:60px !important;letter-spacing:2px !important;}
</style>
	<div class="search_div_new">
		<form action="anzhifriend/findMyFriendSearch.do" method="post" id="anzhiFriendSearch">
			<table width="100%">
				<tr>
					<td valign="top">
						<input type="text" class="search_text" id="friendname" name="friendname" placeholder="请输入好友昵称/好友ID搜索..." value=${param.friendname }>
					</td>
					<td valign="top" width="50">
						<div class="search_btn_new" onclick="ajaxSubmit('anzhiFriendSearch',this)">
							
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<div id="mainContent">
			
		</div>
		<c:forEach items="${memberlist.list }" var="member" varStatus="a">
			<div class="friend_item_css">
				<div class="friend_item_top_css">
					<div class="friend_item_img_css"><img  src="${member.friendHeadImg }" width="41" height="41"></div>
					<div class="friend_item_content_css">
						<div class="friend_item_name_css">${member.friendNick }&nbsp;&nbsp;&nbsp;
						 	<fmt:formatDate value="${member.addTime }" pattern="yyyy-MM-dd HH:mm"/>
					    </div>
						<div class="friend_item_intro_css">
							${fn:substring(member.friendVote,0,46 )}
							<a href="javascript:;" style="margin-left: 30px;" onclick="getJspDataByUrl('index/my_news_send.jsp#linenumber=5#chooseIndex=3#index=4#nick=${member.friendNick }')">发送消息</a>
							&nbsp;&nbsp;&nbsp;<a href="javascript:;" onclick="delRecordBack('anzhifriend/delMyAnzhiFriend.do#anzhifriendId=${member.id }')">删除</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${list.list }" var="member" varStatus="a">
			<div class="friend_item_css">
				<div style="background-color:#eae6e4; border:#c9c3c1 1px solid; line-height:40px; height:40px;">
					<font style="padding-left: 130px; color:#000;">好友验证</font>
					<font style="padding-left: 70px; color:#3e3b3a;"><!-- 您还不是VIP会员，开通VIP会员享受更多尊贵服务，更多会员特权。 --></font>
				</div>
				<div class="friend_item_top_css" style="margin-top: 30px;">
					<div class="friend_item_img_css"><img  src="${member.memberHeadImg }" width="41" height="41"></div>
					<div class="friend_item_content_css">
						<div class="friend_item_name_css">${member.memberNick }&nbsp;&nbsp;&nbsp;
						 	<fmt:formatDate value="${member.addTime }" pattern="yyyy-MM-dd HH:mm"/>
					    </div>
						<div class="friend_item_intro_css">
							${fn:substring(member.memberVote,0,46 )}
							<c:if test="${member.state eq 1}">
								<a href="javascript:;" style="margin-left: 30px;" onclick="getJspDataByUrl('index/my_news_send.jsp#linenumber=5#chooseIndex=3#index=4#nick=${member.memberNick }')">发送消息</a>
								&nbsp;&nbsp;&nbsp;<a href="javascript:;" onclick="delRecordBack('anzhifriend/delMyAnzhiFriend.do#anzhifriendId=${member.id }')">删除</a>
							</c:if>
							<c:if test="${member.state eq 2}">
								<font style="margin-left: 30px;color: red;">已拒绝</font>&nbsp;&nbsp;&nbsp;<a href="javascript:;" onclick="delRecordBack('anzhifriend/delMyAnzhiFriend.do#anzhifriendId=${member.id }')">删除</a>
							</c:if>
							<c:if test="${member.state eq 0}">
								<a href="javascript:;" style="margin-left: 30px;" onclick="updateRecordBack('anzhifriend/delMyAnzhiFriend.do#anzhifriendId=${member.id }#state=1')">同意添加</a>
								<a href="javascript:;" style="margin-left: 10px;" onclick="updateRecordBack('anzhifriend/delMyAnzhiFriend.do#anzhifriendId=${member.id }#state=2')">拒绝添加</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>