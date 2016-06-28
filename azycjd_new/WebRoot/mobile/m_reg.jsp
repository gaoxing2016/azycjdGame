<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="m_head.jsp"></jsp:include>
	<style type="text/css">
		#menu_div_head{ display:none;}
		#head_logo_div{ display:none;}
		.login_txt{ border:#d5d3d3 1px solid;border-radius:4px; font-size:18px; height:40px; line-height:40px; width:70%; padding-left:10px;}
		.login_div_css div{ margin-top:20px; font-family:"黑体";}
		.shuqianmulv{ margin:0 auto; width:230px; overflow:auto;}
		.shuqianmulv ul{ margin:0px; padding:0px; list-style:none; font-family:"黑体";}
		.shuqianmulv li{ float:left; cursor:pointer; width:110px; line-height:36px; text-align:center; font-weight:bold;}
	
	</style>
	<script type="text/javascript">
		var type=0;
		function liClick(types){
			if(types==0){
				$('#mulu_div').css('display','block');
				$('#mulv_li').css('background-color','#6ae2c7');
				$('#shuqian_li').css('background-color','#e8e8e8');
				$('#shuqian_div').css('display','none');
			}else{
				$('#mulu_div').css('display','none');
				$('#mulv_li').css('background-color','#e8e8e8');
				$('#shuqian_li').css('background-color','#6ae2c7');
				$('#shuqian_div').css('display','block');
			}
			type=types;
		}
		
		function regData(){
			if(!(/\S{1,50}/).test($("#tel_uname").val())){
				alert("用户名数据不合法！");
				return;
			}
			if(!(/\w{6,50}/).test($("#tel_pass").val())||!(/\w{6,50}/).test($("#tel_pass_1").val())){
				alert("密码或密码确认数据不合法！");
				return;
			}
			
			if($("#tel_pass").val()!=$("#tel_pass_1").val()){
				alert("两次输入密码不一致！");
				return;
			}
			if(!(/\S{1,50}/).test($("#tel_nick").val())){
				alert("昵称数据不合法！");
				return;
			}
			if(type==0){
				if(!(/1[3,4,5,7,8]\d{9}/).test($("#tel_phone").val())){
					alert("手机号码数据不合法！");
					return;
				}
			}else{
				if(!(/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/).test($("#tel_email").val())){
					alert("邮箱格式不合法！");
					return;
				}
			}
			$.post(path+"/anzhimember/addAnzhiMemberMobile.do",{
				memberNo:$("#tel_uname").val(),
				menberPassword:$("#tel_pass").val(),
				memberNick:$("#tel_nick").val(),
				memberEmail:$("#tel_email").val(),
				memberTel:$("#tel_phone").val(),
				type:type
			},function(res){
				if(res=="yes"){
					window.location.href=path+"/mobile/m_index.do?menu_type=0";
				}else{
					alert(res);
				}
			});
		}
	</script>
	<div align="center" style="margin-top:35px;">
		<img src="<%=request.getContextPath() %>/mobile/images/login_logo.png" width="260" />
	</div>
	<div style="background-color:#FFFFFF; padding:8px;margin-top: 50px;">
		<div class="shuqianmulv">
			<ul>
				<li id="mulv_li" style="border-radius:6px 0px 0px 6px; background-color:#6ae2c7;" onclick="liClick(0)">绑定电话</li>
				<li id="shuqian_li" style="border-radius:0px 6px 6px 0px;background-color:#e8e8e8;" onclick="liClick(1)">绑定邮箱</li>
			</ul>
		</div>
	</div>
	
	<div class="login_div_css" style="width:90%; margin:0 auto; padding-top:20px;">
		<div>
			<span style="padding-left: 15px;">用户名：</span>
			<input class="login_txt" type="text" id="tel_uname" name="tel_uname" placeholder="请输入用户名" />
		</div>
		<div>
			<span style="padding-left: 32px;">密码：</span>
			<input class="login_txt" type="password" id="tel_pass" name="tel_pass"/>
		</div>
		<div>
			密码确认：
			<input class="login_txt" type="password" id="tel_pass_1" name="tel_pass_1"/>
		</div>
		<div>
			<span style="padding-left: 32px;">昵称：</span>
			<input class="login_txt" type="text" id="tel_nick" name="tel_nick" placeholder="请输入昵称" />
		</div>
		<div id="shuqian_div" style="display: none;">
			<span style="padding-left: 32px;">邮箱：</span>
			<input class="login_txt" type="text" id="tel_email" name="tel_email" placeholder="请输入邮箱" />
		</div>
		<div id="mulu_div">
			<span style="padding-left: 32px;">电话：</span>
			<input class="login_txt" type="text" id="tel_phone" name="tel_phone" placeholder="请输入电话" />
		</div>

		<div class="btn_r_css" onclick="regData()">
			提交
		</div>
		
		<div class="btn_m_css" onclick="window.location.href='<%=request.getContextPath()%>/mobile/m_login.jsp'">
			直接登录
		</div>
	</div>
	
<jsp:include page="m_foot.jsp"></jsp:include>