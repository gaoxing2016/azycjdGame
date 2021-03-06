<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="m_head.jsp"></jsp:include>
<div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td valign="top" width="80">
			<div class="bangdan_css" id="fixed_div" style="position: fixed; width:80px;">
				<div style=" background:url(<%=request.getContextPath() %>/mobile/images/p_b.png) no-repeat #FFFFFF;">玄幻·奇幻</div>
				<div>武侠·仙侠</div>
				<div>都市·异能</div>
				<div>历史·军事</div>
				<div>游戏·竞技</div>
				<div>科幻·灵异</div>
				<div>现代言情</div>
				<div>古代言情</div>
			</div>
		</td>
		<td valign="top" style="background-color:#FFFFFF;">
			<div style="padding:5px;">
				<c:forEach items="${shukuData }" var="k" varStatus="ind">
					<div class="bangdan_items" id="bangdan_items${ind.index }" style="<c:if test='${ind.index eq 0 }'>display:block;</c:if><c:if test='${ind.index ne 0 }'>display:none;</c:if>">
						<!-- BIG DIV -->
						<c:forEach items="${k.list }" var="s" varStatus="ind">
							<div class="paihangbang">
								<table width="100%" border="0">
								  <tr>
									<td valign="top" width="100" align="center">
										<div class="m_novel_img" onclick="loadNovel(${s.id})"><img src="${s.mNovelImg }"/></div>
									</td>
									<td valign="top" class="novel_items">
										<div class="novel_title_css" onclick="loadNovel(${s.id})">${s.novelTitle }</div>
										<div class="novel_author_css">${s.authorWriterName }</div>
										<div class="novel_info_css" style="text-indent:20px;">
											${fn:substring(s.mVote,0,12) }...
										</div>
										<div class="novel_types_info">
											<span style="font-size:12px;">${s.novelType }</span>
											<span>
												<c:if test="${s.state eq 2 }">
													<img src="<%=request.getContextPath() %>/mobile/images/lianzai.png"/>
												</c:if>
												<c:if test="${s.state eq 3 }">
													<img src="<%=request.getContextPath() %>/mobile/images/yiwanjie.png"/>
												</c:if>	
												<c:if test="${s.isSigned eq 1 }">
													<img src="<%=request.getContextPath() %>/mobile/images/yiqianyue.png"/>
												</c:if>											
											</span>
										</div>
										<div class="novel_types_info">
											<c:if test="${s.isSigned eq 0 }">
												<c:if test="${s.isWebUp eq 1}">
													<img src="<%=request.getContextPath() %>/mobile/images/wangzhanshangjia.png"/>
												</c:if>
												<c:if test="${s.isPingTaiUp eq 1}">
													<img src="<%=request.getContextPath() %>/mobile/images/pingtaishangjia.png"/>
												</c:if>
											</c:if>											
										</div>
									</td>
								  </tr>
								</table>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
				<div id="lodingData" style="display: none;">
					数据加载中...
				</div>
			</div>
		</td>
	  </tr>
	</table>
</div>
<script type="text/javascript">
	$(function(){
		$(".bangdan_css").css("line-height",(document.body.clientHeight-60)/8+"px");
		window.onscroll=function(){
			ownScroller();
		}
	});
</script>
<jsp:include page="m_foot.jsp"></jsp:include>