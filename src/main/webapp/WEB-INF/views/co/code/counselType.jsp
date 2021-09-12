<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryTreeView/jquery.treeview.js"/>"></script>
<link type="text/css"  rel="stylesheet" href="<s:url value="/resources/styles/jquery.treeview.css" />" />
<script type="text/javascript">
var applyLevel = "1";
var activitySeqno = "";
var oriEventCd = "";
var oriLastLev = "";
var parentActivityCode = "";
var clickNewBtn = "";
var chkSubTree2 = "";
var copyParentActivityCode = "";
var copyLevelGrid = ""; //마지막레벨일경우 체크박스 해제 후 다시 선택할시 원래 데이터 복구
var copyGroupGrid = "";
var copyComm = ""; //마지막레벨일경우 체크박스 해제 후 다시 선택할시 원래 데이터 복구
var groupLev = "";

var openChk = '${param.dialogName}';

var treeClickNavigation = function(){
	seqno = this.id ;
	var selectedTree = $(this);
//	alert(activitySeqno);
	clickTree(seqno, selectedTree);
};

function clickTree(seqno, selectedTree){
	$(this).loadingDialog();
	divMask("#counselTypeMainDiv","Uploading...");
	$.ajax({
		type : "GET",
		async : false,
		url : baseUrl+ "co/selectCounselType?activitySeqno="+seqno,
		dataType : 'json',
		success : function(data) {
// 			alert(data.counsel.activityCode);
			$("#counselTypeForm [name=activityCode]").val(data.counsel.activityCode);
			$("#counselTypeForm [name=activityDesc]").val(data.counsel.activityDesc);
			$("#counselTypeForm [name=activityDescK]").val(data.counsel.activityDescK);
			//마지막레벨일 경우
			if(data.counsel.lastYn == "Y"){
				$("#counselTypeForm [name=lastLevChk]").attr("checked", true);
				$("#counselTypeForm [name=activityEventCd]").attr("disabled", true);
// 				$("#counselTypeForm #CounselAddBtn").attr("disabled", false).parent().removeClass().addClass("btns3 save");
// 				$("#counselTypeForm #CounselDeleteBtn").attr("disabled", false).parent().removeClass().addClass("btns3 save");
				
				//그리드 클리어
				clearGrid();
				
				//레벨
				gf_clearGridList("#counselLevelGrid1");
				gf_addMultiGridList("#counselLevelGrid1", data.level);
				//그룹
				gf_clearGridList("#levelGroupGrid2");
				gf_addMultiGridList("#levelGroupGrid2", data.group);
// 				alert(JSON.stringify(data.level));
// 				alert(JSON.stringify(data.group));
				
				copyLevelGrid = gf_getAllGridData("#counselLevelGrid1");
				copyGroupGrid = gf_getAllGridData("#levelGroupGrid2");
				
				//수정하기 전 이벤트코드
				oriEventCd = data.counsel.activityEventCd;
				oriLastLev = "Y";
				
// 				alert("마지막레벨 : "+selectedTree.next().length);
				if(selectedTree.next().length != 0){
					chkSubTree2 = "Y";
				}else{
					chkSubTree2 = "";
				}
				
// 				//레벨 리스트
// 				counselTypeLevelListAjax();
			}else{
				resetAttrBtn();
				//하위 트리가 있으면
// 				alert("마지막이 아닐경우 : "+selectedTree.next().length);
				if(selectedTree.next().length != 0){
					chkSubTree2 = "Y";
				}else{
					chkSubTree2 = "";
				}
				
				oriEventCd = "";
				oriLastLev = "";
				
				//그리드 클리어
				clearGrid();
			}
			// 이벤트코드가 있는경우
// 			alert("이벤트코드 : "+data.counsel.activityEventCd);
			if(data.counsel.activityEventCd != null){
				$("#counselTypeForm [name=activityEventCd]").val(data.counsel.activityEventCd);
				$("#counselTypeForm [name=command]").removeClass().addClass("form_normal01").attr("readonly", false);
				$("#counselTypeForm [name=command]").val(data.command == null ? "" : data.command.command);	
				copyComm = $("#counselTypeForm #[name=command]").val();
			}else{
				$("#counselTypeForm [name=activityEventCd]").val("");
				$("#counselTypeForm [name=command]").removeClass().addClass("form_readonly").attr("readonly", true);
				$("#counselTypeForm [name=command]").val("");
			}
			
			applyLevel = data.counsel.applyLevel;
			parentActivityCode = data.counsel.activityCode;
			clickNewBtn = "";
			activitySeqno = data.counsel.activitySeqno;
//			alert(activitySeqno);
//			alert(JSON.stringify(data.counsel));
//			alert(JSON.stringify(data.command));
//			alert(JSON.stringify(data.user));
			chkDialog();
		},error : function(data) {
			MessageBox.dialog("err.500");
		},complete : function(jqXHR, textStatus) {
			$(this).hideLoading();
			divUnmask("#counselTypeMainDiv");
		}
	});	
}

//그리드 클리어
function clearGrid(){
	gf_clearGridList("#counselLevelGrid1");
	gf_clearGridList("#levelGroupGrid1");
	gf_clearGridList("#levelGroupGrid2");
	gf_clearGridList("#groupUserGrid");
}

//버튼및속성초기화
function resetAttrBtn(){
	$("#counselTypeForm [name=lastLevChk]").attr("checked", false);
	$("#counselTypeForm [name=activityEventCd]").attr("disabled", true);
// 	$("#counselTypeForm #CounselAddBtn").attr("disabled", true).parent().removeClass().addClass("btns3_1 save");
// 	$("#counselTypeForm #CounselDeleteBtn").attr("disabled", true).parent().removeClass().addClass("btns3_1 save");
// 	gf_clearGridList("#counselTypeGrid");
}

$(function(e){	
	
	getCounselTree();
	initCounselTypeGrid();
// 	counselTypeLevelListAjax();//레벨리스트
	//트리 보여주기
	$("#counselTypeForm #counselTypeNavigation").treeview({
		persist: "location",
		collapsed: false,
		unique: true
	});
	
	
	chkDialog();
	
	function initCounselTypeGrid(){
// 		$("#counselTypeGrid").jqGrid({
// 					datatype : "local",
// 					height :155,
// 					width : 530,
// 					colNames : [ '<s:message code="or.user000.label.000" />', // 유저아이디
// 					             '<s:message code="or.user000.label.002" />', // 사용지명
// 					             '<s:message code="or.user000.label.003" />', // 조직
// 					             'Dealer Name',
// 					             '<s:message code="or.user000.label.004" />', // 유효시작일자
// 					             '<s:message code="or.user000.label.016" />', // 사용자레벨
// 					             '<s:message code="or.user000.label.017" />', // IP ADDRESS
// 					             '<s:message code="or.user000.label.018" />'  // IP SCAN YN
// 								], 
// 					colModel : [ { name : 'userId',   			index : 'userId',               width : "110",  sorttype : "string"}, 
// 					             { name : 'userName', 			index : 'userName', 			width : "130", 	sorttype : "string"},
// 					             { name : 'dlrCd',    			index : 'dlrCd',    			width : "110", 	sorttype : "string", 	align : "center" },
// 					             { name : 'dlrNm',    			index : 'dlrNm',    			width : "115", 	sorttype : "string" },
// 					             { name : 'effectiveDate8',    	index : 'effectiveDate8',   	width : "100", 	sorttype : "string", 	align : "center", formatter : barPlus, hidden:true },
// 					             { name : 'userLevel',    		index : 'userLevel',    		width : "80", 	sorttype : "string", 	align : "center", hidden:true},
// 					             { name : 'ipAddress',    		index : 'ipAddress',    		width : "120", 	sorttype : "string", 	align : "center", hidden:true },
// 					             { name : 'ipScanYn',    		index : 'ipScanYn',    		    width : "80", 	sorttype : "string", 	align : "center", hidden:true }
// 					           ],
				    
// 					multiselect : true,
// 			   	   	viewrecords: true,
// 			   	   	shrinkToFit: false,
// 	//		   	   	caption: '<s:message code="or.user000.main.title.002" />', 
// 			        onSelectRow: function (id) {
// 		        	}
// 		});
		
		//Level1 Grid
		$("#counselLevelGrid1").jqGrid({
				datatype : "local",
				height :130,
				width : 100,
				colNames : [ 
				             '<s:message code="code.label.000064"/>',//'LevelSeq',
				             '<s:message code="code.label.000065"/>',//'Level',
				             '<s:message code="code.label.000066"/>',//'Time'
							], 
				colModel : [ 
				             { name : 'levelSeq',   			index : 'levelSeq',            width : "110",  sorttype : "string", hidden:true}, 
				             { name : 'groupLevel', 			index : 'groupLevel', 			width : "40", 	sorttype : "string"},
				             { name : 'counselTime', 			index : 'counselTime', 			width : "30", 	sorttype : "string", editable:true, formatter:'integer'}
				           ],
			    
				multiselect : false,
		   	   	viewrecords: true,
		   	   	shrinkToFit: false,
		        onSelectRow: function (id) {
		        	if(openChk!="searchTypeDialog"){
			        	var rowData = $('#counselLevelGrid1').getRowData(id);
						$("#counselLevelGrid1").jqGrid('editRow', id);
						counselTypeGetGroupListAjax(rowData.groupLevel);
						groupLev = rowData.groupLevel;
					}
	        	}
		});
		
		//Level1 Grid
// 		$("#counselLevelGrid2").jqGrid({
// 				datatype : "local",
// 				height :130,
// 				width : 100,
// 				colNames : [ 
// 				             'Level Value',
// 				             'Level',
// 				             'Time'
// 							], 
// 				colModel : [ 
// 				             { name : 'searchKey',   			index : 'searchKey',            width : "110",  sorttype : "string", hidden:true}, 
// 				             { name : 'searchValue', 			index : 'searchValue', 			width : "50", 	sorttype : "string"},
// 				             { name : 'counselTime', 			index : 'counselTime', 			width : "50", 	sorttype : "string"}   
// 							],
			    
// 				multiselect : true,
// 		   	   	viewrecords: true,
// 		   	   	shrinkToFit: false,
// 		        onSelectRow: function (id) {
// 		        	var rowData = $('#counselLevelGrid2').getRowData(id);
// 		        	counselTypeGetGroupListAjax(rowData.searchValue);
// 	        	}
// 		});
		
		//LevelGroup1 Grid
		$("#levelGroupGrid1").jqGrid({
				datatype : "local",
				height :130,
				width : 150,
				colNames : [ 
				             '<s:message code="code.label.000067"/>',	//'GROUP_SEQ',
				             '<s:message code="code.label.000068"/>',	// 'Name',
				             '<s:message code="code.label.000065"/>',	//'Level'
							], 
				colModel : [ { name : 'groupSeq',   		index : 'groupSeq',         	width : "110",  sorttype : "string", hidden:true}, 
				             { name : 'groupName', 			index : 'groupName', 			width : "100", 	sorttype : "string"},
				             { name : 'groupLevel', 		index : 'groupLevel', 			width : "130", 	sorttype : "string", hidden:true}
				           ],
			    
				multiselect : true,
		   	   	viewrecords: true,
		   	   	shrinkToFit: false,
		        onSelectRow: function (id) {
		        	var rowData = $('#levelGroupGrid1').getRowData(id);
		        	counselTypeGetUserListAjax(rowData.groupSeq);
	        	}
		});
		
		//LevelGroup2 Grid
		$("#levelGroupGrid2").jqGrid({
			datatype : "local",
			height :130,
			width : 185,
			colNames : [ 
			              	 '<s:message code="code.label.000067"/>',	//GROUP_SEQ
				             '<s:message code="code.label.000068"/>',	//Name
				             '<s:message code="code.label.000065"/>',	//Level
						], 
			colModel : [ { name : 'groupSeq',   		index : 'groupSeq',         	width : "110",  sorttype : "string", hidden:true}, 
			             { name : 'groupName', 			index : 'groupName', 			width : "90", 	sorttype : "string"},
			             { name : 'groupLevel', 		index : 'groupLevel', 			width : "40", 	sorttype : "string"}
			           ],
		    
			multiselect : true,
	   	   	viewrecords: true,
	   	   	shrinkToFit: false,
	        onSelectRow: function (id) {
	        	var rowData = $('#levelGroupGrid2').getRowData(id);
	        	counselTypeGetUserListAjax(rowData.groupSeq);
	       	}
		});
		
		//levelUser Grid
		$("#groupUserGrid").jqGrid({
			datatype : "local",
			height :100,
			width : 515,
			colNames : [ 
			             '<s:message code="code.label.000067"/>',			//groupSeq
			             '<s:message code="co.security.label.000003"/>',	//User Id
			             '<s:message code="code.label.000069"/>',			//User Name
			             '<s:message code="code.label.000065"/>'			//Level
						], 
			colModel : [ { name : 'groupSeq',   		index : 'groupSeq',        	width : "110",  sorttype : "string", hidden:true},
			             { name : 'userId',   			index : 'userId',         	width : "150",  sorttype : "string"}, 
			             { name : 'userName', 			index : 'userName', 		width : "230", 	sorttype : "string"},
			             { name : 'groupLevel', 		index : 'groupLevel', 		width : "100", 	sorttype : "string"}
			           ],
		    
			multiselect : false,
	   	   	viewrecords: true,
	   	   	shrinkToFit: false
		});
	}
	
	//마지막여부 체크
	$("#counselTypeForm [name=lastLevChk]").click(function(){
		if(chkSubTree2 == "Y"){
			MessageBox.dialog('<s:message code="code.msg.000014"/>');
			return;	
		}

		if($(this).is(':checked')){
			if(oriLastLev == "Y"){//마지막 레벨일경울
				$("#counselTypeForm [name=activityEventCd]").val(oriEventCd);
				$("#counselTypeForm [name=activityEventCd]").attr("disabled", true);
				
				gf_addMultiGridList("#counselLevelGrid1", copyLevelGrid);
				gf_addMultiGridList("#levelGroupGrid2", copyGroupGrid);
				$("#counselTypeForm #[name=command]").val(copyComm).removeClass().addClass("form_normal").attr("readonly", false); 
// 				$("#counselTypeForm #[name=command]").val("").removeClass().addClass("form_readonly").attr("readonly", true);
			}else{// 마지막 레벨이 아닐경우
				$("#counselTypeForm [name=activityEventCd]").attr("disabled", false);
			} 
// 			$("#counselTypeForm #CounselAddBtn").attr("disabled", false).parent().removeClass().addClass("btns3 save");
// 			$("#counselTypeForm #CounselDeleteBtn").attr("disabled", false).parent().removeClass().addClass("btns3 save");
			counselTypeLevelListAjax();//레벨리스트
		}else{
			if(oriLastLev == "Y"){//마지막 레벨일경울
				$("#counselTypeForm [name=activityEventCd]").val("");
				$("#counselTypeForm [name=activityEventCd]").attr("disabled", true);
				
				gf_clearGridList("#counselLevelGrid1");
				gf_clearGridList("#levelGroupGrid2");
				$("#counselTypeForm #[name=command]").val("").removeClass().addClass("form_readonly").attr("readonly", true);
			}else{// 마지막 레벨이 아닐경우
				$("#counselTypeForm [name=activityEventCd]").attr("disabled", true);
			}
// 			$("#counselTypeForm #CounselAddBtn").attr("disabled", true).parent().removeClass().addClass("btns3_1 save");
// 			$("#counselTypeForm #CounselDeleteBtn").attr("disabled", true).parent().removeClass().addClass("btns3_1 save");
			clearGrid();//그리드 클리어
		}
	});
	
	
	//함수명 체크
	$("#counselTypeForm [name=activityEventCd]").click(function(e){
		if($(this).val()!=""){
			$("#counselTypeForm #[name=command]").removeClass().addClass("form_normal01").attr("readonly", false);
		}else{
			$("#counselTypeForm #[name=command]").removeClass().addClass("form_readonly").attr("readonly", true);
		}
	});
	
	//Reset 버튼
	$("#counselTypeForm #CounselResetBtn").click(function(e){
		e.preventDefault();

		Dialog.open({
			div : '#counselTypeDialog', 
			url : baseUrl+"co/counselType?dialogName=counselTypeDialog",
			title : '<s:message code="code.label.000070"/>',//'counsel Type', 
			width :800, 
			height : 600, 
			modal : true
		});
	});
	
	//New 버튼
	$("#counselTypeForm #CounselNewBtn").click(function(e){
		e.preventDefault();
		
		$("#counselTypeForm [name=activityCode]").val("");
		$("#counselTypeForm [name=activityDesc]").val("");
		$("#counselTypeForm [name=activityDescK]").val("");
		$("#counselTypeForm [name=activityEventCd]").val("");
		$("#counselTypeForm [name=command]").val("");
		resetAttrBtn();
		
// 		alert(clickNewBtn);
		if(clickNewBtn != "Y"){
			applyLevel = (applyLevel*1)+1;
		}
		getActivityCode(applyLevel);
		activitySeqno="";
		oriEventCd = "";
		oriLastLev = "";
		chkSubTree2 = "";
		clickNewBtn = "Y";
		
// 		if(chkResetBtn=="Y"){
// 			parentActivityCode = copyParentActivityCode;
// 		}
	});
	
// 	//Add 버튼
// 	$("#counselTypeForm #CounselAddBtn").click(function(e){
// 		e.preventDefault();
// 		var strParam = "dialogName=orUserContentsDialog&callBack=callBackCouselTypeGetUsers";	
// 		gf_openDialog("#orUserContentsDialog", "/ccs/csCccs012", strParam,'<s:message code="or.user000.main.title.001" />', 820, 640, true);
// 	});
	
// 	//Delete 버튼
// 	$("#counselTypeForm #CounselDeleteBtn").click(function(e){
// 		e.preventDefault();
// 		if(gf_getMultiSelectedGridData("#counselTypeGrid").length>0){
// 			gf_deleteSelectedGridRow("#counselTypeGrid");
// 		}else{
// 			MessageBox.dialog("Selcet Counsel Responsibility!");			
// 		}
// 	});

	//그룹추가
	$("#counselTypeForm #groupAdd").click(function(e){
		e.preventDefault();
		
		if(!duplicateCheck3(gf_getMultiSelectedGridData("#levelGroupGrid1"), gf_getAllGridData("#levelGroupGrid2"), 'groupSeq', 'groupLevel')){
			gf_addMultiGridList("#levelGroupGrid2", gf_getMultiSelectedGridData("#levelGroupGrid1"));
// 			gf_deleteSelectedGridRow("#levelGroupGrid1");
		};
	});
	
	//그룹삭제
	$("#counselTypeForm #groupDel").click(function(e){
		e.preventDefault();
		if(!duplicateCheck(gf_getMultiSelectedGridData("#levelGroupGrid2"), gf_getAllGridData("#levelGroupGrid1"), 'groupSeq','delete')){
// 			gf_addMultiGridList("#levelGroupGrid1", gf_getMultiSelectedGridData("#levelGroupGrid2"));
			gf_deleteSelectedGridRow("#levelGroupGrid2");
		};
	});
	
	$("#counselTypeForm #CounselConfirmBtn").click(function(e){
		e.preventDefault();
		if ($("#counselTypeForm [name=lastLevChk]").is(":checked") == false){
			MessageBox.dialog('<s:message code="code.msg.000015"/>');
			return;
		}
		
		if ($("#subscriptionCustomerSearchForm #svcCd").val()=='2'){
			if ( $("#counselTypeForm [name=activityEventCd]").val() =='AS'){
				MessageBox.dialog('<s:message code="code.msg.000016"/>');
				return;
			}
		}
		if ($("#subscriptionCustomerSearchForm #svcCd").val()!='2'){
			if ( $("#counselTypeForm [name=activityEventCd]").val() =='C07'){
				MessageBox.dialog('<s:message code="code.msg.000017"/>');
				return;
			}
		}
		var jsonData = {
				
				activitySeqNo	: activitySeqno
			   ,actMode			: $("#counselTypeForm [name=activityEventCd]").val()
			   ,activityDesc     : $("#counselTypeForm [name=activityDesc]").val()
								
		};
		if(eval("window.${param.callBack}") != null){
			var funcName = eval("${param.callBack}");
			funcName(jsonData);
		}
		Dialog.close('${param.dialogName}'); 
	});
	
	//Save 버튼
	$("#counselTypeForm #CounselSaveBtn").click(function(e){
		e.preventDefault();
		var organizationGroups = [];
		var gridData = gf_getAllGridData("#levelGroupGrid2");
		for(var i=0; i<gridData.length;i++){
			organizationGroups.push({groupSeq : gridData[i].groupSeq});
		}
		
		var counselTypes = gf_getAllGridData("#counselLevelGrid1");
		var pattern = /[^0123456789]/g;
		var counselTime = "";
		
		for(var i=0; i < counselTypes.length; i++){
			$("#counselLevelGrid1").jqGrid('saveRow', counselTypes[i].keyId, false, 'clientArray');
		}
		var counselTypes2 = gf_getAllGridData("#counselLevelGrid1");
		var savedLevelGrid1 = [];
		for(var i=0; i < counselTypes2.length; i++){
			savedLevelGrid1.push({
						levelSeq 		: counselTypes2[i].levelSeq
						, counselTime 	: counselTypes2[i].counselTime
						, groupLevel  	: counselTypes2[i].groupLevel
						});
			counselTime = Number(counselTypes2[i].counselTime);
			if(counselTime>99999 || isNaN(counselTime)==true || pattern.test(counselTime)){
				MessageBox.dialog('<s:message code="code.msg.000018"/>');
				return;
			}
		}
		
// 		alert(JSON.stringify(savedLevelGrid1));
		var counselType = {
							activitySeqno			: activitySeqno
							, activityCode			: $("#counselTypeForm [name=activityCode]").val()
							, parentActivityCode	: parentActivityCode
							, activityDesc			: $("#counselTypeForm [name=activityDesc]").val()
							, activityDescK			: $("#counselTypeForm [name=activityDescK]").val()
							, activityEventCd		: $("#counselTypeForm [name=activityEventCd]").val()
							, command				: $("#counselTypeForm [name=command]").val()
							, lastYn				: $("#counselTypeForm [name=lastLevChk]").is(":checked") ? "Y" : "N"
							, applyLevel			: applyLevel
							, organizationGroups	: organizationGroups
							, counselTypes			: savedLevelGrid1
							, chkSubTree2			: chkSubTree2
		};
// 		alert(JSON.stringify(counselType));
// 		$("#counselTypeForm #CounselSaveBtn").loadingDialog();
		divMask("#counselTypeDiv","Uploading...");
		var url = baseUrl + "co/counselTypeAddCon";
		
		$.ajax({
			type : "post",  
			async : true,
			contentType: "application/json",
			url : url,
			data : JSON.stringify(counselType),
			dataType : 'json',
			success : function(data) {
				if(data.messageParam.resultCode == "SUCCESS"){
// 					alert("시퀀스 : "+data.messageParam.message);
					MessageBox.dialog('<s:message code="cmn.msg.saved" />');
					$("#counselTypeForm #counselTypeNavigation").empty();
					getCounselTree();
					$("#counselTypeForm #counselTypeNavigation").treeview({
						persist: "location",
						collapsed: true,
						unique: true
					});
					clickTree(data.messageParam.message, $("#counselTypeForm #counselTypeNavigation #"+data.messageParam.message));
				}else{
					MessageBox.dialog(data.messageParam.message);
				}
			},	error:function(data){
				//서버 비정상 동작시 구현
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
// 				$("#counselTypeForm #CounselSaveBtn").hideLoading();
				divUnmask("#counselTypeDiv");
			}
		});
	});
	
	//트리링크 클릭시
	/* $("#counselTypeForm #counselTypeNavigation a").click(function(e){
		e.preventDefault();
		treeClickNavigation();		
	});
	 */
	
	
	// 닫기버튼
	$("#counselTypeForm #CounselCloseBtn").click(function(e){
		e.preventDefault();
		Dialog.close('${param.dialogName}');
	});
	
	function getCounselTree(){
		//$(this).loadingDialog();
		divMask("#counselTypeMainDiv","Uploading...");
		$.ajax({
			type : "GET",  
			async : false,
			url : baseUrl + "co/getCounselTypeTree",
			dataType : 'json',
			success : function(data){
				var tree = [];
				var lev = "";
				var levList = "";
				
				for(var i=0; i<data.tree.length; i++){
					var str = {
						activitySeqno			: data.tree[i].activitySeqno
						, activityDesc			: data.tree[i].activityDesc
						, applyLevel			: data.tree[i].applyLevel
						, activityCode			: data.tree[i].activityCode
						, parentActivityCode	: data.tree[i].parentActivityCode
					}
					tree.push(str);
				}
				
//	 		 	alert(JSON.stringify(tree));

				for(var i=0; i<tree.length; i++){
					//1레벨
					if(tree[i].parentActivityCode==null){
						lev = '<li id="' + tree[i].activityCode + '_' + tree[i].applyLevel + '"><a href="#" id="' + tree[i].activitySeqno + '">' +  tree[i].applyLevel +'. ' + tree[i].activityDesc + '</a></li>';
		 				$("#counselTypeForm #counselTypeNavigation").append(lev);
					}else{
						chkSubTree = subTreeYn(tree, i);
//	 					alert(chkSubTree);
						if(chkSubTree='Y'){//하위가 있으면
							levList = '<ul><li id="' + tree[i].activityCode + '_' + tree[i].applyLevel + '"><a href="#" id="' + tree[i].activitySeqno + '">' +  tree[i].applyLevel +'. ' + tree[i].activityDesc + '</a></li></ul>';
							//붙일곳 찾기
							addTree(tree, i, levList);
						}else{//하위가 없으면
							levList = '<li><a href="#" id="' + tree[i].activitySeqno + '">' +  tree[i].applyLevel +'. ' + tree[i].activityDesc + '</a></li>';
							addTree(tree, i, levList); 						
						}
					}
//	 				if(i==40){
//	 					return;
//	 				}
					
				}
				
				function subTreeYn(tree, i){
					var chkSubTree = "";
					for(var j=0; j<tree.length; j++){
//	 					alert("code : "+tree[i].activityCode+ ", parent : "+tree[j].parentActivityCode);
						//하위가 있으면 
						if(tree[i].activityCode == tree[j].parentActivityCode){
							chkSubTree =  'Y';
							return chkSubTree;
						}else{//하위가 없으면
							chkSubTree = 'N';
						}
					}
					return chkSubTree;
				}
				
				function addTree(tree, i, levList){
					for(var x=0; x<tree.length; x++){
						if(tree[i].parentActivityCode == tree[x].activityCode){
							$("#counselTypeForm #"+ tree[x].activityCode + "_" +tree[x].applyLevel).append(levList);
							return;
						}
					}
				}
				
				if(openChk!="searchTypeDialog"){
					//상담코드
					$("#counselTypeForm #[name=activityCode]").val(data.actiCd);
				}
			},
			error:function(data){
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
				$("#counselTypeForm #counselTypeNavigation").find("a").bind('click', treeClickNavigation);
				divUnmask("#counselTypeMainDiv");
			}
		});	
	}

	function getActivityCode(applyLevel){
// 		alert(applyLevel);
		$(this).loadingDialog();
		divMask("#counselTypeMainDiv","Uploading...");
		$.ajax({
			type : "GET",
			async : false,
			url : baseUrl+ "co/getActivityCode?applyLevel="+applyLevel,
			dataType : 'json',
			success : function(data) {
// 				alert(JSON.stringify(data.actiCd));
				$("#counselTypeForm [name=activityCode]").val(data.actiCd);
			},	error:function(data){
				//서버 비정상 동작시 구현
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
				$(this).hideLoading();
				divUnmask("#counselTypeMainDiv");
			}
		});
	}

});

//다이얼로그 체크
function chkDialog(){
	if(openChk=="searchTypeDialog"){
		//버튼 숨김
		$("#counselTypeForm #CounselResetBtn").hide();
		$("#counselTypeForm #CounselNewBtn").hide();
		$("#counselTypeForm #groupAdd").hide();
		$("#counselTypeForm #groupDel").hide();
// 		$("#counselTypeForm #CounselAddBtn").hide();
// 		$("#counselTypeForm #CounselDeleteBtn").hide();
		//텍스트박스 비활성화
		$("#counselTypeForm input[type=text]").attr("readonly",true).removeClass().addClass("form_readonly");
		$("#counselTypeForm input[type=checkbox]").attr("disabled",true);
		$("#counselTypeForm select").attr("disabled",true).removeClass().addClass("form_select02");
	}
}

// function callBackCouselTypeGetUsers(jsonData){
// 	if(jsonData.length>0){
// 		if(!duplicateCheck(jsonData, gf_getAllGridData("#counselTypeGrid"), 'userId')){
// 			gf_addMultiGridList("#counselTypeGrid", jsonData);
// 		}
// 	} 
// }

function duplicateCheck(trgtJson, compareJson, keyName, type){
	var dup = false ;
	for(var i=0; i<trgtJson.length; i++){
		dup = false ;
		for(var k=0; k<compareJson.length; k++){
			if(trgtJson[i][keyName] == compareJson[k][keyName]){
				if(type != "delete"){
					MessageBox.dialog('<s:message code="cs.msg.policy.0009" />');
				}else{
					gf_deleteSelectedGridRow("#levelGroupGrid2");
					$("#groupUserGrid").clearGridData();
				}
				dup = true ;	
			}
		}
		if(dup == true){
			break;
		}
	}
	
	return dup ;
}

function duplicateCheck2(trgtData, compareJson, keyName){
	var dup = false ;
		for(var k=0; k<compareJson.length; k++){
			if(trgtData != compareJson[k][keyName]){
				MessageBox.dialog('<s:message code="code.msg.000019"/>');
				dup = true ;	
			}
			if(dup == true){
				break;
			}
		}
	return dup ;
}

function duplicateCheck3(trgtJson, compareJson, keyName1, keyName2){
	var dup = false ;
	for(var i=0; i<trgtJson.length; i++){
		dup = false ;
		for(var k=0; k<compareJson.length; k++){
			if(trgtJson[i][keyName1] == compareJson[k][keyName1] && trgtJson[i][keyName2] == compareJson[k][keyName2]){
				MessageBox.dialog('<s:message code="cs.msg.policy.0009" />');
				dup = true ;	
			}
		}
		if(dup == true){
			break;
		}
	}
	return dup ;
}

//Level List 가져오기
function counselTypeLevelListAjax(){
	//마지막 레벨일경우 엑티비티 시퀀스 넘김
// 	alert(oriLastLev);
	var chkActivitySeq = oriLastLev=='Y' ? activitySeqno : "";
	divMask("#counselTypeMainDiv","Uploading...");
	$.ajax({
		type : "get",  
		async : false,
		url : baseUrl + "co/getLevelList?chkActivitySeq="+chkActivitySeq,
		dataType : 'json',
		success : function(data) {
// 			alert(JSON.stringify(data));
			if(data.level.length>0){
				$("#counselLevelGrid1").clearGridData();
				gf_addMultiGridList("#counselLevelGrid1", data.level);
			}
		},	error:function(data){
			MessageBox.dialog("err.500");
		},
		complete:function(jqXHR, textStatus){
			divUnmask("#counselTypeMainDiv");
		}
	});
}

//Group List 가져오기
function counselTypeGetGroupListAjax(groupLevel){
	divMask("#counselTypeMainDiv","Uploading...");
	$.ajax({
		type : "get",  
		async : false,
		url : baseUrl + "co/getGroupList?groupLevel="+groupLevel,
		dataType : 'json',
		success : function(data) {
// 			alert(JSON.stringify(data));
			$("#levelGroupGrid1").clearGridData();
			if(data.groupList.length>0){
				gf_addMultiGridList("#levelGroupGrid1", data.groupList);
			}
		},	error:function(data){
			MessageBox.dialog("err.500");
		},complete:function(jqXHR, textStatus){
			divUnmask("#counselTypeMainDiv");
		} 
	});
}

//User List 가져오기
function counselTypeGetUserListAjax(groupSeq){
	divMask("#counselTypeMainDiv","Uploading...");
	$.ajax({
		type : "get",  
		async : false,
		url : baseUrl + "co/getUserList?groupSeq="+groupSeq,
		dataType : 'json',
		success : function(data) {
// 			alert(JSON.stringify(data));
			$("#groupUserGrid").clearGridData();
			if(data.userList.length!=0){
				gf_addMultiGridList("#groupUserGrid", data.userList);
			}
		},	error:function(data){
			MessageBox.dialog("err.500");
		},complete:function(jqXHR, textStatus){
			divUnmask("#counselTypeMainDiv");
		}
	});
}

</script>
   
<div id="counselTypeMainDiv">
<div id="counselTypeDiv" style="width: 100%;">
	<form id="counselTypeForm" >
		<div>
	    	<div class="f_left" style="width:230px">
		    	<div class="title">
					<h1><s:message code="code.label.000071"/></h1>
				</div>
				<div id="counselTypeTree" class="table_view01" style="width: 230px; height:475px; overflow-y: auto;">
					<ul id="counselTypeNavigation"></ul>
				</div>
			</div>
			<div class="f_right" style="width: 520px;">
				<div>
					<div class="title">
						<h1><s:message code="code.label.000072"/></h1>
						<div class="f_right">
							<span class="btns3 save"><input id="CounselResetBtn" type="button" value= '<s:message code="cmn.btn.reset"/>'  /></span>
							<span class="btns3 save"><input id="CounselNewBtn" type="button" value= '<s:message code="cmn.btn.new"/>'  /></span> 
						</div>
					</div>
					<table style="width: 100%;" border="1" class="table_view01">
						<colgroup>
							<col width="27%" />				
							<col width="43%" />				
							<col width="25%" />				
							<col width="5%" />				
						</colgroup>
						<tr>
						<tr>
							<th><s:message code="co.label.counselCode"/></th>
							<td>
								<input type="text" name="activityCode" class="form_readonly" style="width: 100%;" readonly="readonly"/>
							</td>
							<th><s:message code="co.label.lastLevelCheck"/></th>
							<td>
								<input type="checkbox" id="lastLevChk" name="lastLevChk"/>
							</td>
						</tr>
						<tr>
							<th><s:message code="co.label.couselCodeName"/></th>			
							<td colspan="3">
								<input type="text" name="activityDesc" class="form_normal01" style="width: 100%;" />
							</td>
				 		</tr>
						<tr>
							<th><s:message code="co.label.explanation"/></th>			
							<td colspan="3">
								<input type="text" name="activityDescK" class="form_normal01" style="width: 100%;" />
							</td>
				 		</tr>
						<tr>
							<th><s:message code="co.smscode.smscode.label.00002"/></th>				
							<td colspan="3">
								<select name="activityEventCd" style="width:100%;" class="form_select01" disabled="disabled">
									<option value=""><s:message code="code.msg.choose"/></option>
									<code:out codeType="EventCd" option="listbox" />
								</select>
							</td>
						</tr>
						<tr>
							<th><s:message code="co.label.functionName"/></th>		 		
							<td colspan="3">
								<input type="text" name="command" class="form_readonly" style=" width: 100%;" readonly="readonly"/>		
							</td>
						</tr>
					</table>
				</div>
				<div>
<!-- 					<div class="title"> -->
<!-- 						<h1>Counsel Responsibility</h1> -->
<!-- 						<div class="f_right"> -->
<%-- 							<span class="btns3_1 save"><input id="CounselAddBtn" type="button" value='<s:message code="cmn.btn.add"/>'  disabled="disabled"/></span>  --%>
<%-- 							<span class="btns3_1 save"><input id="CounselDeleteBtn" type="button" value= '<s:message code="cmn.btn.delete"/>'  disabled="disabled"/></span> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<table id="counselTypeGrid"></table> -->
					<table style="width: 100%;">
						<colgroup>
							<col width="25%"/>
							<col width="30%"/>
							<col width="5%"/>
							<col width="40%"/>
						</colgroup>
						<tr>
							<td>
								<div class="title">
									<h1><s:message code="code.label.000065"/><!--Level--></h1>
								</div>
							</td>
							<td>
								<div class="title">
									<h1><s:message code="code.label.000073"/></h1>
								</div>
							</td>
							<td>
							</td>
							<td>
								<div class="title">
									<h1><s:message code="code.label.000073"/></h1>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<table id="counselLevelGrid1"></table>
<!-- 								<div style="display: none;"> -->
<!-- 									<table id="counselLevelGrid2"></table> -->
<!-- 								</div> -->
							</td>
							<td>
								<table id="levelGroupGrid1"></table>
							</td>
							<td style="padding-left: 5px;">
								<div class="shuttle_btn_box01" style="padding-bottom: 30px;">
									<p class="mt_50">
						                <a href="#"  id="groupAdd"><img src="<c:url value="/resources/images/btn/shuttle_add.gif"/>" alt="" /></a>
									</p>
									<p class="mt_20">
						                <a href="#"  id="groupDel"><img src="<c:url value="/resources/images/btn/shuttle_del.gif"/>" alt="" /></a>
									</p>
								</div>
							</td>
							<td>
								<table id="levelGroupGrid2"></table>
							</td>
						</tr>					
					</table>
					<div class="title">
						<h1><s:message code="code.label.000074"/></h1>
					</div>
					<table id="groupUserGrid"></table>
					<br/>
					<div class="f_right">
						<c:choose>
						<c:when test="${param.dialogName eq 'searchTypeDialog'}">
							<span class="btns7 save"><input id="CounselConfirmBtn" type="button" value= '<s:message code="cmn.btn.confirm"/>'  /></span>
						</c:when> 
						<c:otherwise>
							<span class="btns7 save"><input id="CounselSaveBtn" type="button" value= '<s:message code="cmn.btn.save"/>'  /></span>
						</c:otherwise>
						</c:choose>
						<span class="btns7 save"><input id="CounselCloseBtn" type="button" value="<s:message code="cmn.btn.close" />" /></span>
					</div>
				</div>
			</div>
		</div>	
	</form>
</div>
</div>