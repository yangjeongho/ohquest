<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>
<script type="text/javascript">




$(function(e){	
	
	
	memoInit();


	$("#memoKdMainDiv #contentsDivmemoKd #memoGrid").jqGrid({
		datatype : "local",
		height : 170,
		width : 770,
		colNames : [ 
								'<s:message code="memoKd.label.MemoCode"/>',//
								'<s:message code="memoKd.label.MemoName"/>',//
								'<s:message code="memoKd.label.MemoDivision"/>',//
								'<s:message code="memoKd.label.Memo"/>',//
								'<s:message code="memoKd.label.ParameterNumber"/>',//
								  ], 
		colModel : [ 
			             		 { name : 'manfCd',  		index : 'manfCd', 	 		width : "80",   	sorttype : "string",		align:'left' }, 
					             { name : 'manfNm', 		index : 'manfNm',			width : "150", 		sorttype : "string",		align:'left' },
						         { name : 'svcType2',    	index : 'svcType2',    		width : "100", 		sorttype : "string",		align:'left' },
					             { name : 'cardManfYn',    	index : 'cardManfYn',    	width : "290", 		sorttype : "string",		align:'left' },						             
			          		  	 { name : 'rgstDt',    		index : 'rgstDt',    		width : "100", 		sorttype : "string",		align:'left' ,formatter:barPlus },

			       ],
	
   	   	viewrecords: true,
   	   	shrinkToFit: false,
	   	multiselect: true,
   	   	caption: 'Memo List', 
   		onSelectRow: function (id) {			
        }
	});
	
	
	
	//저장버튼
	$("#memoKdMainDiv #memoForm #memoKdSaveBtn").click(function(e){
		e.preventDefault();
		
		var vmemoCode = $("#memoInputForm #memoCode").val();
		var vmemoName = $("#memoInputForm #memoName").val();
		var vmemoDivision = $("#memoInputForm #memoDivision").val();
		var vsysMemo = $("#memoInputForm #sysMemo").val();
		var vparamNum = $("#memoInputForm #paramNum").val();
		
		
		
		
		if (vmemoCode == "" ) {
     		$("#memoInputForm #memoCode").focus();
     		MessageBox.dialog('<s:message code="memoKd.msg.000001"/>');
			return;
		}	
		
		if (vmemoName == "" ) {
			$("#memoInputForm #memoName").focus();
			MessageBox.dialog('<s:message code="memoKd.msg.000002"/>');
			return;
		}
			
		if (vmemoDivision == "" ) {
			$("#memoInputForm #memoDivision").focus();
			MessageBox.dialog('<s:message code="memoKd.msg.000003"/>');
			return;
		}
			
		if (vsysMemo == "" ) {
			$("#memoInputForm #sysMemo").focus();
			MessageBox.dialog('<s:message code="memoKd.msg.000004"/>');
			return;
		}
			
		if (vparamNum == "" ) {
			$("#memoInputForm #paramNum").focus();
			MessageBox.dialog('<s:message code="memoKd.msg.000005"/>');
			return;
		}
	   
	});
	// 닫기버튼
	$("#memoKdMainDiv #memoForm #memoKdCloseBtn").click(function(e){
		e.preventDefault();
		Dialog.close('#${param.dialogName}');
	});
	// 조회버튼
	$("#memoKdMainDiv #memoKdSearchForm #momoKdSearchBtn").click(function(e){
		e.preventDefault();
		MessageBox.dialog('<s:message code="ar.ar22.label.000001"/>');
	});	
	
	
	// 페이지 이동 버튼 누를 때
	$("#memoPageNav").click(function(e){
		e.preventDefault();
		if(memoPageNavCom("memoSearchForm")){	
		};
	});
	
});

// grid 초기화 & page 초기화
function memoInit(){
	$("#memoKdMainDiv #contentsDivmemoKd #totalCnt").text(0);
	$("#memoKdMainDiv #contentsDivmemoKd #currentCnt").text(0);
	$("#memoKdMainDiv #contentsDivmemoKd #page").val(0);
	
	$("#memoKdMainDiv #contentsDivmemoKd #memoGrid").jqGrid("clearGridData", true);
}




// 페이지 숫자 표시
function memoPageNavCom(form){
	var totalCnt = $("#"+form).find("[id=totalCnt]").text() ;
	var currentCnt = $("#"+form).find("[id=currentCnt]").text() ;
	if(parseInt(totalCnt) == parseInt(currentCnt)) {
		return false;
	}
	return true;
}





</script>
<div id="memoKdMainDiv" class="warp">

	<div id="searchDivmemoKd" class="contents_box">

		<!-- 검색조건이 한줄일 경우 //-->
		<div class="search_box_01">
			<form id="memoKdSearchForm" >
				<div class="f_left">
					<p>
						<s:message code="code.label.000002"/><input id="searchCodeType" name="searchCodeType" type="text" class="form_normal01" style="width: 200px;" value=" "/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<s:message code="code.label.000007"/><input id="searchCodeName" name="searchCodeName" type="text" class="form_normal01" style="width: 200px;" value=" "/>
					</p>
				</div>
			
				<!-- 조회 버튼 //-->
				<div class="f_right">
					<img src="<s:url value="/resources/images/common/line_01.gif"/>" />
					<span class="btns9 save"><input type="submit" value='<s:message code="cmn.btn.search"/>'  id="momoKdSearchBtn"/></span>
				</div>
			</form>
			<!--// 조회 버튼 //-->
		</div>
		<!--// 검색조건이 한줄일 경우 -->
    </div>
    
    <!-- 메모 리스트 -->
    <div id="contentsDivmemoKd" class="contents_box">
    	<div class="title">
			<h1><s:message code="memoKd.label.MemoKindList"/></h1>
		<!-- 페이지 표시 -->
		<div class="contents_box mt_20" >
			<div class="title">
				<ul class="btn_listtop f_right">
					<li class="page"><span class="text" id="currentCnt"></span> <s:message code="co.label.slash"/> <span class="text" id="totalCnt"></span></li>
					<li><a href="#" id="manfPageNav"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
				</ul>
				<input type="hidden" id="page" name="page" value="0">
			</div>						
		</div>
		<!-- //페이지 표시 -->
		</div>
		<!-- 메모테이블 -->
		<table id="memoGrid"></table>
    	<div class="title">
			<h1><s:message code="memoKd.label.MemoKindDetail"/></h1>
		</div>
		<!-- 입력 Form -->
		<form id="memoInputForm">
			<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
			<tr>
			 <th>Memo Code</th> 
			 <td><input id="memoCode" name="memoCode" type="text" class="form_normal01" style="width: 300px;" value="" ></td>
			</tr>
			<tr> 
			 <th>Memo Name</th> 
			 <td><input id="memoName" name="memoName" type="text" class="form_normal01" style="width: 300px;" value="" ></td> 
			</tr>
			<tr>
	    	 <th>Memo Division</th> 
	    	 <td><select class="form_select01" id="memoDivision" name="memoDivision" style="width: 200px;"> 
	    	 	<option value="">Choose</option>
	    	 	<option value="A"><s:message code="co.label.A"/></option>
	    	 	<option value="B"><s:message code="co.label.B"/></option>
	    	 	</select></td>
	    	 </tr>
	    	 <tr>
	    	 <th>Memo</th>
	    	 <td><textarea id="sysMemo" name="sysMemo" class="form_normal01" style="width: 670px; height: 80px;" value="" ></textarea></td>
	    	 </tr>
	         <tr>
	         <th>Parameter Number</th>
	         <td><input id="paramNum" name="paramNum" type="text" class="form_normal01" style="width: 200px;" value=""></td>
	         </tr>
	    	</table>    
        </form>
    	
		
    </div>
    
    <div id="buttonDivmemoKd" class="contents_box">
	    <form id="memoForm">
			<div class="contents_box mt_5">
				<div class="f_right">
					<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.save"/>'  id="memoKdSaveBtn"/></span>			
					<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.close"/>'  id="memoKdCloseBtn"/></span>
				</div>
			</div>	
		</form>
	 </div>
</div>