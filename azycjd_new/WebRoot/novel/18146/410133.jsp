<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("contextPath", path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>1.  慕容大小姐</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/azycjs.css"/>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript">var memberId='${loginUsers.id}';</script>
	<script language="javascript">var readAddress='${param.readAddress}';</script>
	
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.color.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/azycjd.js"></script>
	<script language="javascript">readJsp=true;</script>
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
	<script language="javascript">var path='<%=path%>';</script>
	<script language="javascript">var memberId='${loginUsers.id}';</script>
	<script language="javascript">var novelId='18146';</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/index/css/index.css"/>
	<script language="javascript" src="<%=path %>/js/azycjd.js"></script>
	<style type="text/css">
		img{border: none;}	
	</style>
	<!--[if lte IE 7]>
		<div id="browseTips" style="width:830px;background-color:#FFFFFF; margin:0 auto; margin-top:40px;margin-bottom:20px;line-height:23px;">
			我们发现您使用的IE浏览器版本距离现在已经很遥远了。为了更好的体验本系统，我们建议您升级浏览器。您可以选择：<br />
 			<a target="_blank" href="http://rj.baidu.com/soft/detail/14917.html?ald">IE10</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/11843.html?ald">火狐浏览器</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>|<a href="javascript:closeBrowseTip()">关闭</a>
		</div>
 		
	<![endif]-->
	<script type="text/javascript">
		var timer;
	    $(function(){
	        $(window).scroll(function(){
	            clearInterval(timer);
	            var topScroll=getScroll();
	            var topDiv="80px";
	            var top=topScroll+parseInt(topDiv);
	            timer=setInterval(function(){
	                $(".read_ds").animate({"top":top},0);
	                $(".read_left_menu").animate({"top":top},0);
	            },0)
	        });
	        
	        $(".huanfu div").click(function(){
	        	var t=$(this)[0].id.split("@");
	        	$("#novel_content").css("color","#"+t[1]).css("background-color","#"+t[0]);
	        });
	        
	        $(".replyContent").each(function(){
				$(this).slideToggle("fast");
			});
			
			$(document).bind("contextmenu",function(e){   
            	return false;   
		    });
		    $(document).bind("mousedown",function(e){   
		        if(e.which==1||e.which==3){
	        	  return false;    	
		        }
		    });
		    
		    $("#zitidiv li").click(function(){
		    	var tds=$(this)[0].id;
		    	tds=tds.substring(8,tds.length);
		    	$("#novel_content").css("font-size",tds+"px");
		    	$("#zitidivparent").html("字体["+tds+"号]");
		    	SetCookie("novel_font_size",tds);
		    	$("#zitidiv").slideUp('fast');
		    });
		    $("#beijingdiv li").click(function(){
		    	$("#novel_content").css("background-color","#"+$(this)[0].id);
		    	$("#beijingdivparent").html("背景["+$(this).html()+"]");
		    	SetCookie("novel_bg_color",$(this)[0].id);
		    	SetCookie("novel_bg_color_name",$(this).html());
		    	$("#beijingdiv").slideUp('fast');
		    });
		    var novel_font_size=getCookie("novel_font_size");
		    if(novel_font_size!=null&&novel_font_size!=undefined){
		    	$("#novel_content").css("font-size",novel_font_size+"px");
		    	$("#zitidivparent").html("字体["+novel_font_size+"号]");
		    }
		    var novel_bg_color=getCookie("novel_bg_color");
		    var novel_bg_color_name=getCookie("novel_bg_color_name");
		    if(novel_bg_color!=null&&novel_bg_color!=undefined){
		    	$("#novel_content").css("background-color","#"+novel_bg_color);
		    	$("#beijingdivparent").html("背景["+novel_bg_color_name+"]");
		    }
		    
		    if(readAddress!=''){
		    	($(window).scrollTop(parseInt(readAddress)));
		    }
		    
		    window.onkeydown=function(e){
				if(e.keyCode==39){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=410133&&novelId=18146";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=410133&&novelId=18146";
				}else if(e.keyCode==67){
					return false;
				}else if(e.keyCode==17){
					return false;
				}else if(e.keyCode==123){
					return false;
				}else if(e.keyCode==86){
					return false;
				}else if(e.keyCode==65){
					return false;
				}else if(e.keyCode==83){
					return false;
				}else if(e.keyCode==13){
					window.location.href='<%=request.getContextPath()%>/novel/18146/index.jsp';
				}
			}
		    
	    });
	    function getScroll(){
             var bodyTop = 0;  
             if (typeof window.pageYOffset != 'undefined') {  
                     bodyTop = window.pageYOffset;  
             } else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') {  
                     bodyTop = document.documentElement.scrollTop;  
             }  
             else if (typeof document.body != 'undefined') {  
                     bodyTop = document.body.scrollTop;  
             }  
             return bodyTop;
	    }
	    function loadReportReasonJsp(){
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+410133+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[1.  慕容大小姐]</div>",
				width: 860,
				height: 600,
				top:90,
				buttons: { '关闭': true },
				closed:function(){
					$("#body_index").css("background-color","#f0f0f0").css("padding","0px").css("margin","0px");
				}
			});	
		}
		
		function changeFontSize(num){
			var n=parseInt($("#novel_content").css("font-size"));
			n+=num;
			$("#novel_content").css("font-size",n+"px");
		}
		
		function huanfu(){
			$("#huanfu").slideToggle();
		}

		function showMulv(){
			if($("#mulvdiv")[0].style.display==""||$("#mulvdiv")[0].style.display=="none"){
				$("#mulvdiv")[0].style.display="block";
				$("#mulvdiv").animate({marginLeft:'30px'});
			}else{
				$("#mulvdiv")[0].style.display="none";
				
				$("#mulvdiv").css("margin-left","0px");
			}
		}

	</script>
  </head>
  
  <body id="body_index" style="padding:0px; margin:0px;background: center 0px no-repeat #f0f0f0;">
  	 <c:if test="${readFlag eq 'no' }">
  	 	<div class="no_read_flag_css">
  	 		该章节是VIP章节。
  	 		${errorInfo }
  	 		<a href="javascript:;" onclick="buyChapter('410133')">购买</a>
  	 	</div>
  	 </c:if>
  	 <c:if test="${readFlag eq 'yes' }">
	    <div class="read_top">
	    	<div class="huanfu" id="huanfu">
	     		<div id="f7f5ed@292927" style="background-color: #f7f5ed"></div>
	     		<div id="e1e8b2@292927" style="background-color: #e1e8b2"></div>
	     		<div id="bdebe1@292927" style="background-color: #bdebe1"></div>
	     		<div id="cfd5bb@292927" style="background-color: #cfd5bb"></div>
	     		<div id="ebd1de@292927" style="background-color: #ebd1de"></div>
	     		<div id="bfe1c6@292927" style="background-color: #bfe1c6"></div>
	     	</div>
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/18146.jsp'">盛世宠妃之春梦无痕</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:羽罚奇异</div>
	    		</div>
	    		<div class="novel_info_read_div">
	    			<div id="zitidivparent" style="background:url(<%=request.getContextPath()%>/images/9_p_3.png) no-repeat 20px 14px;" onclick="$('#zitidiv').slideToggle('fast');">字体[12号]</div>
	    			<ul id="zitidiv">
	    				<li style="font-size: 12px;" id="fontSize12">安之<span>12号</span></li>
	    				<li style="font-size: 14px;" id="fontSize14">安之<span>14号</span></li>
	    				<li style="font-size: 16px;" id="fontSize16">安之<span>16号</span></li>
	    				<li style="font-size: 18px;" id="fontSize18">安之<span>18号</span></li>
	    				<li style="font-size: 20px;" id="fontSize20">安之<span>20号</span></li>
	    				<li style="font-size: 22px;" id="fontSize22">安之<span>22号</span></li>
	    			</ul>
	    		</div>
	    		<div class="novel_info_read_div">
	    			<div id="beijingdivparent" style="background:url(<%=request.getContextPath()%>/images/10_p_1.png) no-repeat 15px 11px;" onclick="$('#beijingdiv').slideToggle('fast');">背景[默认(白)]</div>
	    			<ul id="beijingdiv">
	    				<li style="background-color: #ffffff;" id="ffffff">默认(白)</li>
	    				<li style="background-color: #e1e8b2;" id="e1e8b2">浅绿</li>
	    				<li style="background-color: #bdebe1;" id="bdebe1">浅蓝</li>
	    				<li style="background-color: #cfd5bb;" id="cfd5bb">浅灰</li>
	    				<li style="background-color: #ebd1de;" id="ebd1de">小粉</li>
	    				<li style="background-color: #bfe1c6;" id="bfe1c6">青色</li>
	    			</ul>
	    		</div>
	    		<div id="fontBold_chapter">
	    			加粗
	    		</div>
	    	</div>
	    </div>
	    <div class="read_content">
	    	<div class="read_content_left">
	    		<div class="read_left_menu" id="read_left_menu">
	    			<!-- <div id="mulvdiv">
	    				novel_chapter.chapter.menu
	    			</div>
	    			<p><a href="javascript:showMulv()">目录</a></p> -->
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/18146/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(410133 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','18146','盛世宠妃之春梦无痕','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(410133,18146,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第1章&nbsp;&nbsp;&nbsp;1.  慕容大小姐
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<div><p class='chapter_content_read_css'>	&nbsp; 樱花树下，她靠在树旁，望着树上渐渐凋零的樱花，有种说不出来的凄凉。“小姐，老爷找你。”青果说道“恩，知道了，走吧！”<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;大厅中一身穿着宝蓝色的男人站在那里，那身衣服为他本就惊艳的容貌添加一笔色彩。“你来了，等你很久了。”上官嘉定的话语里有些生疏。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“不知老爷找妾身来有何要事？”她的语气和上官嘉定并无差别。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“我找你是有事告诉你。我打算娶荣馨为妻，而你就回你的慕容府吧！带上休书，从此以后你慕容紫萱与我上官嘉定恩断义绝。”<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;慕容紫萱顿了一下，说到：“上官嘉定你终于要休我了？好，我走，祝你们幸福。”慕容紫萱转身离去，上官嘉定看着远去的淡紫色的身影，他心中莫名其妙的刺痛了一下。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;青果从外面回来，看到慕容紫萱在收拾东西，疑惑的问道：“小姐，你这是干什么呀？”慕容紫萱看着这个和自己一起长大的丫鬟，心中的难过都化作泪流了下来，一年的陪伴说离开就离开，心里多少也有些难过。慕容紫萱这一哭，可把青果吓坏了，赶忙安慰到：“小姐，这是怎么了？好好地干嘛要哭呀？有人欺负你还有老爷和夫人呢！”慕容紫萱一听到还有爹娘帮她就说“没错，我还有爹娘。走，回慕容府。”<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;慕容紫萱带着青果回到了那个生活了16年的家，来到慕容府的大门口，那里只有看门的仆人。“大小姐？！”仆人们惊讶的喊到。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“嗯”慕容紫萱淡淡的回了一句。嫁出去的女儿忽然回来，惊讶是少不了的。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;一进门就看到了蔡嬷嬷，慕容紫萱开心的喊到:“蔡嬷嬷！”<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“小姐怎么回来了？”一见慕容紫萱从远处走来，蔡嬷嬷一脸欢喜地迎了上去，可她知道，慕容紫萱回来的不是时候。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“恩，我被他休了，只能回来了。反正我还有爹娘呢！”蔡嬷嬷一脸难为的看着慕容紫萱，心底在想：小姐呀！您是不知道那件事，恐怕老爷是不会管你了。虽然心里这么想但是嘴上可不敢这么说。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“小姐……”蔡嬷嬷的话还没说完，就被两个丫鬟的声音打断了。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“咦？那不是大小姐吗？”<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“就是，她怎么回来了？”<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“你看青果手里拿的包袱，恐怕是被休了吧！”<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“被休也是活该，毕竟不是……”<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;丫鬟话还没说完就被蔡嬷嬷打断了。“你们这两个小丫头，在这里碎什么嘴？！还不去干活？”好在那丫鬟说的最后一句慕容紫萱没有听到，蔡嬷嬷松了口气。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“好了，我见见爹去。”慕容紫萱说完便走向书房。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;&nbsp;她没进书房便说到:“爹，女儿回来了。”书房中慕容博览放下手中的信，抬头说道：“一年不见，你可是憔悴多了。好好的怎么回来了？”慕容博览说到。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“他……把我休了。”慕容紫萱回到。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“这……那你就好好待在家里吧！”慕容博览楞了一下，说到。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“嗯。爹，最近娘过得可好？”慕容紫萱问到。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;“她……很好。婧儿说要带你去你舅舅家，你回轩阁好好休息，过几日便出发吧！”慕容紫萱察觉到慕容博览的语气不似从前那样溺爱，倒有些远离。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;慕容紫萱并没有多想，回到:“是，女儿先走了。”慕容博览看着远去的身影，说了一句可惜了便去做自己的事了。<br /><p class='chapter_content_read_css'>&nbsp;&nbsp;<p class='chapter_content_read_css'></div>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=410133&&novelId=18146'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/18146/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=410133&&novelId=18146'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','18146','盛世宠妃之春梦无痕','yes')"/>
	    		</div>
	    	</div>
	    </div>
  	 </c:if>
     

    <div class="read_foot">
   		<p style="padding-top: 43px;">Copyright 2006-2012&nbsp;&nbsp;
   			 www.azycjd.com &nbsp;&nbsp;
   			  All Rights Reserved&nbsp;&nbsp;
   			   版权所有&nbsp;&nbsp;
   			    云南安柔科技有限公司
   		</p>
   		<p>
   			滇ICP备12006807号-1 &nbsp;&nbsp;滇网文许字【2014】1100-002号
   		</p>
    </div>
    <script>
      $("#fontBold_chapter").click(function(){
      	$("#novel_content").toggleClass("fontBold");
      });
    </script>
  </body>
</html>
