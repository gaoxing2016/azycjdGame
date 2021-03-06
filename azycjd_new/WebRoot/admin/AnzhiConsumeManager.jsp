<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			消费管理
		</div>
	</div>
	<form id="AnzhiConsumeForm" action="anzhiconsume/findAnzhiConsumeAll.do" method="post">
		<div class="searchItemsCssss">
			<jsp:include page="timeCondition.jsp"></jsp:include>
			<div class='searchDivItemText'>
				开始金额：<input class="inputTextCss" type="text" id="begNum" name="begNum" class="txt" value="${param.begNum}"/>
			</div>
			<div class='searchDivItemText'>
				结束金额：<input class="inputTextCss" type="text" id="endNum" name="endNum" class="txt" value="${param.endNum}"/>
			</div>
			<div class='searchDivItemText'>
				用户昵称：<input class="inputTextCss" type="text" id="memberNick" name="memberNick" class="txt" value="${param.memberNick}"/>
			</div>
			<div class='searchDivItemText'>
				消费名称：<input class="inputTextCss" type="text" id="novelTitle" name="novelTitle" class="txt" value="${param.novelTitle}"/>
			</div>
			<div class='searchDivItemText' id="stconsumeTypeelects">
				<script language="javascript">
					showSelect("consumeType","consumeType","${param.consumeType}",cosumeTypeData,"stconsumeTypeelects","消费类型：",true,135);
				</script>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiconsume/findAnzhiConsumeAll.do','AnzhiConsumeForm')"/>
				<!-- <input id='addanzhiconsume' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiconsume/anzhiconsumeAction.do')"/> -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>读者昵称</td>
					<td>消费安之币金额</td>
					<td>消费名称</td>
					<td>消费类型</td>
					<td>消费时间</td>
					<td>之前余额</td>
					<td>之后余额</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiconsumeList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.memberNick }</td>
						<td>${s.consumeAnzhiMoney }</td>
						<td>${s.consumeName }</td>
						<td>
							<c:if test="${s.consumeType ==0}">打赏</c:if>
							<c:if test="${s.consumeType ==1}">购买</c:if>
						</td>
						<td>
							<fmt:formatDate value="${s.consumeTime  }" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td>${s.consumeBeforeMoney }</td>
						<td>${s.consumeAfterMoney }</td>
						<td>
							<!-- <a id='updateanzhiconsume${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiconsume/findAnzhiConsumeById.do?anzhiconsumeId=${s.id}',this,'updateanzhiconsume')">[查看]</a> -->
							<a id='deleteanzhiconsume${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiconsume/delAnzhiConsume.do?anzhiconsumeId=${s.id }',this,'deleteanzhiconsume')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiconsume/findAnzhiConsumeAll.do" name="url"/>
				<jsp:param value="${anzhiconsumeList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiconsumeList.num }" name="num"/>
				<jsp:param value="AnzhiConsumeForm" name="formId"/>
				<jsp:param value="${anzhiconsumeList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
