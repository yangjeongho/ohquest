<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.login_box {border:1px solid #cccccc; background:#e5e5e5; padding:15px; margin:35px 0 0 0;}
	.login_box:after {display:block;clear:both;content:''}
	.login_box li {float:left;}
	.login_box li p.pass {margin-top:3px;}
	.login_box li.txt {margin:0 10px 0 0;}
	.login_box li.txt img {margin:0 5px 0 0;}
		
	.login_box li input [type=image] {border:solid 1px #242c38; height:18px; width:128px;}
	
	.text01 {margin:40px 0 0 0;}
	
	.relogin_box {width:400px; margin:0 auto; margin-top:90px;}
	.relogin_box01 {border-left:2px solid #000; border-right:2px solid #000; padding:0 40px;}
	.relogin_box_bottom {background:url('<c:url value="/resources/images/login/relogin_bottom.png"/>') 0 0 no-repeat; height:40px;}
	
	.relogin_text {text-align:center; padding-top:30px; color:#333;}
	.relogin_text span.Ltext {font-size:14px; color:#ff0000; font-weight:bold;}
</style>
<c:set value="${pageContext.request.locale.language}" var="lang"/>
<script type="text/javascript">
	$(function(e){
		var waitLogin = false ;
		$("#loginForm #userId").focus();
		$("#loginForm").submit(function(e){
			e.preventDefault();
			if(waitLogin){
				MessageBox.dialog('<s:message code="cmn.index.login"/>');
				return ;
			}
			waitLogin = true ;
			$("#loginBtn").loading({position:'right'});  
			$.ajax({
				type : "POST",  
				async : true,
				url : $("#loginForm").attr('action'),
				data : $("#loginForm").serializeArray(),
				dataType : 'json',
				success : function(data) {
					waitLogin = false ;
					if(data.resultCode == "SUCCESS"){
						processAfterLogin();
					}else if(data.resultCode == "SUCCESS_EXP"){
						MessageBox.dialog("Get New Password. "+data.message+"days left for expire.",function(){
							processAfterLogin();
						});
					}else if(data.resultCode == "SUCCESS_FST"){
						MessageBox.dialog("You logged in first.  You'd better change password.",function(){
							processAfterLogin();
						});
							
					}else if(data.resultCode == "PWDTHREEFAIL"){
						MessageBox.dialog(data.message);
					}else if( data.resultCode == "STSLOCK"){
						//location.href = "<c:url value="/security/textAuth"/>";
						modalPopup();
					}else if( data.resultCode == "PWDEXPIRED"){
						MessageBox.dialog('Password Expired!!!',function(){modalPopup();});
						
					}else{
						MessageBox.dialog(data.message);
					}
					
				},	error:function(data){
					waitLogin = false ;
					//서버 비정상 동작시 구현
					MessageBox.dialog("err.500");
				}, complete:function(jqXHR, textStatus){
					waitLogin = false ;
					;//필요시 구현
					$("#loginBtn").hideLoading();
				}
			});
		});
		function processAfterLogin(){
			var baseURL = "<c:url value="/" />";
			var retUrl = "${param.returnURL}" ; 
			retUrl = retUrl.substring(1);
			var maxDialog = getTopDialog() ;
			//dialog 창이면 
			if(maxDialog != null){
				$("#${param.dialogName} div").load(baseURL + retUrl);	
			}else{//main contents이면.
				$("#mainWorkArea [id=mainWork]").each(function(e){
					if($(this).css('display') != 'none'){
						reloadMainWorkArea($(this).attr('workAreaName'), baseURL + retUrl) ;
						return false;
					}
				});
			}
		}
		$("#loginBtn").click(function(e){
			e.preventDefault();
			if(waitLogin){
				MessageBox.dialog('<s:message code="cmn.index.login"/>');
				return ;
			}
			$("#loginForm").submit();
		});
	});
</script>
<!-- 재로그인 //-->
<div id="wrap_600">
	<div class="relogin_box" >
		<form id="loginForm" action="<s:url value="/security/login2"/>" method="POST" >
			<p><img src="<s:url value="/resources/images/login/relogin_top.png"/>" alt="Log-In" /></p>
			<div class="relogin_box01">
				<div class="relogin_text">
					<span class="Ltext"><s:message code="cmn.session.out1"/></span><br/>
					<s:message code="cmn.session.out2" />
				</div>
				<!-- 로그인 폼 //-->
				<ul class="login_box">
					<li class="txt">
						<p>
							<img src="<s:url value="/resources/images/login/text_id.gif"/>" alt="id" />
							<input type="text" id="userId" name="userId" value="sejoy1" class="form_normal01" />
						</p>
						<p class="pass">
							<img src="<s:url value="/resources/images/login/text_pass.gif"/>"/>
							<input type="password" id="password" name="password" value="1" class="form_normal01" />
						</p>
						<p style="margin-top:2px;">
						Language
						<select id="lang" name="lang" style="width:160px; " class="form_select01" style="clear:both; float:right;">
						<option value="en"><s:message code="cmn.label.select"/></option>
						<code:out codeType="LANGUAGE" value="en" option="listbox"/></select>	
						</p>
					</li>
					<li style="clear:both; float:right; margin-top:-42px; ">
						<input type="image" id="loginBtn" name="submit" src="<s:url value="/resources/images/login/btn_login.gif"/>"/>
					</li>
				</ul>
				<!--// 로그인 폼 -->
			</div>
			<p class="relogin_box_bottom"></p>
		</form>
	</div>
</div> 