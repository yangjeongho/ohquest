<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var ccmItemSeq = "";
var qnaQuestion = "";
var clearGrid = "";
var qnaLinkQuestion = "";
var ccmItemLinkSeq = "";
var mode = "";
var linkLevel = "";
var chkSearch = "";
var chkMsg = "";

$(function(e){
	common_tab("counselQnA_div");
	counselQnAInitGrid();
	$("#counselQnAGrid1").css({cursor:'pointer'});
	
	//그리드 초기화
	function counselQnAInitGrid(){
		$("#counselQnAGrid1").jqGrid({
			datatype : "local",
			height :200,
			width : 760,
			colNames : [ 
			             '<s:message code="counsel.label.000008"/>',//'ccmItemSeq',
			             '<s:message code="cs.lable.cust.000098"/>',//'itemType',
			             '<s:message code="counsel.label.000009"/>',//'itemNm',
			             '<s:message code="or.user000.label.040"/>',//'description'
						], 
			colModel : [ 
			             { name : 'ccmItemSeq',   			index : 'ccmItemSeq',           width : "100",  sorttype : "string", hidden:true}, 
			             { name : 'itemType', 				index : 'itemType', 			width : "50", 	sorttype : "string"},
			             { name : 'itemNm', 				index : 'itemNm', 				width : "450", 	sorttype : "string"},
			             { name : 'description', 			index : 'description', 			width : "225", 	sorttype : "string"}
			           ],
		    
			multiselect : false,
	   	   	viewrecords : true,
	   	   	shrinkToFit : false,
	        onSelectRow : function (id) {
	        	var rowData = gf_getGridDataByRowId("#counselQnAGrid1", id);
	        	ccmItemSeq = rowData.ccmItemSeq;
	        	
	        	$("#counselQnAForm #itemType").val(rowData.itemType);
	        	$("#counselQnAForm #itemNm").val(rowData.itemNm);
	        	$("#counselQnAForm #description").val(rowData.description);
        	}
		});
	}
	
	//page
	function pageNavCom(form){
		var totalCnt = $("#"+form).find("[id=totalCnt]").text();
		var currentCnt = $("#"+form).find("[id=currentCnt]").text();
		if(parseInt(totalCnt) == parseInt(currentCnt)) {
			return false;
		}
		return true;
	}
	
	// QnA 페이징
	$("#counselQnAForm #pageBtn").click(function(e){
		e.preventDefault();
		if(!pageNavCom("counselQnAForm")){
			return;
		};
		
		var data = {searchKey : $("#counselQnAForm #searchKey").val(), searchValue :  $("#counselQnAForm #searchValue").val(), page : $("#counselQnAForm #page").val()};
		counselQnAListAjax(baseUrl + "co/counselQnASearch", "counselQnAGrid1", data);
	 });
	
	//Search
	$("#counselQnAForm #counselQnASearch").click(function(e){
		e.preventDefault();
		
		chkSearch = "Y";
		counselQnAGridReset("counselQnAForm");
		var data = {searchKey : $("#counselQnAForm #searchKey").val(), searchValue :  $("#counselQnAForm #searchValue").val(), page : $("#counselQnAForm #page").val()};
		counselQnAListAjax(baseUrl + "co/counselQnASearch", "counselQnAGrid1", data);
	});
	
	//page초기화
	function counselQnAGridReset(form){
		$("#"+form).find("[id=totalCnt]").text(0);
		$("#"+form).find("[id=currentCnt]").text(0);
		$("#"+form).find("[id=page]").val(0);
	}
	
	//저장
	$("#counselQnAForm #counselQnASave").click(function(e){
		e.preventDefault();
		
		if($("#counselQnAForm #itemType")==""){
			MessageBox.dialog('<s:message code="counsel.msg.000011"/>');
			return;
		}
		if($("#counselQnAForm #itemNm")==""){
			MessageBox.dialog('<s:message code="counsel.msg.000012"/>');
			return;
		}
		if(ccmItemSeq!=""){
			 MessageBox.confirm('<s:message code="counsel.msg.000013"/>' ,function(){
				 counselQnASave();
			 });
		}else{
			 counselQnASave();
		}
	});
	
	function counselQnASave(){
		var counselQnA = {
				ccmItemSeq		: ccmItemSeq	
				, itemType		: $("#counselQnAForm #itemType").val()
				, itemNm		: $("#counselQnAForm #itemNm").val()
				, description	: $("#counselQnAForm #description").val()
		};
		
		divMask("#counselQnAMainDiv","Uploading...");
		$.ajax({
			type : "post",  
			async : false,
			contentType: "application/json",
			url : baseUrl + "co/counselQnASave",
			data : JSON.stringify(counselQnA),
			dataType : 'json',
			success : function(data) {
				if(data.messageParam.resultCode == "SUCCESS"){
					MessageBox.dialog('<s:message code="cmn.msg.saved" />');
					$("#counselQnAForm #counselQnASearch").click();
				}else{
					MessageBox.dialog(data.messageParam.message);
				}
			},	error:function(data){
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
				divUnmask("#counselQnAMainDiv");
			}
		});
	}
	
	//삭제
	$("#counselQnAForm #counselQnADelete").click(function(e){
		e.preventDefault();
		
		if(gf_getSelectedGridData("#counselQnAGrid1")==null){
			MessageBox.dialog('<s:message code="counsel.msg.000014"/>');
			return;
		}
		
		var counselQnA = gf_getSelectedGridData("#counselQnAGrid1", false);
// 		alert(JSON.stringify(counselQnALink));
		divMask("#counselQnAMainDiv","Uploading...");
		$.ajax({
			type : "post",  
			async : false,
			contentType: "application/json",
			url : baseUrl + "co/counselQnADelete",
			data : JSON.stringify(counselQnA),
			dataType : 'json',
			success : function(data) {
				if(data.messageParam.resultCode == "SUCCESS"){
					MessageBox.dialog('<s:message code="cmn.msg.saved" />');
					$("#counselQnAForm #counselQnASearch").click();
					ccmItemSeq = "";
				}else{
					MessageBox.dialog(data.messageParam.message);
				}
			},	error:function(data){
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
				divUnmask("#counselQnAMainDiv");
			}
		});
	});
	
	// 엔터키 입력
	enterSubmit("#counselQnAForm #searchValue","#counselQnASearch");
	
	$("#counselQnAForm #counselQnASearch").click();
	
	//닫기
	$("#counselQnAForm #counselQnAClose").click(function(e){
		e.preventDefault();
		Dialog.close('#${param.dialogName}');
	});
	
	//QnA초기화
	$("#counselQnAForm #counselQnANewQnA").click(function(e){
		e.preventDefault();
		
		ccmItemSeq = "";
    	$("#counselQnAForm #itemType").val("");
    	$("#counselQnAForm #itemNm").val("");
    	$("#counselQnAForm #description").val("");
	});
});

function counselQnAListAjax(url, grid, data){
	var totCnt = "";
	var curCnt = "";
	var page = "";
	var form = "";
	if(grid == "counselQnAGrid1"){
		totCnt = "totalCnt";
		curCnt = "currentCnt";
		page = "page";
		form = "counselQnAForm";
	}else if(grid == "counselQnALinkQuesGrid"){
		totCnt = "totalCnt2";
		curCnt = "currentCnt2";
		page = "page2";
		form = "counselQnALinkForm";
	}else if(grid == "counselQnAQuesGrid"){
		totCnt = "totalCnt3";
		curCnt = "currentCnt3";
		page = "page3";
		form = "counselQnALinkForm";
	}else if(grid == "counselQnAAnswGrid"){
		totCnt = "totalCnt4";
		curCnt = "currentCnt4";
		page = "page4";
		form = "counselQnALinkForm";
	}
	divMask("#counselQnAMainDiv","Uploading...");
	$.ajax({
		type : "post",  
		async : false,
		contentType: "application/json",
		url : url,
		dataType : 'json',
		data : JSON.stringify(data),
		success : function(data) {
			if(data.map.list.length>0){
				if(chkSearch == "Y"){
					$("#"+grid).clearGridData();
				}
				gf_addMultiGridList("#"+grid, data.map.list);
				if(data.map.pagination != null){
					$("#"+form).find("[id="+page+"]").val(data.map.pagination.currentPage+1);
					$("#"+form).find("[id="+totCnt+"]").text(data.map.pagination.objectsCount);
					$("#"+form).find("[id="+curCnt+"]").text( $("#"+grid).getDataIDs().length);
				}else{
					$("#"+form).find("[id="+page+"]").val(0);
					$("#"+form).find("[id="+totCnt+"]").text(1);
					$("#"+form).find("[id="+curCnt+"]").text(1);
				}
			}else{
				if(clearGrid=="Y"){
					$("#"+grid).clearGridData();	
				}
				if(chkMsg==""){
					MessageBox.dialog('<s:message code="cos.msg.none.data"/>');
				}
			}
			chkSearch = "";
			clearGrid = "";
			chkMsg = "";
		},	error:function(data){
			MessageBox.dialog("err.500");
		}, complete:function(jqXHR, textStatus){
			divUnmask("#counselQnAMainDiv");
		}
	});	   
}

////////////////// Item_End /////////////////////
///////////////// Item_Link_Start ///////////////

$(function(e){
	counselQnALinkInitGrid();
	$("#counselQnALinkQuesGrid").css({cursor:'pointer'});
	$("#counselQnALinkAnswGrid").css({cursor:'pointer'});
	$("#counselQnAQuesGrid").css({cursor:'pointer'});
	$("#counselQnAAnswGrid").css({cursor:'pointer'});
	
	function counselQnALinkInitGrid(){
		$("#counselQnALinkQuesGrid").jqGrid({
			datatype : "local",
			height :155,
			width : 360,
			colNames : [ 
			             '<s:message code="counsel.label.000016"/>',//'ccmItemLinkSeq',
			             '<s:message code="counsel.label.000017"/>',//'parentCcmItemLinkSeq',
			             '<s:message code="counsel.label.000001"/>',//'ccmItemQuesSeq',
			             '<s:message code="counsel.label.000019"/>',//'ccmItemAnswSeq',
			             '<s:message code="cs.lable.cust.000098"/>',//'ccmItemSeq',
			             '<s:message code="cs.lable.cust.000098"/>',//'itemType',
			             '<s:message code="counsel.label.000009"/>',//'itemNm',
			             '<s:message code="counsel.label.000021"/>',//'linkLevel'
						], 
			colModel : [ 
			             { name : 'ccmItemLinkSeq',   		index : 'ccmItemLinkSeq',           width : "110",  sorttype : "string", hidden:true}, 
			             { name : 'parentCcmItemLinkSeq',	index : 'parentCcmItemLinkSeq',     width : "110",  sorttype : "string", hidden:true}, 
			             { name : 'ccmItemQuesSeq',   		index : 'ccmItemQuesSeq',           width : "110",  sorttype : "string", hidden:true}, 
			             { name : 'ccmItemAnswSeq',   		index : 'ccmItemAnswSeq',           width : "110",  sorttype : "string", hidden:true}, 
			             { name : 'ccmItemSeq',   			index : 'ccmItemSeq',           	width : "110",  sorttype : "string", hidden:true}, 
			             { name : 'itemType', 				index : 'itemType', 				width : "50", 	sorttype : "string"},
			             { name : 'itemNm', 				index : 'itemNm', 					width : "245", 	sorttype : "string"},
			             { name : 'linkLevel', 				index : 'linkLevel', 				width : "30", 	sorttype : "string"}
			           ],
		    
			multiselect : false,
	   	   	viewrecords : true,
	   	   	shrinkToFit : false,
	        onSelectRow : function (id) {
	        	var rowData = gf_getGridDataByRowId("#counselQnALinkQuesGrid", id);
	        	var data = {searchKey : "A', 'QA", parentCcmItemLinkSeq : rowData.ccmItemLinkSeq, ccmItemLinkSeq: rowData.ccmItemLinkSeq, page : 0};
	        	qnaLinkQuestion = rowData.ccmItemLinkSeq;
	        	clearGrid = "Y";
	        	chkSearch = "Y";
	    		counselQnAListAjax(baseUrl + "co/counselQnALinkList", "counselQnALinkAnswGrid", data);
	    		mode = "updateLink";
	    		//셀렉트박스 리플레쉬
// 	    		var tempCcmItemSeq = rowData.ccmItemSeq;
	    		chkSearch = "Y";
// 	    		alert(rowData.ccmItemLinkSeq);
				counselQnAListAjax(baseUrl + "co/counselQnALinkSearch", "counselQnAQuesGrid", {searchKey : $("#counselQnALinkForm #itemType3").val(), pageChk : "Y", ccmItemLinkSeq : rowData.ccmItemLinkSeq} );
	        	var item = gf_getAllGridData("#counselQnAQuesGrid");
				$("#counselQnAQuesGrid").jqGrid('setSelection',item[0].keyId);
// 	        	for(var i=0; i<item.length ;i++){
// 	        		if(tempCcmItemSeq == item[i].ccmItemSeq){	        			
// 	        			$("#counselQnAQuesGrid").jqGrid('setSelection',item[i].keyId);
// 	        		}else{
// 	        			gf_deleteGridRow("#counselQnAQuesGrid", item[i].keyId);
// 	        		}
// 	        	}
	        	$("#counselQnALinkForm #itemType3").val("").attr("disabled",true);
	        	
	        	linkLevel = rowData.linkLevel;
	        	ccmItemLinkSeq = rowData.ccmItemLinkSeq;
        	}
		});
		
		$("#counselQnALinkAnswGrid").jqGrid({
			datatype : "local",
			height :155,
			width : 360,
			colNames : [ 
						 '<s:message code="counsel.label.000016"/>',//'ccmItemLinkSeq',
						 '<s:message code="counsel.label.000020"/>',//'ccmItemSeq',
						 '<s:message code="cs.lable.cust.000098"/>',//'itemType',
						 '<s:message code="counsel.label.000009"/>',//'itemNm',
						 '<s:message code="counsel.label.000021"/>',//'linkLevel'
						], 
			colModel : [ 
						 { name : 'ccmItemLinkSeq',   		index : 'ccmItemLinkSeq',       width : "110",  sorttype : "string", hidden:true},
			             { name : 'ccmItemSeq',   			index : 'ccmItemSeq',           width : "110",  sorttype : "string", hidden:true}, 
			             { name : 'itemType', 				index : 'itemType', 			width : "50", 	sorttype : "string"},
			             { name : 'itemNm', 				index : 'itemNm', 				width : "245", 	sorttype : "string"},
			             { name : 'linkLevel', 				index : 'linkLevel', 			width : "30", 	sorttype : "string"}
			           ],
		    
			multiselect : false,
	   	   	viewrecords : true,
	   	   	shrinkToFit : false,
	        onSelectRow : function (id) {
	        	var rowData = gf_getGridDataByRowId("#counselQnALinkAnswGrid", id);
	        	qnaQuestion = rowData.ccmItemSeq;
	        	ccmItemLinkSeq = rowData.ccmItemLinkSeq;
	        	chkSearch = "Y";
	        	//셀렉트박스 리플레쉬
				counselQnAListAjax(baseUrl + "co/counselQnALinkSearch", "counselQnAQuesGrid", {searchKey : $("#counselQnALinkForm #itemType3").val(), pageChk : "Y", ccmItemLinkSeq : ccmItemLinkSeq} );
	        	var item = gf_getAllGridData("#counselQnAQuesGrid");
	        	$("#counselQnAQuesGrid").jqGrid('setSelection',item[0].keyId);
// 	        	for(var i=0; i<item.length ;i++){
// 	        		if(qnaQuestion ==item[i].ccmItemSeq){	        			
// 	        			$("#counselQnAQuesGrid").jqGrid('setSelection',item[i].keyId);
// 	        		}else{
// 	        			gf_deleteGridRow("#counselQnAQuesGrid", item[i].keyId);
// 	        		}
// 	        	}
	        	mode = "";
	        	$("#counselQnALinkForm #itemType3").val("").attr("disabled",true);
        	}
		});
		
		$("#counselQnAQuesGrid").jqGrid({
			datatype : "local",
			height :155,
			width : 360,
			colNames : [ 
						 '<s:message code="counsel.label.000016"/>',//'ccmItemLinkSeq',
						 '<s:message code="counsel.label.000020"/>',//'ccmItemSeq',
						 '<s:message code="cs.lable.cust.000098"/>',//'itemType',
						 '<s:message code="counsel.label.000009"/>',//'itemNm',
						], 
			colModel : [ 
						 { name : 'ccmItemLinkSeq',   		index : 'ccmItemLinkSeq',       width : "110",  sorttype : "string", hidden:true},
			             { name : 'ccmItemSeq',   			index : 'ccmItemSeq',           width : "110",  sorttype : "string", hidden:true}, 
			             { name : 'itemType', 				index : 'itemType', 			width : "50", 	sorttype : "string"},
			             { name : 'itemNm', 				index : 'itemNm', 				width : "280", 	sorttype : "string"}
			           ],
		    
			multiselect : false,
	   	   	viewrecords : true,
	   	   	shrinkToFit : false,
	        onSelectRow : function (id) {
	        	var rowData = gf_getGridDataByRowId("#counselQnAQuesGrid", id);
	        	var data = {searchKey : "A','QA", ccmItemSeq : rowData.ccmItemSeq, page : 0};
	        	qnaQuestion = rowData.ccmItemSeq;
	        	clearGrid = "Y";
	        	chkSearch = "Y";
	        	if(rowData.itemType=="S"){//만족도일때
		    		counselQnAListAjax(baseUrl + "co/counselQnASearch", "counselQnAAnswGrid", {searchKey : "A", ccmItemSeq : rowData.ccmItemSeq, page : 0});
		    		$("#counselQnALinkForm #itemType4").val("A");
	        	}else{
		    		counselQnAListAjax(baseUrl + "co/counselQnASearch", "counselQnAAnswGrid", data);
		    		$("#counselQnALinkForm #itemType4").val("A','QA");
	        	}
        	}
		});
		
		$("#counselQnAAnswGrid").jqGrid({
			datatype : "local",
			height :155,
			width : 360,
			colNames : [ 
						 '<s:message code="counsel.label.000020"/>',//'ccmItemSeq',
						 '<s:message code="cs.lable.cust.000098"/>',//'itemType',
						 '<s:message code="counsel.label.000009"/>',//'itemNm',
						], 
			colModel : [ 
			             { name : 'ccmItemSeq',   			index : 'ccmItemSeq',           width : "110",  sorttype : "string", hidden:true}, 
			             { name : 'itemType', 				index : 'itemType', 			width : "50", 	sorttype : "string"},
			             { name : 'itemNm', 				index : 'itemNm', 				width : "255", 	sorttype : "string"}
			           ],
		    
			multiselect : true,
	   	   	viewrecords : true,
	   	   	shrinkToFit : false,
	        onSelectRow : function (id) {
	        	
        	}
		});
	}
	
	//page초기화
	function counselQnAGridReset2(id){
		var totCnt = "";
		var curCnt = "";
		var page = "";
		var form = "counselQnALinkForm";
		if(id=="itemType2"){
			totCnt = "totalCnt2";
			curCnt = "currentCnt2";
			page = "page2";
		}else if(id=="itemType3"){
			totCnt = "totalCnt3";
			curCnt = "currentCnt3";
			page = "page3";
		}else if(id=="itemType4"){
			totCnt = "totalCnt4";
			curCnt = "currentCnt4";
			page = "page4";
		}
		$("#"+form).find("[id="+totCnt+"]").text(0);
		$("#"+form).find("[id="+curCnt+"]").text(0);
		$("#"+form).find("[id="+page+"]").val(0);
	}
	
	//셀렉트박스 변경시
	$("#counselQnALinkForm [id^=itemType]").change(function(e){
		var id = $(this).attr("id");
		var grid = "";
		var data = {searchKey : $(this).val(), page : 0};
		chkSearch = "Y";
		if(id=="itemType2"){
			grid = "counselQnALinkQuesGrid";
			counselQnAGridReset2(id);
			counselQnAListAjax(baseUrl + "co/counselQnALinkList", grid, {searchKey : $(this).val(), mode : "question", page : 0});
		}else if(id=="itemType3"){
			ccmItemLinkSeq = "";//초기화
			mode = "";
			$("#counselQnALinkAnswGrid").jqGrid('resetSelection');  
			grid = "counselQnAQuesGrid";
// 			if($(this).val()==""){
// 				data = {searchKey : "Q', 'S", page : 0};
// 			}
			counselQnAGridReset2(id);
			counselQnAListAjax(baseUrl + "co/counselQnALinkSearch", grid, data);
		}else if(id=="itemType4"){
			grid = "counselQnAAnswGrid";
			counselQnAGridReset2(id);
			counselQnAListAjax(baseUrl + "co/counselQnASearch", grid, data);
		}
	});
	
	//페이징 클릭
	$("#counselQnALinkForm [id^=pageBtn]").click(function(e){
		e.preventDefault();
		var id = $(this).attr("id");
		var grid = "";
		var data = "";
		var chkPaging = "";
		if(id == "pageBtn2"){
			chkPaging = "QueLink";
			grid = "counselQnALinkQuesGrid";
			data = {searchKey : $("#counselQnALinkForm #itemType2").val(), mode : "question", page : $("#counselQnALinkForm #page2").val()};
			if(pageNavCom2("counselQnALinkForm", chkPaging)){
				counselQnAListAjax(baseUrl + "co/counselQnALinkList", grid, data);
			};
		}else if(id == "pageBtn3"){
			chkPaging = "Que";
			grid = "counselQnAQuesGrid";
			data = {searchKey : $("#counselQnALinkForm #itemType3").val(), page : $("#counselQnALinkForm #page3").val()};
			if(pageNavCom2("counselQnALinkForm", chkPaging)){
				counselQnAListAjax(baseUrl + "co/counselQnALinkSearch", grid, data);
			}
		}else{
			chkPaging = "Ans";
			grid = "counselQnAAnswGrid";
			data = {searchKey : $("#counselQnALinkForm #itemType4").val(), ccmItemSeq : qnaQuestion,page : $("#counselQnALinkForm #page4").val()};
			if(pageNavCom2("counselQnALinkForm", chkPaging)){
				counselQnAListAjax(baseUrl + "co/counselQnASearch", grid, data);
			}
			
		}
	 });
	
	//page 검사
	function pageNavCom2(form, chkPaging){
		var totCnt="";
		var curCnt="";
		if(chkPaging == "QueLink"){
			totCnt = "totalCnt2";
			curCnt = "currentCnt2";
		}else if(chkPaging == "Que"){
			totCnt = "totalCnt3";
			curCnt = "currentCnt3";
		}else if(chkPaging == "Ans"){
			totCnt = "totalCnt4";
			curCnt = "currentCnt4";
		}
		var totalCnt = $("#"+form).find("[id="+totCnt+"]").text();
		var currentCnt = $("#"+form).find("[id="+curCnt+"]").text();
		if(parseInt(totalCnt) == parseInt(currentCnt)) {
			return false;
		}
		return true;
	}
	
	//링크저장
	$("#counselQnALinkForm #counselQnALinkSave").click(function(e){
		e.preventDefault();
		
		if(gf_getSelectedGridData("#counselQnAAnswGrid")==null){
			MessageBox.dialog('<s:message code="counsel.msg.000015"/>');
			return;
		}
		if(gf_getSelectedGridData("#counselQnAQuesGrid")==null){
			MessageBox.dialog('<s:message code="counsel.msg.000016"/>');
			return;
		}
		if(gf_getSelectedGridData("#counselQnAQuesGrid").itemType=='A'){
			MessageBox.dialog('<s:message code="counsel.msg.000017"/>');
			return;
		}
		
		var counselQnALink = {
				counselQnAs			: gf_getMultiSelectedGridData("#counselQnAAnswGrid", false)
				, ccmItemSeq		: qnaQuestion
				, ccmItemLinkSeq	: ccmItemLinkSeq
				, mode				: mode
				, linkLevel			: linkLevel
		};
		
// 		alert(JSON.stringify(counselQnALink));
// 		return;
		divMask("#counselQnAMainDiv","Uploading...");
		$.ajax({
			type : "post",  
			async : false,
			contentType: "application/json",
			url : baseUrl + "co/counselQnALinkSave",
			data : JSON.stringify(counselQnALink),
			dataType : 'json',
			success : function(data) {
				if(data.messageParam.resultCode == "SUCCESS"){
					MessageBox.dialog('<s:message code="cmn.msg.saved" />');
					//링크 리로드
					
					$("#counselQnAQuesGrid").clearGridData();
					$("#counselQnALinkAnswGrid").clearGridData();
					$("#counselQnALinkQuesGrid").clearGridData();
					$("#counselQnAAnswGrid").clearGridData();
					$("#counselQnALinkForm").find("[id^=totalCnt]").text(0);
					$("#counselQnALinkForm").find("[id^=currentCnt]").text(0);
					$("#counselQnALinkForm").find("[id^=page]").val(0);

					counselQnAListAjax(baseUrl + "co/counselQnALinkList", "counselQnALinkQuesGrid", {searchKey : $("#counselQnALinkForm #itemType2").val(), mode : "question", page : 0});
// 					$("#counselQnALinkAnswGrid").clearGridData();
// 					counselQnAListAjax(baseUrl + "co/counselQnALinkSearch", "counselQnAQuesGrid", {searchKey : "Q', 'QA', 'S", page : 0});
// 					counselQnAListAjax(baseUrl + "co/counselQnASearch", "counselQnAAnswGrid", {searchKey : "A', 'QA", page : 0});
					ccmItemLinkSeq = "";
					
					//초기화
					$("#counselQnAQuesGrid").clearGridData();
					$("#counselQnALinkForm #itemType3").val("").attr("disabled",true);
				}else{
					MessageBox.dialog(data.messageParam.message);
				}
			},	error:function(data){
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
				divUnmask("#counselQnAMainDiv");
			}
		});
	});
	
	//링크 삭제
	$("#counselQnALinkForm #counselQnALinkDelete").click(function(e){
		e.preventDefault();
		var counselQnALink = null;
		if(gf_getSelectedGridData("#counselQnALinkQuesGrid")==null){
			MessageBox.dialog('<s:message code="counsel.msg.000018"/>');
			return;
		}
		if(gf_getSelectedGridData("#counselQnALinkAnswGrid")==null){
			MessageBox.dialog('<s:message code="counsel.msg.000019"/>');
			return;
		}
		counselQnALink = gf_getSelectedGridData("#counselQnALinkAnswGrid", false);
		
		counselQnALinkDelete(counselQnALink);
		
		if(gf_getAllGridData("#counselQnALinkAnswGrid").length==0){
			counselQnALink = gf_getSelectedGridData("#counselQnALinkQuesGrid", false);
			$("#counselQnALinkForm").find("[id=totalCnt2]").text(0);
			$("#counselQnALinkForm").find("[id=currentCnt2]").text(0);
			$("#counselQnALinkForm").find("[id=page2]").val(0);
			counselQnALinkDelete(counselQnALink);
			$("#counselQnALinkQuesGrid").clearGridData();
			counselQnAListAjax(baseUrl + "co/counselQnALinkList", "counselQnALinkQuesGrid", {searchKey : $("#counselQnALinkForm #itemType2").val(), mode : "question", page : 0});
		}
	});
	
	function counselQnALinkDelete(counselQnALink){
		
// 		alert(JSON.stringify(counselQnALink));
		divMask("#counselQnAMainDiv","Uploading...");
		$.ajax({
			type : "post",  
			async : false,
			contentType: "application/json",
			url : baseUrl + "co/counselQnALinkDelete",
			data : JSON.stringify(counselQnALink),
			dataType : 'json',
			success : function(data) {
				if(data.messageParam.resultCode == "SUCCESS"){
					MessageBox.dialog('<s:message code="cmn.msg.saved" />');
					var data = {searchKey : "A', 'QA", parentCcmItemLinkSeq : qnaLinkQuestion, ccmItemLinkSeq : qnaLinkQuestion, page : 0};
					clearGrid = "Y";
					chkMsg = "Y";
					$("#counselQnALinkAnswGrid").clearGridData();
					$("#counselQnAQuesGrid").clearGridData();
					$("#counselQnALinkForm").find("[id=totalCnt3]").text(0);
					$("#counselQnALinkForm").find("[id=currentCnt3]").text(0);
					$("#counselQnALinkForm").find("[id=page3]").val(0);
					counselQnAListAjax(baseUrl + "co/counselQnALinkList", "counselQnALinkAnswGrid", data);
				}else{
					MessageBox.dialog(data.messageParam.message);
				}
			},	error:function(data){
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
				divUnmask("#counselQnAMainDiv");
			}
		});
		
	};
	
	//닫기
	$("#counselQnALinkForm #counselQnALinkClose").click(function(e){
		e.preventDefault();
		Dialog.close('#${param.dialogName}');
	});
	
	//1레벨 질문 초기화
	$("#counselQnALinkForm #counselQnALinkInitLev").click(function(e){
		e.preventDefault();
		
		$("#counselQnALinkForm #itemType3").val("").attr("disabled",false);
		
		$("#counselQnALinkQuesGrid").jqGrid('resetSelection');
		ccmItemLinkSeq = "";//초기화
		mode = "";
		$("#counselQnALinkAnswGrid").jqGrid('resetSelection'); 
		chkSearch = "Y";
		counselQnAListAjax(baseUrl + "co/counselQnALinkSearch", "counselQnAQuesGrid", {searchKey : "Q', 'S", page : 0});
	});
});

//탭 선택 이벤트제어
$("#counselQnA_div").bind("tabsselect", function(e, tab) {
	if(tab.index == 0) {
	}
	else if(tab.index == 1) {
		
		$("#counselQnAQuesGrid").clearGridData();
		$("#counselQnALinkAnswGrid").clearGridData();
		$("#counselQnALinkQuesGrid").clearGridData();
		$("#counselQnAAnswGrid").clearGridData();
		$("#counselQnALinkForm").find("[id^=totalCnt]").text(0);
		$("#counselQnALinkForm").find("[id^=currentCnt]").text(0);
		$("#counselQnALinkForm").find("[id^=page]").val(0);
		
		//Question List 불러오기
		chkMsg = "Y";
		counselQnAListAjax(baseUrl + "co/counselQnALinkSearch", "counselQnAQuesGrid", {searchKey : "Q', 'S", page : 0});
		//Question Link List 불러오기
		chkMsg = "Y";
		counselQnAListAjax(baseUrl + "co/counselQnALinkList", "counselQnALinkQuesGrid", {searchKey : "Q', 'QA', 'S", mode : "question", page : 0});
	}
});
</script>
<div di = "counselQnAMainDiv">
<div class="contents_box" id="counselQnA_div" style="width: 100%;">
	<!-- 탭버튼 -->
	<ul class="tab_box">
		<li class="on"><span><a href="#counselQnAItem">QnA</a></span></li>
	    <li class="off"><span><a href="#counselQnAItemLink">QnA Link</a></span></li>
	</ul>
	<div class="tab_contents01" id="counselQnAItem">
		<form id="counselQnAForm">
			<div class="search_box_01">
				<div class="f_left">
					<p>
						<s:message code="ar.ar1.label.000001"/>
						<select id="searchKey" name="searchKey" class="form_select01" >
							<option value=""><s:message code="code.msg.choose"/></option>
							<code:out codeType="CounselItemType" option="listbox"/>
						</select>
					   	<input type="text" class="form_normal01" style="width:200px;" id="searchValue" name="searchValue"/>
				   	</p>
				</div>
				<div class="f_right">
					<img src="<s:url value="/resources/images/common/line_01.gif"/>" />
					<span class="btns7 save"><input type="button" value='<s:message code="cmn.btn.search"/>'  id="counselQnASearch"/></span>
				</div>
			</div>
			<div class="title">
				<h1><s:message code="counsel.label.000015"/></h1>
				<ul class="btn_listtop f_right">
					<li class="page"><span class="text" id="currentCnt"><s:message code="co.label.zero"/></span> <s:message code="co.label.slash"/> <span class="text" id="totalCnt"><s:message code="co.label.zero"/></span></li>
					<li><a href="#" id="pageBtn"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
				</ul>
				<input type="hidden" id="page" name="page" value="1">
				<input type="hidden" name="currentCnt" >
				<input type="hidden" name="totCount" value="">
			</div>
			<div>
				<table id="counselQnAGrid1"></table>
			</div>
			
			<div>
				<div class="title">
					<h1><s:message code="counsel.label.000010"/></h1>
					<span class="btns3 save f_right"><input type="button" value="new QnA" id="counselQnANewQnA"/></span>
				</div>
				<table class="table_view01" border="1" style="width: 100%;">
					<colgroup>
						<col width="15%">
						<col width="">
					</colgroup>	
					<tr>
						<th><s:message code="ar.ar1.label.000001"/></th>
						<td>
							<select id="itemType" class="form_select01" >
								<option value=""><s:message code="ar.agingReport.000010"/></option>
								<code:out codeType="CounselItemType" option="listbox" />
							</select>
						</td>
					</tr>
					<tr>
						<th><s:message code="counsel.label.000022"/></th>
						<td>
							<textarea id="itemNm" rows="3" cols="60" style="width: 100%;"></textarea>
						</td>
					</tr>
					<tr>
						<th><s:message code="or.user000.label.040"/></th>
						<td>
							<textarea id="description" rows="3" cols="60" style="width: 100%;"></textarea>
						</td>
					</tr>
				</table>
				<br/>
				<div class="f_right">
					<span class="btns7 save"><input id="counselQnASave" 	type="button" value= '<s:message code="cmn.btn.save"/>'  /></span>
					<span class="btns7 save"><input id="counselQnADelete" 	type="button" value= '<s:message code="cmn.btn.delete"/>'  /></span>
					<span class="btns7 save"><input id="counselQnAClose" 	type="button" value= '<s:message code="cmn.btn.close"/>'  /></span>
				</div>
			</div>	
		</form>
	</div>
	
	<div class="tab_contents01" id="counselQnAItemLink">
		<form id="counselQnALinkForm">
			<div>
				<table style="width: 100%;">
					<tr>
						<td>
							<div class="title">
								<h1><s:message code="counsel.label.000011"/></h1>
								<select id="itemType2" class="form_select01" >
									<option value="Q', 'QA', 'S"><s:message code="ar.ar1.label.000017"/></option>
									<code:out codeType="CounselItemType" option="listbox" exclude="A" />
								</select>
								<ul class="btn_listtop f_right" style="padding-right: 18px;">
									<li class="page"><span class="text" id="currentCnt2"><s:message code="co.label.zero"/></span> <s:message code="co.label.slash"/> <span class="text" id="totalCnt2"><s:message code="co.label.zero"/></span></li>
									<li><a href="#" id="pageBtn2"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
								</ul>
								<input type="hidden" id="page2" name="page2" value="1">
								<input type="hidden" name="currentCnt2" >
								<input type="hidden" name="totCount2" value="">
							</div>
							<table id="counselQnALinkQuesGrid"></table>
						</td>
						<td class="f_right">
							<div class="title">
								<h1><s:message code="counsel.label.000012"/></h1>
							</div>
							<table id="counselQnALinkAnswGrid"></table>
						</td>	
					</tr>	
				</table>
				<br/>
				<div class="f_right">
					<span class="btns7 save"><input id="counselQnALinkDelete" type="button" value= '<s:message code="cmn.btn.delete"/>'  /></span>
				</div>
				<table style="width: 100%;">
					<tr>
						<td>
							<div class="title">
								<h1><s:message code="counsel.label.000013"/></h1>
								<select id="itemType3" class="form_select01" style="width:90px;">
									<option value="Q', 'S"><s:message code="ar.ar1.label.000017"/></option>
									<code:out codeType="CounselItemType" option="listbox" exclude="A,QA" />
								</select>
								<ul class="btn_listtop f_right" style="padding-right: 20px;">
									<li class="page"><span class="text" id="currentCnt3"><s:message code="co.label.zero"/></span> <s:message code="co.label.slash"/> <span class="text" id="totalCnt3"><s:message code="co.label.zero"/></span></li>
									<li><a href="#" id="pageBtn3"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
								</ul>
								<input type="hidden" id="page3" name="page3" value="1">
								<input type="hidden" name="currentCnt3" >
								<input type="hidden" name="totCount3" value="">
								<span class="btns3 save f_right" style="left:-5px;"><input id="counselQnALinkInitLev" type="button" value="1Level" /></span>			
							</div>
							<table id="counselQnAQuesGrid"></table>
						</td>
						<td class="f_right">
							<div class="title">
								<h1><s:message code="counsel.label.000014"/></h1>
								<select id="itemType4" class="form_select01" >
									<option value="A','QA"><s:message code="ar.ar1.label.000017"/></option>
									<code:out codeType="CounselItemType" option="listbox" exclude="Q,S" />
								</select>
								<ul class="btn_listtop f_right">
									<li class="page"><span class="text" id="currentCnt4"><s:message code="co.label.zero"/></span> <s:message code="co.label.slash"/> <span class="text" id="totalCnt4"><s:message code="co.label.zero"/></span></li>
									<li><a href="#" id="pageBtn4"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
								</ul>
								<input type="hidden" id="page4" name="page4" value="1">
								<input type="hidden" name="currentCnt4" >
								<input type="hidden" name="totCount4" value="">
							</div>
							<table id="counselQnAAnswGrid"></table>
						</td>	
					</tr>
				</table>
				<br/>
				<div class="f_right">
					<span class="btns7 save"><input id="counselQnALinkSave" 	type="button" value= '<s:message code="cmn.btn.save"/>'  /></span>
					<span class="btns7 save"><input id="counselQnALinkClose" 	type="button" value= '<s:message code="cmn.btn.close"/>'  /></span>
				</div>	
			</div>
		</form>
	</div>
</div>
</div>