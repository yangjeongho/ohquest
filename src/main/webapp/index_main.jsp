<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link type="text/css" rel="stylesheet" href="<s:url value="/resources/lib/jquery/ui/themes/base/jquery.ui.all.css" />" />
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/core/jquery-1.7.2.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/ui/jquery-ui-1.8.22.custom.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/monthpicker/jquery.ui.monthpicker.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/blockui/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/fixedtable/jquery.fixedtable.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/printElement/jquery.printElement.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/json2/json2.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/messagebox.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/properties.jsp" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/dialog.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/code.js"/>"></script>

<!--[if lt IE 9]><script type="text/javascript" src="<s:url value="/resources/javascript/common/html5.js"/>"></script><![endif]-->
<title>TEST</title>
<script type="text/javascript">
	var baseUrl = "<c:url value="/" />";
	var waitLogin = false ;
	$(function(e){
		$("#loginForm #userId").focus();
		$("#loginForm").submit(function(e){
			e.preventDefault();
			if(waitLogin){
				MessageBox.dialog('test1');
				return ;
			}			
			waitLogin = true ;
			$(".login_box #loginBtn").loading({position:'right'}); 
			$.ajax({
				type : "POST",  
				async : true,
				url : $("#loginForm").attr('action'),
				data : $("#loginForm").serializeArray(),
				dataType : 'json',
				success : function(data) {
					waitLogin = false ;
					//alert(data.resultCode);
					if(data.resultCode == "SUCCESS"){
						location.href = "<c:url value="/main"/>";
					}else if(data.resultCode == "SUCCESS_EXP"){
						MessageBox.dialog("Get New Password. "+data.message+"days left for expire.",function(){
							location.href = "<c:url value="main"/>";
						});
					}else if(data.resultCode == "SUCCESS_FST"){
						MessageBox.dialog("You logged in first.  You'd better change password.",function(){
							location.href = "<c:url value="main"/>";
						});
							
					}else if(data.resultCode == "PWDTHREEFAIL"){
						MessageBox.dialog(data.message);
					}else if( data.resultCode == "STSLOCK"){
						//location.href = "<c:url value="/security/textAuth"/>";
						modalPopup();
					}else if( data.resultCode == "PWDEXPIRED"){
						MessageBox.dialog('Password Expired!!!',function(){modalPopup();});
					}else if( data.resultCode == "VALID"){
						MessageBox.dialog(data.message);	
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
				}
			});
		});
		
		$("#loginBtn").click(function(e){
			e.preventDefault();
			if(waitLogin){
				return ;
			}	
			$("#loginForm").submit();			
		});
	});
	
	function modalPopup(){
		var strParam = "";
		//gf_openDialog("#textAuthContentsDialog", "/security/textAuth", strParam,'Text Auth', 320, 165, true);
		var url = "<c:url value="/security/textAuth"/>";
		window.open("", "popW", "width=480, height=340, left=600, top=100, menubar=no, status=no, resizable=no,scrollbars=no, location=no, toolbar=no");
		document.textAuthForm.action = url;
		createHiddenField(document.textAuthForm,"userId",$("#userId").val(),false);
		textAuthForm.target= "popW";
		textAuthForm.submit();
		
		/*Dialog.open({
		div : '#textAuthContentsDialog', 
		url : "<c:url value="/security/textAuth"/>"+"?dialogName=textAuthContentsDialog&userId="+$("#userId").val(),
		title : "Text Char Authentication", 
		width : 480, 
		height : 340, 
		modal : true
		});*/
		
	
	}
	
	
	function createHiddenField(formObj, fieldId, value, isDuplicate){
		var checkDuplicate = false;
		if( isDuplicate ){
			checkDuplicate = isDuplicate;
		}
		if( formObj[fieldId] && !checkDuplicate ){
			formObj[fieldId].value = value;
		}else{
			var fieldObj = document.createElement('input');

			fieldObj.type = 'hidden';
			fieldObj.id = fieldId;
			fieldObj.name = fieldId;
			fieldObj.value = value;

			formObj.appendChild(fieldObj);
		}
	}	
</script>
</head>
<body onload="moveTo(0,0); resizeTo(1300,980);">
<div id="wrap">
	<!--로고 영역 //-->
	<header>
		<p><img src="<s:url value="/resources/images/login/logo.gif"/>" alt="A Cube" /></p>
	</header>
	<!--// 로고 영역 -->

	<!-- 컨텐츠 영역 //-->
	<article>
		<p><img src="<s:url value="/resources/images/login/text_login.gif"/>" alt="LogIn" /></p>
		<!-- 로그인 폼 //-->
		<form id="loginForm" name="loginForm" action="<s:url value="/security/login2"/>" method="POST" onsubmit="return false">
		<ul class="login_box">
			<li class="txt">
			    <table >
			    	<tr>
			    		<td><img src="<s:url value="/resources/images/login/text_id.gif"/>" alt="id" /></td>
						<td><input type="text" id="userId" name="userId" value="yangHo"/></td> 
						<td rowspan="2">&nbsp</td>
			    		<td rowspan="2" >
			    			<input type="image" name="submit" src="<s:url value="/resources/images/login/btn_login.gif"/>"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td><img src="<s:url value="/resources/images/login/text_pass.gif"/>"/></td>
						<td><input type="password" id="password" name="password" value="1"/></td>
			    	</tr>
			    	<tr>
			    		<td>Language</td>
						<td>	</td> 
						<td></td>
						<td></td>
					</tr>
			    </table>
			</li>
		</ul>
		</form>
		<!--// 로그인 폼 -->
		<p class="text01"><img src="<s:url value="/resources/images/login/text01.gif"/>" alt="ID and password are case sensitive, do you type in English, please note." /></p>
	</article>
	
	<form id="textAuthForm" name="textAuthForm" method="POST" onsubmit="return false" ></form>
	
	<!--// 컨텐츠 영역 -->
</div>

</body>
</html>
