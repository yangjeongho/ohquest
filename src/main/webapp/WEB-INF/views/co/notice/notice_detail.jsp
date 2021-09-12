<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>
<script  type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<script type="text/javascript">

	//gird 초기화 및 page초기화
	function modelInit(form, table){
		$("#"+form).find("[id=totalCnt]").text(0);
		$("#"+form).find("[id=currentCnt]").text(0);
		$("#"+table).jqGrid("clearGridData", true);
		$("#"+form +" #page").val(0);
	}
	
	
	$(function(e){
		
		//jqgrid 초기화
		modelInit("noticeSearchForm", "noticeTable");
		//noticeGridAjaxCall(baseUrl + "notice/notice_detailgrid","noticeSearchForm", "noticeTable");
		
		<%-- 권한이 일반 유저인 경우는 contentTable,New,update,delete버튼을  숨겨줌.--%>
		if('${authType}' == 'User'){
			//$("#noticeRegForm #contentTable").hide();
			$("#noticeRegForm #newNoticeBtn").hide();
			$("#noticeRegForm #modifyNoticeBtn").hide();
			$("#noticeRegForm #deleteNoticeBtn").hide();
			//$("#noticeRegForm #viewNoticeBtn").show();
			 
		}else if('${authType}' == 'Manager'){
			<%-- 권한이 관리자인경우는 다보여줌--%>
			$("#noticeRegForm #contentTable").show();
			$("#noticeRegForm #newNoticeBtn").show();
			$("#noticeRegForm #modifyNoticeBtn").show();
			$("#noticeRegForm #deleteNoticeBtn").show();
		}
	});
	
	//조회버튼 클릭
	$("#searchNoticeBtn").click(function(e){
		e.preventDefault();
		modelInit("noticeSearchForm","noticeTable");
		noticeGridAjaxCall(baseUrl + "notice/notice_detailgrid","noticeSearchForm", "noticeTable");
	});
	
	//main jqgrid 리스트 가져오기
	function noticeGridAjaxCall(curl, form, table){
		$.ajax({
			type : "POST",  
			async : true,
			url : curl,
			data : $("#"+form).serialize(),
			dataType : 'json',
			success : function(data) {
				gf_console.log(data);
			    var orUserTableRow  = $("#"+table).getDataIDs();
				for(var i = 0; i < data.list.length; i++) {
					orUserTableRow = orUserTableRow + 1;
					if(data.list[i].notice_type == '03'){
						data.list[i].notice_title_color = "<font color='red'>"+data.list[i].notice_title+"</font>";
					}else if(data.list[i].notice_type == '02'){
						data.list[i].notice_title_color = "<font color='blue'>"+data.list[i].notice_title+"</font>";
					}else{
						data.list[i].notice_title_color = data.list[i].notice_title;
					}
					$("#"+table).jqGrid('addRowData', orUserTableRow+1, data.list[i]);
				} 
				
				$("#"+form).find("[id=page]").val(data.pagination.currentPage+1);
				$("#"+form).find("[id=totalCnt]").text(data.pagination.objectsCount);
				$("#"+form).find("[id=currentCnt]").text( $("#"+table).getDataIDs().length );
			},	error:function(data){
				//서버 비정상 동작시 구현
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
				
			}
		});
	}	
	
	// 페이징
	$("#noticeSearchForm #pageBtn").click(function(e){
		e.preventDefault();
		if(pageNavCom("noticeSearchForm")){
			noticeGridAjaxCall(baseUrl + "notice/notice_detailgrid","noticeSearchForm", "noticeTable");			
		};
	 });
	
	//page
	function pageNavCom(form){
		var totalCnt = $("#"+form).find("[id=totalCnt]").text() ;
		var currentCnt = $("#"+form).find("[id=currentCnt]").text() ;
		if(parseInt(totalCnt) == parseInt(currentCnt)) {
			return false;
		}
		return true;
	}
	
		$("#noticeTable").mouseover(function(e){
		    $(this).css("cursor","pointer");
		}); 
		$("#noticeTable").jqGrid({        
			datatype: "local",
			colNames: [
			            '<s:message code="cos.label.SeqNo"/>',//
			            '<s:message code="cs.lable.notice.000001" />',
			            '<s:message code="cs.lable.notice.000001" />',
			            '<s:message code="cs.lable.notice.000002" />', 
			            '<s:message code="cs.lable.notice.000003"/>',
			            '<s:message code="cs.lable.notice.000004"/>',
			            '<s:message code="cs.lable.notice.000005" />'],
			colModel: [
						  {name:'notice_seqno', index : 'notice_seqno', hidden : true}
			   			, {name:'notice_title_color', index:'notice_title_color', width:'520'}
			   			, {name:'notice_title', index:'notice_title', hidden:true}
			   			, {name:'notice_content', index : 'notice_content', hidden : true}
			          	, {name:'notice_personid', index:'notice_personid', width:'120'}
			          	, {name:'notice_type', index : 'notice_type', hidden : true}
			          	, {name:'notice_ndate', index:'notice_ndate', width:'97', align:"center"}
			      	  ],
			sortable: true,
			height: '170',
			width: '770',
			multiselect: false,
		   	viewrecords: true,
		   	shrinkToFit: false,
		   	onSelectRow: function (id,status) {
		   		var rowData=$("#noticeTable").getRowData(id);
		   		
 	  	 		$("#noticeRegForm #notice_seqno").val(rowData.notice_seqno);
 	  	 		$("#noticeRegForm #notice_title").val(rowData.notice_title);
 	  	 		$("#noticeRegForm #notice_content").val(rowData.notice_content);
 	  	 		$("#noticeRegForm #notice_personid").val(rowData.notice_personid);
 	  	 		$("#noticeRegForm #notice_ndate").val(rowData.notice_ndate);
 	  	 		$("#noticeRegForm #notice_type").val(rowData.notice_type);
 	  	 		
 	  	 		//선택된 데이터에 관한 파일 유무 체크 및 표시
	 	  	 	/* $.ajax({
	 				type : "POST",
	 				async : false,
	 				url : baseUrl + "notice/fileCheck",
	 				dataType : 'json',
	 				data : $("#noticeRegForm").serialize(),
	 				success : function(data) {
	 					//alert(data.filecnt);
	 					if(data.filecnt > 0){
	 						$("#noticeRegForm #fileCnt").html("<font color='red'><strong>"+'<s:message code="cs.lable.notice.000014" />'+"</strong></font>");
	 					}else{
	 						$("#noticeRegForm #fileCnt").html("<font color='red'><strong>"+'<s:message code="cs.lable.notice.000015" />'+"</strong></font>");
	 					}
	 				},
	 				complete : function(jqXHR, textStatus) {
	 				}
	 			}); */
	 				$(this).loadingDialog();
		 	  	 	$.ajax({
		 				type : "GET",
		 				async : false,
		 				url : baseUrl + "notice/searchNoticeFile/"+rowData.notice_seqno,
		 				dataType : 'json',
		 				data : $("#noticeRegForm").serialize(),
		 				success : function(data) {
		 					var fileList = data.fileList;
		 					$("#fileList").html('');
		 					var strHtml ="";
		 					if(fileList.length > 0){ 
		 						strHtml += "<table width='773' cellpadding='0' cellspacing='0' border='1' class='table_view01 mt_5'>";
		 						strHtml +=  "<th width='120' rowspan='"+(fileList.length+1)+"'>File</th>";
		 						strHtml += "<tr>";
		 						strHtml += "<td>";
			 					for(var i=0; i< fileList.length; i++){
			 						//strHtml =+ "fileSeqno:"+fileList[i].fileSeqno+">noticeSeqno:"+fileList[i].notice_Seqno+">filePath:"+fileList[i].filePath+">fileName:"+fileList[i].fileName;
			 						var fileDesc = fileList[i].fileName;
			 						
			 						strHtml += "<a href='"+baseUrl+"notice/downFile?downLoadPath="+fileList[i].filePath+"&fileName="+fileList[i].fileName+"'target='_blank'>"+fileList[i].fileName+"</a>";
			 						if(i != fileList.length-1){
			 							strHtml += ',&nbsp;&nbsp;&nbsp;';
			 						}
			 						
			 					}
			 					strHtml += "</td>";
		 						strHtml += "</tr>";
			 					strHtml += "</table>";
			 					$("#fileList").html(strHtml);
			 					$(this).hideLoading();
		 					}
		 					$(this).hideLoading();
		 				},
		 				complete : function(jqXHR, textStatus) {
		 					$(this).hideLoading();
		 				}
		 			});
	        },
	        ondblClickRow : function(rowid, iRow, iCol,e){ //더블클릭을 했을경우
	        	var rowData=$("#noticeSearchForm #noticeTable").getRowData(rowid);
	        	//타입이 유저일 경우에만 반영
	        	if('${authType}' == 'User'){
	        		var notice_seqno = rowData.notice_seqno;
	        		 if(notice_seqno != null && notice_seqno != ''){
			        		Dialog.open({
			    				div:'#noticeViewDialog',
			    				url : baseUrl + "notice/noticeView/"+notice_seqno+"?dialogName=noticeViewDialog",
			    				title : '<s:message code="cs.lable.notice.000006"/>',
			    				width : 650,
			    				height :450,
			    				modal : true
			    		    });
	        		 }
	        	}
	        }
		
		});
	
	
	//공지 추가
	$("#noticeRegForm #newNoticeBtn").click(function(e) {
		e.preventDefault();
		Dialog.open({
			div : '#newNoticeDialog',
			url : baseUrl + "notice/notice_new"
					+ "?dialogName=newNoticeDialog",
			title : '<s:message code="cmn.label.Notice-new"/>',//
			width : 800,
			height : 410, 
			modal : true
		});
	});
	
	
	//공지 수정
	$("#noticeRegForm #modifyNoticeBtn").click(function(e) {
		var notice_seqno = $("#noticeRegForm #notice_seqno").val();
		if(notice_seqno == -1){
			MessageBox.dialog('<s:message code="notice.msg.000001"/>');
			return;
		}
		Dialog.open({
			div : '#modifyNoticeDialog',
			url : baseUrl + "notice/notice_modify/"+notice_seqno+"?dialogName=modifyNoticeDialog",
			title :'<s:message code="cmn.label.Notice-modify"/>',
			width : 800,
			height : 500, 
			modal : true
		});
	});
	
		
	$("#updateNoticeBtn").click(function(e) {
		e.preventDefault();
		$.ajax({
			type : "POST",
			async : false,
			url : baseUrl + "notice/update_notice",
			dataType : 'json',
			data : $("#noticeRegForm").serialize(),
			success : function(data) {
				if (data.RESULT == "RECEIVED") {
					Dialog.open({
						div : '#noticeDialog',
						url : baseUrl + "notice/notice_detail"
								+ "?dialogName=noticeDialog",
						title : '<s:message code="cmn.label.notice"/>',
						width : 800,
						height : 700,
						modal : true
					});

				} else {
					MessageBox.dialog("err.500");
				}
			},
			complete : function(jqXHR, textStatus) {
				MessageBox.dialog('<s:message code="cmn.label.SaveComplete"/>');
			}
		});
	});

	function notice_detail() {
		Dialog.open({
			div : '#noticeDialog',
			url : baseUrl + "co/notice/notice_detail",
			title : '<s:message code="cs.lable.notice.000006" />',
			width : 800,
			height : 700,
			modal : true
		});
	}


		
	//창닫기
	$("#noticeRegForm #closeNoticeBtn").click(function(e) {
		Dialog.close('#noticeDialog');
	});
		
	
</script>

<form id="noticeSearchForm">
	<!-- 컨텐츠를 감싸는 박스 //-->
	<div class="contents_box" style="width:770px;">
		<!-- 검색조건이 한줄일 경우 //-->

		<div class="search_box_01">
			<div class="f_left">
				<p>
					<th><s:message code="cs.lable.notice.000008" /></th> 
					<select id="searchSelect" name="searchSelect"
						class="form_normal01 mr_20" style="width: 124px;">
						<option value="NOTICE_TITLE"><s:message code="cs.lable.notice.000001" /></option>
						<option value="NOTICE_PERSONID"><s:message code="cs.lable.notice.000007" /></option>
					</select> 
					<input id="searchKey" name="searchKey" type="hidden" value="" />
					&nbsp;&nbsp;<input name="searchValue" type="text"
						class="form_normal01" style="width: 120px;"
						value="" />
					<th><s:message code="cs.lable.notice.000009" /></th> <select id="notice_type" name="notice_type"  class="form_select01" style="width: 124px;">
					<option value=""><s:message code="cs.lable.notice.000010" /></option>
					<option value="01"><s:message code="cs.lable.notice.000011" /></option>
					<option value="02"><s:message code="cs.lable.notice.000004" /></option>
					<option value="03"><s:message code="cs.lable.notice.000012" /></option>
				</select>
				</p>
			</div>
			<!-- 조회 버튼 //-->
			<div class="f_right">
			<%-- 	<a href="#" id="searchNoticeBtn"><img
						src="<c:url value="/resources/images/btn/btn_search_01.gif"/>"
						alt="Search" /></a> --%>
				<img src="<s:url value="/resources/images/common/line_01.gif"/>" />
				<span class="btns7 save"><input type="button" value='<s:message code="cmn.btn.search"/>'  id="searchNoticeBtn" style="width: 80px;"/></span>
			</div>
			<!--// 조회 버튼 //-->
		</div>
		<!--// 검색조건이 한줄일 경우 -->
	
	<!--// 컨텐츠를 감싸는 박스 -->
	<!-- 컨텐츠를 감싸는 박스 //-->
	<div class="contents_box mt_10" >
		<div class="title">
			<ul class="btn_listtop f_right">
				<li class="page"><span class="text" id="currentCnt"></span> <s:message code="co.label.slash"/> <span class="text" id="totalCnt"></span></li>
				<li><a href="#" id="pageBtn"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
			</ul>
			<input type="hidden" id="page" name="page" value="0">
		</div>						
	</div>
	</div> 
	<!--// 컨텐츠를 감싸는 박스 -->
	<!-- 그리드 테이블 //-->
	<div class="con">
		<table class="main_list_01_1" border="0" frame="hsides" rules="none"
			bordercolor="#dfdfdf" id="noticeTable" name="noticeTable">
		</table>
	</div>
	<!--// 그리드 테이블 -->
	<!-- pagination -->
	</form>
	<!-- pagination -->
<form id="noticeRegForm">
	<!-- 입력 테이블 //-->
	<table width="773" cellpadding="0" cellspacing="0" border="1" id="contentTable"
		class="table_view01 mt_10">
		<colgroup>
			<col width="30%" />
			<col width="70%" />
		</colgroup>
		<input type="hidden" id="notice_seqno" name="notice_seqno" value="-1">
		<tr>
			<th><s:message code="cs.lable.notice.000001" /></th>
			<td><input type="text" class="form_normal01"
				style="width: 100%;background-color:#EBEBE4;" id="notice_title" name="notice_title" readonly="readonly"/></td>
		</tr>
		<tr>
			<th><s:message code="cs.lable.notice.000007" /></th>
			<td><input type="text" class="form_normal01"
				style="width: 100%;background-color:#EBEBE4;" id="notice_personid" name="notice_personid" value="${userId}"
				readonly="readonly" />
			</td>
		</tr>
		<tr>
			<th><s:message code="cs.lable.notice.000004" /></th>
			<td>
				<select id="notice_type" name="notice_type"  class="form_select01" style="width: 124px;background-color:#EBEBE4;" disabled>
					<option value="01"><s:message code="cs.lable.notice.000011" /></option>
					<option value="02"><s:message code="cs.lable.notice.000004" /></option>
					<option value="03"><s:message code="cs.lable.notice.000012" /></option>
				</select>
			</td>
		</tr>
		<tr>
			<th><s:message code="cs.lable.notice.000002" /></th>
			<td><textarea rows="7" cols="88" id="notice_content"
					name="notice_content" disabled></textarea>
		</tr>
	</table>
	
	<!--// 입력 테이블 -->

	<!-- 컨텐츠를 감싸는 박스 //-->
	<div class="contents_box mt_5" style="width:770px;">
		<!-- 버튼 //-->
			<div class="f_left" id="fileCnt">
			</div>
			<div id="fileList">
			</div>
			<div class="f_right" style="margin-top:5px;">
				<span class="btns9 save"><input type="button" value="<s:message code="cmn.btn.new"/>"id="newNoticeBtn" /> </span>
				<!--<span class="btns9 save"><input type="submit" value= '<s:message code="cmn.btn.save"/>' id="updateNoticeBtn" /> </span>-->
				<span class="btns9 save"><input type="submit" value="<s:message code="cmn.btn.modify"/>"id="modifyNoticeBtn" /> </span>
				<span class="btns9 save"> <input type="submit" value="<s:message code="cmn.btn.delete"/>" id="deleteNoticeBtn" /></span>		
				<span class="btns9 save"> <input type="button" value="<s:message code="cmn.btn.close"/>" id="closeNoticeBtn" /></span>
			</div>					
		
		<!--// 버튼 -->
	</div>
</form>