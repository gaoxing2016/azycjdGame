<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="adminHtmlEdit.jsp" flush="false" />
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiChapter操作
		</div>
	</div>
	<form id="AnzhiChapterFormAction" action="<%=request.getContextPath()%>/anzhichapter/updteAnzhiChapterAdmin.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="novelId" id="novelId" value="${pojo.novelId}" alt=""/>
			<input type="hidden" class="txt" name="charNum" id="charNum" value="${pojo.chapterCharNum}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>章节标题：</font><input type="text" class="txt" name="chapterTitle" id="chapterTitle" value="${pojo.chapterTitle}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写章节标题</font></div>
			<div class="textItem"><font class='textTitleCss'>章节内容：</font>
				<textarea class="htmlEditCss" style="height:580px;" id="chapterContent" name="chapterContent">${pojo.chapterContent }</textarea>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiChapterFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
