<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			签约书籍管理
		</div>
	</div>
	<form id="AnzhiNovelForm" action="anzhinovel/signedManage.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				小说名称：<input class="inputTextCss" type="text" id="novelTitle" name="novelTitle" class="txt" value="${param.novelTitle}"/>
			</div>
			
			<div class='searchDivItemText'>
				小说作者：<input class="inputTextCss" type="text" id="authorId" name="authorId" class="txt" value="${param.authorId}"/>
			</div>
			<div class='searchDivItemText'>
				小说类型：<input class="inputTextCss" type="text" id="novelType" name="novelType" class="txt" value="${param.novelType}"/>
			</div>
			<div class='searchDivItemText'>
				我的编辑：<input class="inputTextCss" type="text" id="myEditor" name="myEditor" class="txt" value="${param.myEditor}"/>
			</div>
			<div class='searchDivItemText' id="authorizationLevelataeelects">
				<script language="javascript">
					showSelect("authorizationLevel","authorizationLevel","${param.authorizationLevel}",authorizationLevelTypeData,"authorizationLevelataeelects","授权级别：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhinovel/signedManage.do','AnzhiNovelForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>小说名称</td>
					<td>小说作者</td>
					<td>状态</td>
					<td>最新更新</td>
					<td>授权级别</td>
					<td>点击数</td>
					<td>收藏数</td>
					<td>是否签约</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinovelList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td><a href="<%=request.getContextPath()%>/novel/${s.id }.jsp" target="_blank">${s.novelTitle }</a></td>
						<td><a href="<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=${s.authorId }" target="_blank">${s.authorWriterName }</a></td>
						<td>${novelStateArr[s.state]}</td>
						<td>${s.updateTime }</td>
						<td>${s.authorizationLevel eq 0?'原创':'转载'}</td>
						<td>${s.clickNum }</td>
						<td>${s.totalSaveNum }</td>
						<td>${s.isSigned eq 0?'未签约':'已签约'}</td>
						<td>
							<a href="javascript:;" onclick="jieyue(this,${s.id},'${s.novelTitle }')">[解约]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinovel/signedManage.do" name="url"/>
				<jsp:param value="${anzhinovelList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinovelList.num }" name="num"/>
				<jsp:param value="AnzhiNovelForm" name="formId"/>
				<jsp:param value="${anzhinovelList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
