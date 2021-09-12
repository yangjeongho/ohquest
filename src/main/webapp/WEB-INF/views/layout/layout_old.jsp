<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript" src="<s:url value="/security/errMessage" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/dialog.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/loading.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/code.js"/>"></script>

<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/layout.css"/>" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/styles/styles.css"/>" />
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
<!-- tab -->

<!-- Ubi Report 호출함수-->
<script type="text/javascript" src='<s:url value="/resources/javascript/common/ubiReportSetting.js" />'></script>
<!-- Ubi Report 호출함수-->

<!-- IE 8.0을 위한 스크립트 -->
<!--[if lt IE 9]><script type="text/javascript" src="../js/html5.js"></script><![endif]-->
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
	
	
	jQuery("#list5").jqGrid({        
	   	url:'server.php?q=2',
		datatype: "json",
	   	colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
	   	colModel:[
	   		{name:'id',index:'id', width:55},
	   		{name:'invdate',index:'invdate', width:90},
	   		{name:'name',index:'name', width:100},
	   		{name:'amount',index:'amount', width:80, align:"right"},
	   		{name:'tax',index:'tax', width:80, align:"right"},		
	   		{name:'total',index:'total', width:80,align:"right"},		
	   		{name:'note',index:'note', width:150, sortable:false}		
	   	],
	   	rowNum:10,
	   	rowList:[10,20,30],
	   	pager: '#pager5',
	   	sortname: 'id',
	    viewrecords: true,
	    sortorder: "desc",
	    caption:"Simple data manipulation",
	    editurl:"someurl.php"
	}).navGrid("#pager5",{edit:false,add:false,del:false});
	
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
   		$('input').live('blur', function(e){
   			if($(this).attr('type') == 'number'){
   				$(this).val($(this).val());	
   			}
   		});
   	
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
   	
   	//Ubi_Report에 관련 변수(weblogic과 tomcat에 contextPath가 다르므로 전역변수화 시킴)
   	var contextPathForUbi = "${pageContext.servletContext.contextPath}" == "/" ? "" : "${pageContext.servletContext.contextPath}";	
</script>	
</head>
<body style="width:1280px" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
		<tiles:insertAttribute name="topContent" />
		<!--container //-->
		<div id="container" >
			<!--content //-->
			<div id="content">
			
			<td>didwjdghskdjfksdjfkdjf</td>
				<!--// 타이틀 -->
				<tiles:insertAttribute name="mainContent" />
			</div>
			<!--//content -->	
			<!-- 오른쪽영역 //-->
			<tiles:insertAttribute name="footerContent" />
			<!--// 오른쪽영역 -->
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
	
	
	<script type="text/javascript">
    
	
	
	
	
	$("#myTodoTable").mouseover(function(e){
	    $(this).css("cursor","pointer");
	});

	jQuery("#myTodoTable").jqGrid({        
		//data : JSON.parse($("#myTodoListJson").val()),
		datatype: "local",
		colNames: [ 
		            
		            '<s:message code="ar.ar1.label.000001"/>',//Type
		            '<s:message code="ccs.ccsWork003_120318.workerTaskTable.lable.000001"/>',//Work Details
		            '<s:message code="bs.bsArManage.grid.000015"/>',//Receipt Date
		            '<s:message code="ccs.csCccs000.taskHistoryListTable.lable.ScheduledDate"/>',//
		            '<s:message code="cs.lable.cug.000048"/>',//Cust No
		            '<s:message code="cs.label.000046"/>',//Subscriber Id
		            '<s:message code="cs.lable.cug.000058"/>',//Cust Name
		            '<s:message code="ccs.csCccs000.taskHistoryListTable.lable.Custphone"/>',//Cust phone
		            '<s:message code="ar.ar22.label.000010"/>',//Address

		            ],
		colModel: [
		   			  {name:'gubun', index:'gubun', width:'80'}
		          	, {name:'activityDesc', index:'activityDesc', width:'120'}
		          	
		          	, {name:'regDate', index:'regDate', width:'110'}
		          	, {name:'hopeDate', index:'hopeDate', width:'100'}
		          	, {name:'custNo', index:'custNo', width:'80'}
		          	, {name:'entrNo', index:'entrNo', width:'80'}
		          	
		          	, {name:'counselName', index:'counselName', width:'200'}		          
		          	, {name:'counselTel', index:'counselTel', width:'80'}
		          	, {name:'fullAddr', index:'fullAddr', width:'300'}
		          	
		          	
		      	  ],
		sortable: true,
		height: '200',
		width: '960',
		multiselect: false,
	   	viewrecords: true,
	   	shrinkToFit: false,
	  //Row를 더블 클릭했을경우 발생하는 이벤트
	   	ondblClickRow : function(rowid, iRow, iCol,e){
	   		var rowData=$("#noticeListForm #myTodoTable").getRowData(rowid);
	   		
	   	     //화면 오픈여부 체크후의 로직
	   		//구분값이 COUNSEL일경우(Search Sub's 로 연결...)
	   		if(rowData.gubun == "COUNSEL"){  
	   			
	   			//$("[menuId=searchSubscriber]").click();
		   		if(rowData.entrNo == null || rowData.entrNo == "" || rowData.entrNo == "&nbsp;"){//subscribeID가 우선이 되어야한다. (subscribeId가없을경우 custNO로 조회)
		   			if(rowData.custNo == null || rowData.custNo == "" ||rowData.custNo == "&nbsp;"){
		   				//둘다 없는 경우는 리턴
		   				return;
		   			}else{
	   				//custno가 있는경우
		   				if ($('[workareaname=searchSubscriber]').length > 0){ 
				   			//화면이 열려있는경우(right메뉴의 workareaname 속성명 체크)
				   			//열려 있다면 셀선택값(custno인지 subscriberid 인지 체크해서 조회를 태운다.)
			   				$("[menuId=searchSubscriber]").click();
			   				$("#subscriptionCustomerSearchForm #searchKey").val("CUSTID");//콤보셋팅(아직 코드값이없음..20131316)
							$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.custNo);//조회조건셋팅
							$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
							Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.
				   			
				   		}else{
				   		//화면이 열려있지 않은 경우는 화면 오픈	
				   			createMainWorkArea('searchSubscriber',
												$("<a href=\"#\" id=\"menuClick\" menuId=\"searchSubscriber\" ><U>S</U>earch Sub's</a>"), 
												baseUrl+'resources/images/common/left/csCust000.gif',
												baseUrl+"cs/csCust000?dialogName=dialogContent");
				   			
			   				
		   					setTimeout(function(){
				   				$("#subscriptionCustomerSearchForm #searchKey").val("CUSTID");//콤보셋팅(아직 코드값이없음..20131316)
								$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.custNo);//조회조건셋팅
								$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
				   			},500);
						   			
				   			
							Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.
				   		}
			   			
	   				}
	   			}else{
	   				//subscribeId가있는경우 값셋팅
	   				if ($('[workareaname=searchSubscriber]').length > 0){ 
			   			//화면이 열려있는경우(right메뉴의 workareaname 속성명 체크)
			   			//열려 있다면 셀선택값(custno인지 subscriberid 인지 체크해서 조회를 태운다.)
		   				$("[menuId=searchSubscriber]").click();
	   					$("#subscriptionCustomerSearchForm #searchKey").val("ENTR");
						$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.entrNo);//조회조건셋팅
						$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
						Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.
			   			
			   		}else{
			   		//화면이 열려있지 않은 경우는 화면 오픈	
			   			createMainWorkArea('searchSubscriber',
											$("<a href=\"#\" id=\"menuClick\" menuId=\"searchSubscriber\" ><U>S</U>earch Sub's</a>"), 
											baseUrl+'resources/images/common/left/csCust000.gif',
											baseUrl+"cs/csCust000?dialogName=dialogContent");
			   			
			   			setTimeout(function(){
			   				$("#subscriptionCustomerSearchForm #searchKey").val("ENTR");
							$("#subscriptionCustomerSearchForm #searchValue_1").val(rowData.entrNo);//조회조건셋팅
							$("#subscriptionCustomerSearchForm #searchBtn").click();//조회버튼클릭
			   			},500);
			   			
			   			
						Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.
			   		
			   			
			   		}
	   				
	   			}
		   	//구분값이 ORDER 인경우 (TASK > TASK Task Receipt로 연결)
	   		}else if(rowData.gubun == "ORDER"){
	   			if(rowData.entrNo != null || rowData.entrNo != "" || rowData.entrNo != "&nbsp;"){
		   			Dialog.open({
						div : '#ccsWork001Dialog',
						url : baseUrl + "ccs/ccsWork001"
								+ "?dialogName=ccsWork001Dialog&req_entrno="+rowData.entrNo,
						title : '<s:message code="cmn.label.TaskReceipt"/>',//
						width : 1030,
						height : 685,
						modal : true
					});
		   			Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.}
	   			}else{
	   				Dialog.open({
						div : '#ccsWork001Dialog',
						url : baseUrl + "ccs/ccsWork001"
								+ "?dialogName=ccsWork001Dialog",
						title : '<s:message code="cmn.label.TaskReceipt"/>',//
						width : 1030,
						height : 685,
						modal : true
					});
		   			Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.}
	   			}
	   		//구분값이 WORK인 경우(TASK > Mytask로 연결)	
	   		}else{
	   			if(rowData.entrNo != null || rowData.entrNo != "" || rowData.entrNo != "&nbsp;"){
	   				
		   			Dialog.open({
						div : '#ccsWork003Dialog',
						url : baseUrl + "ccs/ccsWork003_1"
								+ "?dialogName=ccsWork003Dialog&req_entrno="+rowData.entrNo,
						title :'<s:message code="cmn.label.MyTask"/>',//
						width : 1127,
						height : 690,
						modal : true
					});
   				
		   			Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.}
	   				
	   			}else{
	   				Dialog.open({
						div : '#ccsWork003Dialog',
						url : baseUrl + "ccs/ccsWork003_1"
								+ "?dialogName=ccsWork003Dialog",
						title :'<s:message code="cmn.label.MyTask"/>',//
						width : 1127,
						height : 690,
						modal : true
					});
   				
		   			Dialog.close('#${param.dialogName}'); //조회후 화면을 닫는다.}
	   			}
	   		}
	   	}
	   	,afterInsertRow : function(rowid) {
        	var rowData = $('#noticeListForm #myTodoTable').getRowData(rowid);
        	
        	var tomorrow = gf_getGapDate(1);
        	if ( rowData.hopeDate!=null && rowData.hopeDate!=''){
	    		var hopeDate = rowData.hopeDate.replace("-","").replace("-","");
	    		tomorrow = tomorrow.replace("-","").replace("-","");
	    		if (Number(hopeDate) - Number(tomorrow)  < 0){
	    			$("#myTodoTable [id="+rowid+"]").css("background", "#fdecca");
	    		}
        	}
        	
	 	}

	});
	
	
	
	
	$("[id=noticeList]").click(function(e) {
			Dialog.open({
				div:'#noticeViewDialog',
				url : baseUrl + "notice/noticeView/"+$(this).attr("mode")+"?dialogName=noticeViewDialog",
				title : '<s:message code="cmn.label.notice"/>',//
				width : 760,
				height :450,
				modal : true
		  });
	});
	
	$("#seeMore").click(function(e) {
		e.preventDefault();
		Dialog.open({
			div : '#noticeDialog',
			url : baseUrl + "notice/notice_detail"
					+ "?dialogName=noticeDialog",
			title : '<s:message code="cmn.label.notice"/>',
			width : 810,
			height : 600,
			modal : true
		});

	});
	
	
	
	try{
	    var myWorkJobListListData = JSON.parse($("#myTodoListJson").val());
	    if(myWorkJobListListData != null){
			for(var i=0;i<myWorkJobListListData.length;i++){
				if(myWorkJobListListData[i].hopeDate!=null && myWorkJobListListData[i].hopeDate !=''  ){
					myWorkJobListListData[i].hopeDate = myWorkJobListListData[i].hopeDate.substr(0,4)+"-"+myWorkJobListListData[i].hopeDate.substr(4,2)+"-"+myWorkJobListListData[i].hopeDate.substr(6,2);
	    		} 
				var receiptDate = "";
				if ( myWorkJobListListData[i].regDate!=null && myWorkJobListListData[i].regDate !='' ){
					receiptDate = gf_getTodayDate2(myWorkJobListListData[i].regDate,"-");
					myWorkJobListListData[i].regDate = receiptDate;
				}
				jQuery("#myTodoTable").jqGrid('addRowData',i+1,myWorkJobListListData[i]);
			}
	    }
	
	}catch(exception){
	} 
	
	function delayTime(){
	}
	
	
	
	//그리드 Cell에 마우스를 올렸을때 발생하는 이벤트
	$('#myTodoTable .jqgrow').mouseover(function(e) {
			var rowId = $(this).attr('id');
		    $("#myTodoTable [id="+rowId+"]").css("background","#DADADA");
		}); 
	//그리드 Cell에 마우스가 벗어났을때 발생하는 이벤트
	$('#myTodoTable .jqgrow').mouseout(function(e) {
			var rowId = $(this).attr('id');
			var rowData = $("#myTodoTable").getRowData(rowId);
			var hopeDate = rowData.hopeDate.replace("-","").replace("-","");
			var tomorrow = gf_getGapDate(1);
			tomorrow = tomorrow.replace("-","").replace("-","");
	if ( hopeDate!=null && hopeDate!=''&&hopeDate!='&nbsp;'){
		if (Number(hopeDate) - Number(tomorrow)  < 0){
			$("#myTodoTable [id="+rowId+"]").css("background","#fdecca");
			
		}else{
			$("#myTodoTable [id="+rowId+"]").css("background","#FFFFFF");
		}
	}else{
		$("#myTodoTable [id="+rowId+"]").css("background","#FFFFFF");
	}

	});
	
	
</script>
<form id="noticeListForm">
	<div id="wrap">
		<div class="main_box_1">
			<h1><s:message code="cmn.label.mytodolist"/></h1>
			<div class="h1_btn">
				<%-- <span class="btns2 save"><input type="submit"
					value="More" /></span> --%>
			</div>
			<div class="con">
				<table class="main_list_01_1" border="0" frame="hsides" rules="none"
					bordercolor="#dfdfdf" id="myTodoTable" name="myTodoTable">
					<textarea id="myTodoListJson" name="myTodoListJson" style="display:none">${myTodoList}</textarea>
				</table>
			</div>
		</div>
		<div class="main_box_1">
			<h1><s:message code="cmn.label.notice"/></h1>
			<div class="h1_btn">
				<span class="btns2 save"><input type="submit" value='<s:message code="cmn.btn.seeMore"/>' id="seeMore"></span>
			</div>
			<div class="con">
				<table class="main_list_02_1" border="0" frame="hsides" rules="none"
					bordercolor="#dfdfdf">
					<col width="80%" />
					<col width="20%" />
					<c:choose>
						<c:when test="${not empty list}">
							<c:forEach var="list" items="${list}" varStatus="listIndex">
								<c:if test="${listIndex.index<9 }">
									<tr>
										<td><input type="hidden" id="seqNo" name="seqNo" value="${list.seqNo }"><a href="#" id="noticeList" mode="${list.seqNo }"><font color="${list.titleColor}">${list.title}</font></a></td>
										<td class="date"><fmt:formatDate pattern="yyyy/MM/dd"
												value="${list.nDate}" /></td>
									</tr>
								</c:if>
							</c:forEach>

						</c:when>
					</c:choose>
				</table>
			</div>
		</div>
		
		
	</div>
			
			
				
	<table id="list5"></table>
<div id="pager5"></div>
<br />
<a href="#" id="a1">Get data from selected row</a>
<br />
<a href="#" id="a2">Delete row 2</a>
<br />
<a href="#" id="a3">Update amounts in row 1</a>
<br />
<a href="#" id="a4">Add row with id 99</a>
<script src="manipex.js" type="text/javascript"> </script>
<br />
</form>
</body>
</html>