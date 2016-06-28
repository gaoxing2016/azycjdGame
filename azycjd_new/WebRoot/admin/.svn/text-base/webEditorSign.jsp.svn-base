<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form id="AnzhiWebEditorSignForm" action="anzhiwebeditor/findAnzhiWebEditorByIdSign.do?anzhiwebeditorId=${param.anzhiwebeditorId}&&editorId=${param.editorId }" method="post">
	<div class="tableCss">
		<table width="100%" border="0">
			<tr class="titleCss">
				<td>序号</td>
				<td>网编编号</td>
				<td>签到时间</td>
			</tr>
			<c:forEach items="${anzhiwebeditorsignList.list}" var="s" varStatus="ind">
				<tr>
					<td>${ind.index+1 }</td>
					<td>${s.anzhiWebEditor.editorNo }[${s.anzhiWebEditor.editorName }]</td>
					<td>${s.addTime }</td>
				</tr>
			</c:forEach>
		</table>
		<jsp:include page="../next_page.jsp" flush="false">
			<jsp:param value="anzhiwebeditor/findAnzhiWebEditorByIdSign.do?anzhiwebeditorId=${param.anzhiwebeditorId}&&editorId=${param.editorId }" name="url"/>
			<jsp:param value="${anzhiwebeditorsignList.totalNum }" name="totalNum"/>
			<jsp:param value="${anzhiwebeditorsignList.num }" name="num"/>
			<jsp:param value="AnzhiWebEditorSignForm" name="formId"/>
			<jsp:param value="${anzhiwebeditorsignList.total }" name="total"/>
			<jsp:param value="${param.size}" name="size"/>
		</jsp:include>
	</div>
</form>