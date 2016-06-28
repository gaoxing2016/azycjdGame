<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:forEach items="${friendlist.list }" var="friend" varStatus="a">
	<div class="friend_item_css">
		<div class="friend_item_top_css">
			<div class="friend_item_img_css"><img  src="${friend.memberHeadImg }" width="41" height="41"></div>
			<div class="friend_item_content_css">
				<div class="friend_item_name_css">${friend.memberNick }&nbsp;&nbsp;&nbsp;
			    </div>
				<div class="friend_item_intro_css">${fn:substring(friend.vote,0,46 )}
					<a href="javascript:;" onclick="addFriend('${friend.id}','${loginUsers.id }',this)">加为好友</a>
				</div>
			</div>
		</div>
	</div>
</c:forEach>