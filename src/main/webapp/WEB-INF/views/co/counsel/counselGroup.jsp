<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">

$(function(e){
		
		$("#counselGroupForm #groupGrid").mouseover(function(e){
		    $(this).css("cursor","pointer");
		});
		//그리드 초기화
		<%--ABA_SE_GROUP--%>
		$("#counselGroupForm #groupGrid").jqGrid({
			datatype : "local",
			height :130,
			width : 200,
			colNames : [ 
			             '<s:message code="code.label.000067"/>',//Group Seq
			             '<s:message code="code.label.000088"/>',//GroupName
						], 
			colModel : [ 
			             { name : 'groupSeq',   		index : 'groupSeq',             width : "70",   sorttype : "string", hidden:true}, 
			             { name : 'groupName',			index : 'groupName', 			width : "150", 	sorttype : "string"}
			           ],
		    
			multiselect : true,
	   	   	viewrecords : true,
	   	   	shrinkToFit : false,
	        onSelectRow : function (id) {
        	}
		});
		
		$("#counselGroupForm #activityGrid").mouseover(function(e){
		    $(this).css("cursor","pointer");
		});
		<%--ABA_CCM_ACTIVITY--%>
		$("#counselGroupForm #activityGrid").jqGrid({
			datatype : "local",
			height :420,
			width : 280,
			colNames : [ 
			             '<s:message code="code.label.000089"/>',	//ActivitySeq
			             '<s:message code="or.user000.label.040"/>',//Description
						], 
			colModel : [ 
			             { name : 'activitySeqno',   			index : 'activitySeqno',        width : "70",   sorttype : "string", hidden:true}, 
			             { name : 'activityDesc',				index : 'activityDesc',			width : "250", 	sorttype : "string"}
			           ],
		    
			multiselect : false,
	   	   	viewrecords : true,
	   	   	shrinkToFit : false,
	        onSelectRow : function (id) {
	        	//클릭시 페이징 변수 초기화
				var form = "counselGroupForm";
				$("#"+form).find("[id=linktotalCnt]").text(0);
				$("#"+form).find("[id=linkcurrentCnt]").text(0);
				$("#"+form +" #linkpage").val(0);
	        	
	        	
	        	var rowData=$("#counselGroupForm #activityGrid").getRowData(id);
	        	var activitySeqno =  rowData.activitySeqno;
	        	searchLinkList(activitySeqno);
	        	
        	}
		});
		
		$("#counselGroupForm #questionGrid").mouseover(function(e){
			    $(this).css("cursor","pointer");
		});
		<%--ABA_CCM_ITEM Question--%>
		$("#counselGroupForm #questionGrid").jqGrid({
			datatype : "local",
			height :130,
			width : 390,
			colNames : [ 
			             '<s:message code="code.label.000090"/>',	//'ItemLinkSeq',
			             '<s:message code="counsel.label.000001"/>',//'CCMITEMQUESSEQ',
			             '<s:message code="cs.lable.cust.000098"/>',//'ITEMTYPE',
			             '<s:message code="counsel.label.000002"/>',//'ITEM_NAME',
			             '<s:message code="counsel.label.000003"/>',//'TOP_QUESTION',
			             '<s:message code="code.label.000065"/>',	//'LEVEL'
						], 
			colModel : [ 
			             { name : 'ccmItemLinkSeq',   	index : 'ccmItemLinkSeq',   width : "70",   sorttype : "string", hidden:true},
			             { name : 'ccmItemQuesSeq',   	index : 'ccmItemQuesSeq',   width : "70",   sorttype : "string", hidden:true},
			             { name : 'itemTypeDesc',		index : 'itemTypeDesc', 	width : "60", 	sorttype : "string"},
			             { name : 'itemNm',				index : 'itemNm', 			width : "115", 	sorttype : "string"},
			             { name : 'parentQuesDesc',		index : 'parentQuesDesc', 			width : "115", 	sorttype : "string"},
			             { name : 'linkLevel',			index : 'linkLevel', 		width : "35", 	sorttype : "string"}
			           ],
		    
			multiselect : true,
	   	   	viewrecords : true,
	   	   	shrinkToFit : false,
	        onSelectRow : function (id) {
	        	searchAnswerList(id);
        	}
		});
		
		$("#counselGroupForm #questionSortBtn").click(function(){
			jQuery("#counselGroupForm #questionGrid").jqGrid('searchGrid',
				{sopt:['cn','bw','eq','ne','lt','gt','ew']}
			);
		});	
		
		$("#counselGroupForm #answerGrid").mouseover(function(e){
			    $(this).css("cursor","pointer");
		});
		<%--ABA_CCM_ITEM Answer--%>
		$("#counselGroupForm #answerGrid").jqGrid({
			datatype : "local",
			height :130,
			width : 270,
			colNames : [ 
			             '<s:message code="counsel.label.000004"/>',//ItemSeq
			             '<s:message code="or.user000.label.040"/>',//Description
						], 
			colModel : [ 
			             { name : 'ccmItemSeq',   	index : 'ccmItemSeq',       width : "70",   sorttype : "string", hidden:true}, 
			             { name : 'itemNm',			index : 'itemNm', 			width : "193", 	sorttype : "string"}
			           ],
		    
			multiselect : false,
	   	   	viewrecords : true,
	   	   	shrinkToFit : false,
	        onSelectRow : function (id) {
        	}
		});
		
		
		 $("#counselGroupForm #linkGrid").mouseover(function(e){
			    $(this).css("cursor","pointer");
		});
		$("#counselGroupForm #linkGrid").jqGrid({
			datatype : "local",
			height :230,
			width : 883,
			colNames : [
			            '<s:message code="counsel.label.000005"/>',	//'ItemGrpActSeq',
			            '<s:message code="code.label.000067"/>',	//'Group Seq',
			            '<s:message code="code.label.000088"/>',	//'GroupName',
			            '<s:message code="code.label.000089"/>',	//'ActivitySeq',
			            '<s:message code="or.user000.label.040"/>',	//'Description',
			            '<s:message code="counsel.label.000004"/>',	//'ItemSeq',
			            '<s:message code="counsel.label.000002"/>',	// 'Item Name',
			            '<s:message code="counsel.label.000006"/>',	//'PARENT_Ques_Desc'
						], 
			colModel : [ 
			             { name : 'ccmItemGrpActSeq',   index : 'ccmItemGrpActSeq', width : "80",  sorttype : "string", hidden:true},
			             { name : 'groupSeq',   		index : 'groupSeq',       	width : "80",  sorttype : "string", hidden:true}, 
			             { name : 'groupName',			index : 'groupName', 		width : "130", sorttype : "string"},
			             { name : 'activitySeqno',   	index : 'activitySeqno',    width : "80",  sorttype : "string", hidden:true}, 
			             { name : 'activityDesc',		index : 'activityDesc', 	width : "335", sorttype : "string"},
			             { name : 'ccmItemLinkSeq',   	index : 'ccmItemLinkSeq',   width : "80",  sorttype : "string", hidden:true}, 
			             { name : 'itemNm',				index : 'itemNm', 			width : "150", sorttype : "string"},
			             { name : 'parentQuesDesc',		index : 'parentQuesDesc', 	width : "150", sorttype : "string"}
			           ],
		    
			multiselect : true,
	   	   	viewrecords : true,
	   	   	shrinkToFit : false,
	        onSelectRow : function (id) {
        	}
		});
	$("#counselGroupForm #linkSortBtn").click(function(){
		jQuery("#counselGroupForm #linkGrid").jqGrid('searchGrid',
			{sopt:['cn','bw','eq','ne','lt','gt','ew']}
		);
	});	
	
	
	
	
	
	function loading(){
		//그리드 데이터 조회
		searchGroupList();
		searchActivityList();
		searchQuestionList();
		searchLinkList();
		
		var form = "counselGroupForm";
		//페이징초기화
		$("#"+form).find("[id=questotalCnt]").text(0);
		$("#"+form).find("[id=quescurrentCnt]").text(0);
		$("#"+form +" #quespage").val(0);
		
		$("#"+form).find("[id=linktotalCnt]").text(0);
		$("#"+form).find("[id=linkcurrentCnt]").text(0);
		$("#"+form +" #linkpage").val(0);
		
	}
	
	
	loading(); 
	
	
		
	//Add 버튼을 눌렀을때
	$("#counselGroupForm #authInfoADDBtn").click(function(e){
		var groupData 	  = gf_getMultiSelectedGridData("#counselGroupForm #groupGrid");
		var activityData  = gf_getSelectedGridData("#counselGroupForm #activityGrid");
		var itemData	  = gf_getMultiSelectedGridData("#counselGroupForm #questionGrid");
		if(groupData.length < 1){
			MessageBox.dialog('<s:message code="counsel.msg.000001"/>');
		}else if(!activityData){
			MessageBox.dialog('<s:message code="counsel.msg.000002"/>');
		}else if(!itemData){
			MessageBox.dialog('<s:message code="counsel.msg.000003"/>');
			$("#counselGroupForm #questionGrid").jqGrid('resetSelection');
		}else{
			var addJson = "[";
			for(var i=0;i<groupData.length;i++){
				for(var j=0; j < itemData.length;j++){
					addJson += '{"ccmItemGrpActSeq":"","groupSeq":"'+groupData[i].groupSeq+'","groupName":"'+groupData[i].groupName
				    +'","activitySeqno":"'+activityData.activitySeqno+'","activityDesc":"'+activityData.activityDesc
				    +'","ccmItemLinkSeq":"'+itemData[j].ccmItemLinkSeq+'","itemNm":"'+itemData[j].itemNm+'","parentQuesDesc":"'+itemData[j].parentQuesDesc+'"},';						
				}
			}
			addJson += "]";
				var linkData = gf_getAllGridData("#counselGroupForm #linkGrid");
				if(!duplicateCheck(linkData,eval(addJson))){
					gf_addMultiGridList("#counselGroupForm #linkGrid",eval(addJson));
				}else{
					//alert("중복되는 데이터가 있습니다.데이터를 체크해주세요!!");
				}
		}
	});
	
	//Del버튼을 눌렀을때
	$("#counselGroupForm #authInfoDELBtn").click(function(e){
		var linkData = gf_getMultiSelectedGridData("#counselGroupForm #linkGrid",false);
		var delData = {linkList:linkData};
		divMask("#counselGroupMainDiv","Uploading...");
		$.ajax({
			type : "POST",  
			async : true,
			url : baseUrl + "co/counsel/delLinkList",
			contentType: "application/json",
			data : JSON.stringify(delData),
			dataType:"json",
			success : function(data) {
				if(data.messageParam.resultCode == "SUCCESS"){
					MessageBox.dialog('<s:message code="or.msg.000030"/>');
					//삭제완료후 선택된 LinkData 제거
					gf_deleteSelectedGridRow("#counselGroupForm #linkGrid");
				}else{
					MessageBox.dialog('<s:message code="counsel.msg.000004"/>');
					//errorMessage(data.MESSAGE);
				}
			},
			error:function(data){
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				divUnmask("#counselGroupMainDiv");
			}
			
		});
	});
	
	//하단의 Save버튼을 눌렀을때
	$("#counselGroupForm #counselLinkSave").click(function(e){
		var linkCnt = gf_getTotalRow("#counselGroupForm #linkGrid");
		var linkData = gf_getAllGridData("#counselGroupForm #linkGrid",false);
		var addData = {linkList:linkData};
		if(linkCnt != 0){
			divMask("#counselGroupMainDiv","Uploading...");
			$.ajax({
				type : "POST",  
				async : true,
				url : baseUrl + "co/counsel/insertLinkList",
				contentType: "application/json",
				data : JSON.stringify(addData),
				dataType:"json",
				success : function(data) {
					if(data.messageParam.resultCode == "SUCCESS"){
						MessageBox.dialog('<s:message code="cmn.msg.saved"/>');
						//저장완료후 모든Grid 재조회 
						searchGroupList();
						searchActivityList();
						searchQuestionList();
						searchLinkList();
						//Answer그리드 초기화
						gf_clearGridList("#counselGroupForm #answerGrid");
						//gf_deleteSelectedGridRow("#counselGroupForm #linkGrid");
					}else{
						MessageBox.dialog('<s:message code="counsel.msg.000004"/>');
						//errorMessage(data.MESSAGE);
					}
				},
				error:function(data){
					MessageBox.dialog('<s:message code="cos.msg.server"/>');
				},
				complete:function(jqXHR, textStatus){
					divUnmask("#counselGroupMainDiv");
				}
				
			});
		}else{
			MessageBox.dialog('<s:message code="counsel.msg.000005"/>');
			return;
		}
	}); 
	
	
	function duplicateCheck(trgtJson, compareJson){
		var dup = false ;
		for(var i=0; i<trgtJson.length; i++){
			dup = false ;
			for(var k=0; k< compareJson.length; k++){
				if(trgtJson[i]['groupSeq'] == compareJson[k]['groupSeq']&&trgtJson[i]['activitySeqno'] == compareJson[k]['activitySeqno']&&trgtJson[i]['ccmItemLinkSeq'] == compareJson[k]['ccmItemLinkSeq']){
						//MessageBox.dialog('<s:message code="cs.msg.policy.0009" />');
						 alert('<s:message code="counsel.msg.000007"/>'+"GROUP:"+trgtJson[i]['groupName']+",ACTIVITY:"+trgtJson[i]['activityDesc']+",ITEM:"+trgtJson[i]['itemNm']);
						/* MessageBox.dialog("중복되는 데이터가 있습니다.다음의 데이터를 체크해주세요!!\n"+"GROUP:"+trgtJson[i]['groupName']+",ACTIVITY:"+trgtJson[i]['activityDesc']+",ITEM:"+trgtJson[i]['itemNm']); */
					dup = true ;	
				}
			}
			if(dup == true){
				break;
			}
		}
		
		return dup ;
	}
	
	$("#activitySearchBtn").click(function(e){
		e.preventDefault();
		searchActivityList();
	});
	
});

$("#counselGroupForm #counselQnAClose").click(function(e){
	Dialog.close('#${param.dialogName}');
});

$("#counselGroupForm #activityDesc").keypress(function(e){
	if(e.keyCode == 13){
		searchActivityList();
	}else{
		//e.preventDefault();
	}
});



//그룹리스트  조회
function searchGroupList(){
	gf_clearGridList("#counselGroupForm #groupGrid");
	divMask("#counselGroupMainDiv","Uploading...");
	$.ajax({
		type : "GET",  
		async : true,
		url : baseUrl + "co/counsel/getGroupList",
		dataType : 'json',
		data : "",
		dataType:"json",
		success : function(data) {
			if(data.RESULT == "SUCCESS"){
				//MessageBox.dialog("");
				//화면 호출후  초기화 처리
				gf_addMultiGridList("#counselGroupForm #groupGrid",data.list);
				$(this).hideLoading();
			}else{
				MessageBox.dialog('<s:message code="counsel.msg.000004"/>');
				//errorMessage(data.MESSAGE);
				$(this).hideLoading();
			}
		},
		error:function(data){
			$(this).hideLoading();
			MessageBox.dialog('<s:message code="cos.msg.server"/>');
		},
		complete:function(jqXHR, textStatus){
			divUnmask("#counselGroupMainDiv");
		}
		
	});
}		


//Activity(상담유형)리스트  조회
function searchActivityList(){
	gf_clearGridList("#counselGroupForm #activityGrid");
	var activitySearch = $.trim($("#counselGroupForm  #activityDesc").val());
	var strParam = "";
	if(activitySearch != null && activitySearch != ''){
		strParam =  "?activityDesc="+activitySearch;
	}
	
	//상담유형 조회시 Link그리드도 초기화
	var form = "counselGroupForm";
	gf_clearGridList("#counselGroupForm #linkGrid");
	$("#"+form).find("[id=linktotalCnt]").text(0);
	$("#"+form).find("[id=linkcurrentCnt]").text(0);
	$("#"+form +" #linkpage").val(0);
	
	/* alert(strParam); */
	divMask("#counselGroupMainDiv","Uploading...");
	$.ajax({
		type : "GET",  
		async : true,
		url : baseUrl + "co/counsel/getActivityList"+strParam,
		dataType : 'json',
		data : "",
		dataType:"json",
		success : function(data) {
			if(data.RESULT == "SUCCESS"){
				gf_addMultiGridList("#counselGroupForm #activityGrid",data.list);
			}else{
				MessageBox.dialog('<s:message code="counsel.msg.000004"/>');
			}
		},
		error:function(data){
			MessageBox.dialog('<s:message code="cos.msg.server"/>');
		},
		complete:function(jqXHR, textStatus){
			divUnmask("#counselGroupMainDiv");
		}
		
	});
}

//Question 리스트  조회
function searchQuestionList(pageflag){
	if(pageflag != 'page'){
		gf_clearGridList("#counselGroupForm #questionGrid");
	}
	var paramStr = '';
	paramStr = '?page='+$("#counselGroupForm #linkpage").val();
	divMask("#counselGroupMainDiv","Uploading...");
	$.ajax({
		type : "GET",  
		async : true,
		url : baseUrl + "co/counsel/getQuestionList"+paramStr,
		dataType : 'json',
		data : "",
		dataType:"json",
		success : function(data) {
			if(data.RESULT == "SUCCESS"){
				$(this).hideLoading();
				gf_addMultiGridList("#counselGroupForm #questionGrid",data.list);
				var form = "counselGroupForm";
				var table= "questionGrid";
				$("#"+form).find("[id=quespage]").val(data.pagination.currentPage+1);
				$("#"+form).find("[id=questotalCnt]").text(data.pagination.objectsCount);
				$("#"+form).find("[id=quescurrentCnt]").text( $("#"+table).getDataIDs().length );
			}else{
				MessageBox.dialog('<s:message code="cs.msg.cug.0001"/>');
				//errorMessage(data.MESSAGE);
			}
		},
		error:function(data){
			$(this).hideLoading();
			MessageBox.dialog('<s:message code="cos.msg.server"/>');
		},
		complete:function(jqXHR, textStatus){
			divUnmask("#counselGroupMainDiv");
		}
		
	});
}

//Answer 리스트  조회
function searchAnswerList(id){
	gf_clearGridList("#counselGroupForm #answerGrid");
	var quesData = gf_getSelectedGridData("#counselGroupForm #questionGrid");
	if(quesData){
		var ccmItemQuesSeq = quesData.ccmItemQuesSeq;
		var linkLevel = quesData.linkLevel;
		var strParam = "?ccmItemSeq="+ccmItemQuesSeq+"&linkLevel="+linkLevel;
		//alert(strParam);
		divMask("#counselGroupMainDiv","Uploading...");
		$.ajax({
			type : "GET",  
			async : true,
			url : baseUrl + "co/counsel/getAnswerList"+strParam,
			dataType : 'json',
			data : "",
			dataType:"json",
			success : function(data) {
				if(data.RESULT == "SUCCESS"){
					//MessageBox.dialog("");
					gf_addMultiGridList("#counselGroupForm #answerGrid",data.list);
					$(this).hideLoading();
				}else{
					$(this).hideLoading();
					MessageBox.dialog('<s:message code="cs.msg.cug.0001"/>');
					//errorMessage(data.MESSAGE);
				}
			},
			error:function(data){
				$(this).hideLoading();
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				divUnmask("#counselGroupMainDiv");
			}
			
		});
	}else{
		MessageBox.dialog('<s:message code="counsel.msg.000006"/>');
		return;
	}
}

//Link 리스트  조회
function searchLinkList(activitySeqno,pageflag){
	if(pageflag != 'page'){
		gf_clearGridList("#counselGroupForm #linkGrid");
	}
	var paramStr = '';
	paramStr = '?page='+$("#counselGroupForm #linkpage").val();
	if(activitySeqno){
		paramStr += '&activitySeqno='+ activitySeqno;
	} 
	$(this).loadingDialog();
	divMask("#counselGroupMainDiv","Uploading...");
	$.ajax({
		type : "GET",  
		async : true,
		url : baseUrl + "co/counsel/getLinkList"+paramStr,
		dataType : 'json',
		data : "",
		dataType:"json",
		success : function(data) {
			if(data.RESULT == "SUCCESS"){
				$(this).hideLoading();
				gf_addMultiGridList("#counselGroupForm #linkGrid",data.list);
				var form = "counselGroupForm";
				var table= "linkGrid";
				$("#"+form).find("[id=linkpage]").val(data.pagination.currentPage+1);
				$("#"+form).find("[id=linktotalCnt]").text(data.pagination.objectsCount);
				$("#"+form).find("[id=linkcurrentCnt]").text( $("#"+table).getDataIDs().length );
			}else{
				$(this).hideLoading();
				MessageBox.dialog('<s:message code="cs.msg.cug.0001"/>');
			}
		},
		error:function(data){
			$(this).hideLoading();
			MessageBox.dialog('<s:message code="cos.msg.server"/>');
		},
		complete:function(jqXHR, textStatus){
			divUnmask("#counselGroupMainDiv");
		}
		
	});
}

$("#counselGroupForm #quespageBtn").click(function(e){
	searchQuestionList('page');
});

$("#counselGroupForm #linkpageBtn").click(function(e){
	var activity = gf_getSelectedGridData("#counselGroupForm #activityGrid");
	var activitySeqno = '';
	if(activity){
		activitySeqno = activity.activitySeqno;
	}
	searchLinkList(activitySeqno,'page');
});

</script>
<!-- <div id="wrap_600"> -->
<div id="counselGroupMainDiv">
<div style="width: 100%;">
	<form id="counselGroupForm">
		 <!-- <div class="title">
					<h1>Item Group Mapping</h1>
		</div>  -->
		<%-- <div class="f_left"  style="width:100%">	
	        <img src="<s:url value="/resources/images/icon/bl_02.gif"/>" />
	     <span id="elementTitle">
	     Item Group Mapping
	     </span>
	    </div> --%>
		<div class="contents_box">	
			<div class="contents_box mt_10" style="width:100%;">
				<div style="width:290px;height:560px;float:left;">
				<div class="title ">
					<h1><s:message code="counsel.label.000007"/></h1>
				</div>
				<div class="search_box_01" style="width:230px;height:23px;">
					<div class="f_left" style="">
					<input type="text" class="form_normal01" id="activityDesc" name="activityDesc" style="width:130px;" value=""/>
					<div style="position:absolute;top:53px;left:200px;">
						<span class="f_right btns4 save"><input type="button" id="activitySearchBtn" style="" name= "activitySearchBtn"  value='<s:message code="cmn.btn.search"/>' /></span>
					</div>
					</div>
				</div>
					<div class="mt_10">
					<table id="activityGrid"></table>
					</div>
				</div>
				<div style="width:210px;float:left">
				<div class="title">
					<h1><s:message code="code.label.000073"/></h1>
				</div>
					<table id="groupGrid"></table>
				</div>
				<div style="width:390px;float:left;">
				<div class="title ">
					<h1><s:message code="counsel.msg.000008"/></h1>
					<ul class="btn_listtop f_right">
						<li class="page"><span class="text" id="quescurrentCnt"></span> <s:message code="co.label.slash"/> <span class="text" id="questotalCnt"></span></li>
						<li><a href="#" id="quespageBtn"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
					</ul>
					<input type="hidden" id="quespage" name="quespage" value="0">
				</div>
					<table id="questionGrid"></table>
					<span class="btns7 save mt_5"><input type="button" value='<s:message code="cmn.btn.search"/>'  id="questionSortBtn"/></span>
				</div>
				<div style="width:270px;float:right;">
				<div class="title ">
					<h1><s:message code="counsel.msg.000009"/></h1>
				</div>
					<table id="answerGrid"></table>
				</div>
			</div>
			<div class=" f_right mt_30 both" style="position:absolute;top:210px;left:430px;width:600px;text-align:center;">
				<span class="btns7 save" ><input type="button" value='<s:message code="cmn.btn.downAdd"/>' id="authInfoADDBtn"/></span>
				&nbsp;&nbsp;&nbsp;
				<span class="btns7 save" ><input type="button" value="▲DEL" id="authInfoDELBtn"/></span>
			</div>
			<div class="f_right mt_10 both" style="position:absolute;top:260px;left:305px;width:883px;">
				<div class="title">
					<h1><s:message code="counsel.msg.000010"/></h1>
					<ul class="btn_listtop f_right">
						<li class="page"><span class="text" id="linkcurrentCnt"></span> <s:message code="co.label.slash"/> <span class="text" id="linktotalCnt"></span></li>
						<li><a href="#" id="linkpageBtn"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
					</ul>
					<input type="hidden" id="linkpage" name="linkpage" value="0">
				</div>
				<div class="content_box" style="width:750px;">
					<table id="linkGrid"></table>
				</div>
				<br/>
				<div class="f_left">
				<span class="btns7 save"><input type="button" value='<s:message code="cmn.btn.search"/>'  id="linkSortBtn"/></span>
				</div>
				<div class="f_right">
					<span class="btns7 save"><input id="counselLinkSave" type="button" value= '<s:message code="cmn.btn.save"/>'  /></span>
					<%-- <span class="btns7 save"><input id="counselQnADelete" type="button" value= '<s:message code="cmn.btn.delete"/>'  /></span> --%>
					<span class="btns7 save"><input id="counselQnAClose" type="button" value= '<s:message code="cmn.btn.close"/>'  /></span>
				</div>
			</div>	
		</div>
		<input type="text" name="temp" style="display:none;"/><%--페이지에 text타입이 한개일경우 엔터키값을 submit으로처리방지용--%>
	</form>
</div>

</div>

<!-- </div> -->