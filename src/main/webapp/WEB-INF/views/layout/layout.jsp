<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set value='${sessionScope["org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE"].language}' var="lang" scope="session"/> 
<!DOCTYPE html>
<html lang="kr"> 
<head>
 
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/lib/jquery/ui/themes/base/jquery.ui.all.css" />" />
<!--  <link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/skel.css"/>" /> -->                             
                               
<!--  <link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/styles.css"/>" /> -->                   
<%-- <link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/style-desktop.css"/>" /> --%>
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/kickstart.css"/>" />
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/style.css"/>" />
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/table.css"/>" />

<link type="text/css" rel="stylesheet" href="<s:url value="/resources/lib/jquery/ui/themes/base/jquery.ui.all.css" />" />
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/core/jquery-1.7.2.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/ui/jquery-ui-1.8.22.custom.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/monthpicker/jquery.ui.monthpicker.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/blockui/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/fixedtable/jquery.fixedtable.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/printElement/jquery.printElement.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/json2/json2.js"/>"></script>


<%-- <script type="text/javascript" src="<s:url value="/security/errMessage" />"></script> --%>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/dialog.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/loading.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/code.js"/>"></script>

		<!-- tab -->
		<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/date.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/arFunc.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/jqGridFmt.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/excelDn.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/codeCtrl.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryFileDown/jquery.loadmask.js"/>"></script>
		<!-- tab -->
		
<!-- jqgrid add// -->
<link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/jquery-ui-custom.css" />">
<link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/ui.jqgrid.css" />">
<link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/ui.multiselect.css" />">

<script src="<s:url value="/resources/lib/jqgrid/i18n/grid.locale-en.js" />" type="text/javascript"></script>
<script src="<s:url value="/resources/lib/jqgrid/jquery.jqGrid.min.js" />" type="text/javascript"></script>

<script type="text/javascript" src="<s:url value="/resources/javascript/common/messagebox.js"/>"></script>

                  
<%-- <!--<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/resources/styles/jquery-ui.theme.min.css" />"> -->          

<script type="text/javascript" src="<s:url value="/resources/lib/jquery/ui/jquery-ui-1.8.22.custom.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/monthpicker/jquery.ui.monthpicker.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/blockui/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/fixedtable/jquery.fixedtable.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/printElement/jquery.printElement.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/json2/json2.js"/>"></script>

<script type="text/javascript" src="<s:url value="/resources/javascript/common/messagebox.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/dialog.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/loading.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/code.js"/>"></script>

<script type="text/javascript" src="<s:url value="/resources/javascript/common/jquery.dropotron.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/skel.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/skel-layers.min.js"/>"></script>						
<script type="text/javascript" src="<s:url value="/resources/javascript/common/init.js"/>"></script>		



<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/layout.css"/>" />
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/contents.css"/>" >
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/tab.css"/>" >

		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<!--<script type="text/javascript" src="<s:url value="/resources/javascript/common/jquery.min.js"/>"></script>-->
		<script type="text/javascript" src="<s:url value="/resources/lib/jquery/core/jquery-1.8.0.min.js"/>"></script>
		
		<script type="text/javascript" src="<s:url value="/resources/javascript/common/jquery.dropotron.min.js"/>"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/common/skel.min.js"/>"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/common/skel-layers.min.js"/>"></script>						
		<script type="text/javascript" src="<s:url value="/resources/javascript/common/init.js"/>"></script>		
		<script src="<c:url value="/resources/lib/jqgrid/i18n/grid.locale-en.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/lib/jqgrid/jquery.jqGrid.min.js" />" type="text/javascript"></script>

		<script type="text/javascript" src="<s:url value="/resources/javascript/common/messagebox.js"/>"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/common/dialog.js"/>"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/common/loading.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/common/code.js"/>"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/common/kickstart.js"/>"></script>

		<!-- tab -->
		<script type="text/javascript" src="<s:url value="/resources/javascript/common/tab.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/date.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/arFunc.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/jqGridFmt.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/excelDn.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/codeCtrl.js" />"></script>
		<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryFileDown/jquery.loadmask.js"/>"></script>
		<!-- tab -->


<!-- jqgrid add// -->
<link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/ui.jqgrid.css" />">
<script src="<s:url value="/resources/lib/jqgrid/i18n/grid.locale-en.js" />" type="text/javascript"></script>
<script src="<s:url value="/resources/lib/jqgrid/jquery.jqGrid.min.js" />" type="text/javascript"></script>
 --%>
<c:set value="${ss_member.noAuthList}" var="authList"/>
<script>
/** 권한 제어를 위한 공통 **/
var noAuthList = new Array();
<c:forEach items="${authList}" var="auth">
noAuthList.push({menuId : "${fn:replace(auth.menuId, auth.topMenuId, '')}"});
</c:forEach>
function gf_checkMenuAuth(menuId, msgYn){
	for(var i=0; i<noAuthList.length;i++){
		if(noAuthList[i].menuId == menuId){
			if (msgYn == "Y") MessageBox.dialog ("You do not have permission.");
			return true ;
		}
	}
	return false ;
}

function gf_checkMenuAuthNot(menuId){
	for(var i=0; i<noAuthList.length;i++){
		if(noAuthList[i].menuId == menuId){
			
			return false ;
		}
	}
	return true ;
}

</script>

<title><s:message code="browser.header.title"/></title>
<script type="text/javascript">
	var isLogout = false ;
	var baseUrl = "<s:url value="/"/>";
	var baseLang = "${lang}";
	var gf_marketCode= "${ss_member.branch.marketCode}";
	// 고객조회시 사용될 공용 고객번호를 담을 변수임.
	var pubCustNo = "-1"; //기본:-1 
	<c:if test="${ss_member.branch.marketCode eq '2' }">
	$(function(e){
	$("section hgroup").addClass("pa");
	});
	</c:if>
	
	var windowScreen =  window.screen.height;
	var windowDocument =  window.document.height;
	var defaultScreenHeight900 = 900;
	var defaultScreenHeight860 = 860;
	var defaultScreenHeight835 = 835;
	var defaultScreenHeight800 = 800;
	var defaultScreenHeight720 = 720;
	
	var defaultDivHeight640 = 640;
	var defaultDivHeight720 = 720; 
	var defaultDivHeight540 = 540;
	var defaultDivHeight760 = 640;
	var defaultDivHeight900 = 784;
	
	if (windowScreen < 801 ) {
		defaultDivHeight640 = 540;
		defaultDivHeight720 = 540;
		defaultDivHeight540 = 540;
		defaultDivHeight760 = 540;
		defaultDivHeight900 = 540;
		
		defaultScreenHeight900 = 640;
	    defaultScreenHeight860 = 640;
	    defaultScreenHeight835 = 640;
	    defaultScreenHeight800 = 640;
	    defaultScreenHeight720 = 640;
	} else if (windowScreen < 901 ) {
		defaultDivHeight640 = 540;
		defaultDivHeight720 = 540;
		defaultDivHeight540 = 540;
		defaultDivHeight760 = 540;
		defaultDivHeight900 = 691;
		
		defaultScreenHeight900 = 640;
	    defaultScreenHeight860 = 640;
	    defaultScreenHeight835 = 640;
	    defaultScreenHeight800 = 640;
	    defaultScreenHeight720 = 640;
	}
	

   // window.history.forward();
    /* function noBack() { 
    	window.history.forward(); 
    } */
    
    /* window.onbeforeunload = function() {
    	 if(isLogout){
    		return ;	
    	}else{
    		return "You work will be lost.";	
    	}
   //	}; */
   /* 	var __callbackUnlock__ = null ;
   	function setUnlockComponentCallBackFunction(__function__){
   		__callbackUnlock__ = __function__ ;
   	} */
   	$(function(e){
   		
   		//type=number인것들이 일부 문자들어가도 안지워 지는 문제가 있어서 추가함..
   		/*$('input').live('blur', function(e){
   			if($(this).attr('type') == 'number'){
   				$(this).val($(this).val());	
   			}
   		});*/
   	
   		/* $("#authorityByPasswordDialog").dialog({
   			autoOpen: false,
   			width: 300,
   			height:150,
   			modal : true,
   			title : "Input customer's password!", 		  
   			resizable : false,  
   			closeOnEscape : false 
   		});
   		$("#commonCheckPasswordBtn").click(function(e){
   			e.preventDefault();
   			var custNo = $("#authorityByPasswordDialog").find("#customerCustNo").val();
   			var password = $("#authorityByPasswordDialog").find("#customerPassword").val();
   			if(password == ''){
				MessageBox.dialog("Input password!", function(){
   					
   				});
   				return ;
   			}
   			var customer = gf_getCustomerInfoByPassword(custNo, password);
   			if(customer == null){
   				$("#authorityByPasswordDialog").find("#customerPassword").val('')	;
   				MessageBox.dialog("Wrong password!", function(){
   					
   				});   				
   			}else{
   				__callbackUnlock__(customer);
   	   			
   	   			$("#authorityByPasswordDialog").find("#customerCustNo").val('');
   	   			$("#authorityByPasswordDialog").find("#customerPassword").val('');
   	   			$("#authorityByPasswordDialog").dialog('close');;	
   			}   			
   		});
   		$("#commonClosePasswordBtn").click(function(e){
   			e.preventDefault();
   			$("#authorityByPasswordDialog").dialog('close');
   		}); */
   	});
   	
</script>	
</head>


<body class="homepage" >

		<tiles:insertAttribute name="topContent" />
		<!--container //-->
		<div id="container" >
			<!--content //-->
			<div id="content">
				<!--// 타이틀 -->
				<tiles:insertAttribute name="mainContent" />
			</div>
			<!--//content -->	
			<!-- 바닥영역//-->
			<div id="content">
			<tiles:insertAttribute name="footerContent" />
			</div>
			
		</div>
		
	<!--//container -->
	<%-- <div id="authorityByPasswordDialog" title="Confirm customer's password!" style="display:none;">
		<br>
		Input customer's password : <br>
		<input type="hidden" id="customerCustNo" name="customerCustNo" />
		<input type="password" id="customerPassword" name="customerPassword" class="form_normal01" style="width:96%"/>
		<br>
		<br>
		<div class="contents_box mt_5">
			<!-- 버튼 //-->
			<div class="f_right">
				<span class="btns7 save"><input type="submit" value="<s:message code="cmn.btn.confirm"/>" id="commonCheckPasswordBtn"/></span>
				<span class="btns7 save"><input type="submit" value="<s:message code="cmn.btn.close"/>" id="commonClosePasswordBtn"/></span>
			</div>
		</div>
	</div> --%>

</body>
</html>