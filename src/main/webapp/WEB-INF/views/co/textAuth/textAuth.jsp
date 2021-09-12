<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<c:set value='${sessionScope["org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE"].language}' var="lang" scope="session"/> 
<!DOCTYPE html>
<html lang="${lang}"> 
<head> 
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
<script type="text/javascript" src="<s:url value="/resources/javascript/common/loading.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/code.js"/>"></script>

<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/layout.css"/>" />

<c:if test="${ss_member.branch.marketCode eq '1' }">
	<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/contents.css"/>" >
	<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/tab.css"/>" >
</c:if>
<c:if test="${ss_member.branch.marketCode eq '2' }">
	<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/contents_univision.css"/>" >
	<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/tab_univision.css"/>" >
</c:if>

<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/jquery.loadmask.css"/>" >

<!-- jqgrid add// -->
<link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/ui.jqgrid.css" />">
<script src="<s:url value="/resources/lib/jqgrid/i18n/grid.locale-en.js" />" type="text/javascript"></script>
<script src="<s:url value="/resources/lib/jqgrid/jquery.jqGrid.min.js" />" type="text/javascript"></script>

<!--// jqgrid add -->
<!-- jquery tab// -->
<!-- tab -->
<script type="text/javascript" src="<s:url value="/resources/javascript/common/tab.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/date.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/arFunc.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/jqGridFmt.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/excelDn.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/codeCtrl.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryFileDown/jquery.loadmask.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqmodal/jqModal.js"/>"></script>
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/jqModal.css"/>" >

<script language="javascript" charset="utf-8" >
	function reqCapCharSign (formObj) {
    	var inCapCharText= formObj.inCapCharText.value;
    	if($.trim($('#inCapCharText').val()).length != 6){
			$.jqueryValidMsgFocus('보안문자를 정확하게 입력하세요.','inCapCharText','inCapCharText');
			return false;
		}
    	formObj.submit();
    }
	
	 function replaceCapChar(){
     	//formObj.action="/idi/mbrm/info/RetrieveReCapCharText.hpi";
     	
     	//formObj.submit();

     	$('#capp').removeAttr('src');
     	$('#capp').attr('src',"<s:url value="/security/getTextAuth" />");
     	

     }
	 
	 function jqueryValidHide(errorElement) {
		//alert(errorElement);
		$('label[for="' + errorElement + '"]').hide();
	 }
		 
	 function onKeyPressFilter(filter, e) {
		var key;
		var keychar;


		if (window.event) {
		   // IE에서 이벤트를 확인하기 위한 설정
			key = window.event.keyCode;
		} else if (e) {
		  // FireFox에서 이벤트를 확인하기 위한 설정
			key = e.which;
		} else {
			return true;
		}		

		if ((key == null) || (key == 0) || (key == 8) || (key == 9) || (key == 13) || (key == 27)) {
			return true;
		}

		keychar = String.fromCharCode(key);
		
		
		var re = new RegExp(filter);
		if (re.test(keychar)) return true;
		else return false;
		
	}
	 
	function jqueryValidMsgFocus (msg, errorElement, focusElement,msgType) {
		if(msgType == 'B'){
			$.jqueryValidMsg( msg ,errorElement);
			$('#'+focusElement).focus();
		}else{
			alert(msg);
			$('#'+focusElement).focus();
		} 
	}
	
	function jqueryValidMsg(msg, errorElement) {
		$('label[for=' + errorElement + ']').show().html(msg);
	}
	
	function closeThis(){
		//e.preventDefault();
		//Dialog.close('#${param.dialogName}');
		self.close();
	}
	
	var opt = "N";
	var baseUrl = "<c:url value="/" />";
	var waitLogin = false ;
	$(function(e){
		$("#capcharCertFrm #inCapCharText").focus();
		$("#capcharCertFrm").submit(function(e){
			e.preventDefault();
			if($.trim($('#inCapCharText').val()).length != 6){
				jqueryValidMsgFocus('Input the security character correctly','inCapCharText','inCapCharText');
				//MessageBox.dialog("Input the security character correctly");
				//$('#inCapCharText').focus();
				return false;
			}
			/*if(waitLogin){
				MessageBox.dialog('<s:message code="cmn.index.login"/>');
				return ;
			}*/
			
			//waitLogin = true ;
			//$("#loginBtn").loading({position:'right'}); 
			
			$.ajax({
				type : "POST",  
				async : true,
				url : $("#capcharCertFrm").attr('action'),
				data : $("#capcharCertFrm").serializeArray(),
				dataType : 'json',
				success : function(data) {
					
					if(data.resultCode == "SUCCESS"){
						//location.href = "<c:url value="/main"/>";
						//MessageBox.dialog("Password initialized!");
						alert('<s:message code="code.msg.000031"/>');
						//Dialog.close('#${param.dialogName}');
						closeThis();
					}else{
						MessageBox.dialog(data.message);
					}
				},	error:function(data){
					//서버 비정상 동작시 구현
					MessageBox.dialog("err.500");
				}, complete:function(jqXHR, textStatus){
						
					;//필요시 구현
				}
			});
		});
		
		$("#cfmBtn").click(function(e){
			e.preventDefault();
			/*if(waitLogin){
				MessageBox.dialog('<s:message code="cmn.index.login"/>');
				return ;
			}*/	
			$("#capcharCertFrm").submit();
			
		});
		
		$("#cancelBtn").click(function(e){
			e.preventDefault();
			//Dialog.close('#${param.dialogName}');
			closeThis();
		});
	});
	
	$(document).ready(function(){
		//alert("${userId}");
		//$("#userId").val(opener.loginForm.userId);
	});
</script>
<div id="textAuthContentsDialog"></div>        
<div id="productMain01">
	<form name="capcharCertFrm" id="capcharCertFrm" method="post" action ="<s:url value="/security/getTextAuthLogin" />">
	<div class="f_left" style="width: 100%;">
		<p class="title"><s:message code="co.label.scurityCharAuthentication"/></p>
		  <p class="chptcha" id="CAP_CHAR_CONTENTS"><img name="capp" id="capp" src=<s:url value="/security/getTextAuth" /> /></p>
		
		<div class="search_box_01">
			<p><s:message code="code.msg.000029"/></p>
			<input type="text" size="26" class="intext01 mo_textbox_chptcha" name="inCapCharText" id="inCapCharText" 
				style="ime-mode:disabled;" maxlength="6" 
				onKeyPress="return onKeyPressFilter('[a-z]', event,this.id);" 
				onKeyUp="return jqueryValidHide('inCapCharText');"/> 
			<a href="#//acube;" class="btns3 save" onClick="replaceCapChar();"><span><s:message code="cmn.label.refresh"/></span></a>
			<input type ="hidden" name="userId" id="userId" value="${userId}">
			<label class="error" generated="true" for="inCapCharText"></label>
			<c:if test="${rtnData.bizMsg != null}">
			<label class="error" generated="true" for="inCapCharText">${rtnData.bizMsg}</label>
			</c:if>
		</div>
		
		<P>
		<input type="radio" name="notiCd" value="sms" checked ><s:message code="code.msg.000032"/><!-- Get Pwassword by SMS-->
		<input type="radio" name="notiCd" value="email"><s:message code="code.msg.000033"/><!-- Get Pwassword by Email-->
		<P>
			
		<div class="contents_box mt_5 both">
		
			<div class="f_right" style="width: 30%;">
				<span class="btns3 save"><input type="button" id="cfmBtn"  name= "cfmBtn"   value='<s:message code="cmn.label.ok"/>'></span>
				<span class="btns3 save"><input type="button" id="cancelBtn"  name= "cancelBtn"   value='<s:message code="cmn.btn.cancel"/>'></span>
				<!--  <a href="#" class="jqmClose">Close</a>-->
			</div>
		</div>
	</div>
	</form>
</div>
