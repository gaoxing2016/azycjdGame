<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="htmlEditAdmin.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编用户操作
		</div>
	</div>
	<form id="AnzhiWebEditorFormAction" action="<%=request.getContextPath()%>/anzhiwebeditor/addAnzhiWebEditor.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>网编编号：</font><input type="text" class="txt" name="editorNo" id="editorNo" value="${pojo.editorNo}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写网编编号</font></div>
			<div class="textItem"><font class='textTitleCss'>网编密码：</font><input type="text" class="txt" name="editorPassword" id="editorPassword" value="${pojo.editorPassword}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写网编密码</font></div>
			<div class="textItem"><font class='textTitleCss'>网编届别：</font><input type="text" class="txt" name="editorJiebie" id="editorJiebie" value="${pojo.editorJiebie}" alt="" <c:if test="${loginWebEditorUser ne null }">readonly="readonly"</c:if> />&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写网编届别</font></div>
			<div class="textItem"><font class='textTitleCss'>网编名称：</font><input type="text" class="txt" name="editorName" id="editorName" value="${pojo.editorName}" alt="" <c:if test="${loginWebEditorUser ne null  }">readonly="readonly"</c:if> />&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写网编名称</font></div>
			<div class="textItem"><font class='textTitleCss'>身份证号：</font><input type="text" class="txt" name="editorCode" id="editorCode" value="${pojo.editorCode}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写身份证号</font></div>
			<div class="textItem"><font class='textTitleCss'>家庭住址：</font><input type="text" class="txt" name="editorAddress" id="editorAddress" value="${pojo.editorAddress}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写家庭住址</font></div>
			<div class="textItem"><font class='textTitleCss'>联系电话：</font><input type="text" class="txt" name="editorTel" id="editorTel" value="${pojo.editorTel}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写联系电话</font></div>
			<div class="textItem"><font class='textTitleCss'>网编Q&nbsp;Q：</font><input type="text" class="txt" name="editorQq" id="editorQq" value="${pojo.editorQq}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写网编QQ</font></div>
			<div class="textItem"><font class='textTitleCss'>备注说明：</font><input type="text" class="txt" name="editorVote" id="editorVote" value="${pojo.editorVote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注说明</font></div>
			<div class="textItem"><font class='textTitleCss'>助教昵称：</font><input type="text" class="txt" name="editorShifu" id="editorShifu" value="${pojo.editorShifu}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写师傅网编名称</font></div>
			<div class="textItem"><font class='textTitleCss'>积分设置：</font><input type="text" class="txt" name="editorScore" id="editorScore" value="${pojo.editorScore}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写积分</font></div><!-- \d{1,8}(\.\d{1,2})?;积分输入错误！ -->
			<div class="textItem"><font class='textTitleCss'>网编头像：</font><input type="text" class="txt" id="editorHeadImg" readonly="readonly" name="editorHeadImg" value="${pojo.editorHeadImg }">&nbsp;&nbsp;&nbsp;<input type="button" id="editorHeadImgBtn" value="上传" class="uploadBtnCss"></div>
			<div class='textItem' id="editorLevelTypeDatatwens">
				<script language="javascript">
					showSelect("editorLevel","editorLevel","${pojo.editorLevel}",editorLevelTypeData,"editorLevelTypeDatatwens","网编级别：",false,135);
				</script>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorFormAction',this)"/>
			</div>
		</div>
	</form>
	<div class="divInitOne">
		<div class="divInitTwo">
			[${pojo.editorNo}]网编签到管理
		</div>
	</div>
	<div id="wangbianqiandao">
		<jsp:include page="webEditorSign.jsp"></jsp:include>
	</div>
	
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
