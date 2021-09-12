<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/label.css"/>" >
<script src="<s:url value="/resources/javascript/bsar/bsArCode.js" />" type="text/javascript"></script>
<script src="<s:url value="/resources/javascript/bsar/bs_util.js" />" type="text/javascript"></script>
<script type="text/javascript">

$(function(){
	
	//$("#${param.dialogName}").dialog('option', 'title', '<s:message code="menu.bs.title.000036"/>');
	
	$("#writeOffListMngClose").click(function(e){
		e.preventDefault();
		Dialog.close('#${param.dialogName}');
	});
	
	//datepicker 생성
	mp_gen('#writeOffListMngWorkYymm');
	dp_fromTo('#writeOffListMngTermFromDt','#writeOffListMngTermToDt');
	
	var writeOffListMngWorkYymm = $("#writeOffListMngWorkYymm");
	var writeOffListMngTermFromDt = $('#writeOffListMngTermFromDt');
	var writeOffListMngTermToDt= $('#writeOffListMngTermToDt');
	enterSubmit("#writeOffListMngSearchForm","#writeOffListMngSearchForm #writeOffListMngSearchBtn");
	var writeOffListMngGrid = $("#writeOffListMngGrid");
	
	var writeOffListMngColNm=[
	                	  //"<s:message code="bs.label.000289"/>",//진행상태
		                
	                	  "<s:message code="bs.bsArManage.label.000004"/>"		// 가입번호
	                	  ,"<s:message code="bs.bsArManage.grid.000007"/>"		// 상품번호 
	                	  ,"<s:message code="bs.bsArManage.subpop.000000"/>"	// 고객명 
	                	  ,"<s:message code="bs.bsArManage.grid.000001"/>"		// 서비스   
	                	  ,"<s:message code="bs.label.000301"/>"				// 가입상태     
	                	  ,"workDivison hidden"                                      
						  ,"Manage Division"
	                	  ,"<s:message code="bs.label.000292"/>"				// 과납금액  
	                	  
	                	  ,"<s:message code="bs.bsArManage.grid.000014"/>"		// 미납금액 
	                	  ,"<s:message code="bs.bsArManage.subpop.000011"/>"	// 보증금 
	                	  ,"<s:message code="bs.label.000293"/>"				// 과납상계금액       		
	                	  ,"Deposit Dscnt Amt" 									// 보증금차감금액                     
	                	  ,"Amt of insurance cover" 							// 보험처리금액                   
	                	  ,"Amount Of Loss"										// 손실처리금액                 
	                	  ,"Write Off Balance"  								//                                         
	                	  ,"<s:message code="bs.label.000295"/>"				// 보증금환불금       
	                	  ,"<s:message code="bs.label.000310"/>"//보증금잔고    dpstBlnc   
	                	  ,"Termination Req. Date"								// 해지요청일자                
	                	  
	                 ];
	var writeOffListMngColMd=[
                           {name:"entrNo"			, width:"100px"		,align:"left"}		
                          ,{name:"serviceID"		, width:"80px"		,align:"left"}		
                          ,{name:"custNm"			, width:"150px"		,align:"left"}		
                          ,{name:"svcNm"			, width:"100px"		,align:"left"}		
                          ,{name:"entrSttsNm"		, width:"170px"					  }		
                          ,{name:"wrtoffMgmtDvCd" 	, hidden: true}
                          ,{name:"wrtoffMgmtDvCdNm" }
                          ,{name:"opaidAmt"			, width:"100px"		,align:"right", formatter:bsGridComma}
                          
                          ,{name:"upaidAmt"			, width:"100px"		,align:"right", formatter:bsGridComma}
                          ,{name:"dpstAmt"			, width:"100px"		,align:"right", formatter:bsGridComma}
                          ,{name:"opaidOfstAmt"		, width:"150px"		,align:"right", formatter:bsGridComma}
                          ,{name:"dpstDdctAmt"		, width:"120px"		,align:"right", formatter:bsGridComma}
                          ,{name:"insrPrssAmt"		, width:"100px"		,align:"right", formatter:bsGridComma}
                          ,{name:"lssPrssAmt"		, width:"100px"		,align:"right", formatter:bsGridComma}
                          ,{name:"wrtoffBlnc"		, width:"120px"		,align:"right", formatter:bsGridComma}
                          ,{name:"dpstRfndAmt"		, width:"100px"		,align:"right", formatter:bsGridComma}
                          ,{name:"dpstBlnc"			, width:"100px"		,align:"right", formatter:bsGridComma}
                          ,{name:"expryReqstDt"		, width:"150px"		,align:"right", formatter:bsGridComma}
                          

	                 ];
	
	
	writeOffListMngGrid.jqGrid({
		datatype : "local",
		colNames:writeOffListMngColNm,
		colModel:writeOffListMngColMd,
		shrinkToFit: false,
		width:  '1176',
		height: '340', 
		onSelectRow : function(rowId, iRow, iCol, e) {
			
						
			/* $("#writeOffListMngSaveForm [name=entrNo]").removeAttr('readonly');
   			$("#writeOffListMngSaveForm [name=entrNo]").removeClass().addClass("form_normal01"); */
    			
   			$("#writeOffListMngSaveForm [name=entrNo]").attr('readonly', true);
   			$("#writeOffListMngSaveForm [name=entrNo]").removeClass().addClass("form_readonly");
			
			jQuery(this).jqGrid('GridToForm', rowId, "#writeOffListMngSaveForm");
			$("#writeOffListMngSaveFormDivision").val("MOD");
		}
		//multiselect: true,		
	});
	
					
	//var mydata = [{"0":"0","1":"Active","2":"10,000","3":"300,000","4":"200,000","5":"10,000","6":"200,000","7":"0","8":"80,000","9":"20,000","10":"2012-12-01","11":"Terminate","12":"","prgrssStts":"Finish","entrNo":"106","prodNo":"8600-0340","custNm":"Tom","svcCd":"Mobile","keyId":"1"}]
//	gf_addGridList("#writeOffListMngGrid",mydata);
	var cmmnCd = '${cmmnCd}';
	
	//gf_console.log("공통코드");
	//gf_console.log(cmmnCd);
	
	if(cmmnCd != ""){
		
		$("#writeOffListMngDiv").val('${cmmnCd}');
	}
	
	
	$("#writeOffListMngReset").click(function(){
		$("#writeOffListMngSaveForm").each(function(){ this.reset(); });
		$("#writeOffListMngSaveForm [name=entrNo]").removeAttr('readonly');
		$("#writeOffListMngSaveForm [name=entrNo]").removeClass().addClass("form_normal01");
	});
	
	
	$("#writeOffListMngSearchBtn").click(function(){
		
		if($("#writeOffListMngWorkYymm").val() == "") {
			MessageBox.dialog("Work YYMM is required");
			return false;
		}
		
		bsPagingInit("writeOffListMngPagingForm", "writeOffListMngGrid");
		
		writeOffListMngSearching();
	});
	
	
	$("#writeOffListMngNavi").click(function(){
		if(isAvailablePaging("writeOffListMngPagingForm") == false) {
			return false;
		}
		writeOffListMngSearching();
	});
	
	
	function writeOffListMngSearching(){
		$.ajax({
			type : "POST",  
			async: false,
			url  : baseUrl + "bsar/writeOffManage/getWriteOffListMng",
			data : $("#writeOffListMngSearchForm").serialize()+"&"+$("#writeOffListMngPagingForm").serialize(),
			dataType:"json",
			success : function(data) {
				
				if(data.writeOffListMng.length > 0) {
					
					var writeOffListMngGridRows  = $("#writeOffListMngGrid").getDataIDs().length;
					
					for(var i = 0; i < data.writeOffListMng.length; i++)
				 		jQuery("#writeOffListMngGrid").jqGrid('addRowData', ++writeOffListMngGridRows, data.writeOffListMng[i]);
					
					
					$("#writeOffListMngPagingForm").find("[name=page]").val(data.pagination.currentPage+1);
					$("#writeOffListMngPagingForm").find("[id=totalCnt]").text(data.pagination.objectsCount );
					$("#writeOffListMngPagingForm").find("[id=currentCnt]").text($("#writeOffListMngGrid").getDataIDs().length);
				} else {
					MessageBox.dialog("No results found.");
				}
			},
			error:function(data){
				MessageBox.error(data, "err.500");
			}
		});	
	}
	
	
	$("#inActiveReqToOcs").click(function(){
		
		var workYymm = $("#writeOffListMngSearchForm [name=workYymm]").val();
		
		if(workYymm == "") {
			MessageBox.dialog("Work YYYMM is required");
			return false;
		}
		
		MessageBox.confirm("Do you want to request ?", function(){
			
			$.ajax({
				type : "POST",  
				async: false,
				url  : baseUrl + "bsar/writeOffManage/inactiveReq",
				data : {workYymm : workYymm},
				dataType:"json",
				success : function(data) {
					MessageBox.dialog(data.message);			
				},
				error:function(data){
					MessageBox.error(data.status);
				}
			});	
			
		});
		
	});
	
	$("#writeOffListMngSave").click(function(){
		
		var workYymm = $("#writeOffListMngSearchForm [name=workYymm]").val();
		var entrNo = $("#writeOffListMngSaveForm [name=entrNo]").val();
		
		if(workYymm == "") {
			MessageBox.dialog("Work YYYMM is required");
			return false;
		}
		
		if(entrNo == "") {
			MessageBox.dialog("Subscriber ID is required");
			return false;
		}
		var wrtoffMgmtDvCd = $("#writeOffListMngSaveForm [name=wrtoffMgmtDvCd]").val();
		if( wrtoffMgmtDvCd == "") {
			MessageBox.dialog("Please Choose a Manage Division");
			return false;
		}
		
		//temporary or reservation or close 고객은 저장할수 없음.
		var entrSttsCd = $("#writeOffListMngSaveForm [name=entrSttsCd]").val();
		if(entrSttsCd == "T" || entrSttsCd == "R") {
			MessageBox.dialog("Temporary or Reservation Subscriber");
			return;
		} else if (entrSttsCd == "C") {
			MessageBox.dialog("Subscriber already been cancel.");
			return;
		}
		
		
		var division =  $("#writeOffListMngSaveFormDivision").val();
		var wrtoffMgmtDvCd = $("#writeOffListMngSaveForm [name=wrtoffMgmtDvCd]").val();
		if(division == "") {
			MessageBox.dialog("Please choose a value");
			return false;
		}
		
		if(division == "NEW" && wrtoffMgmtDvCd != 2 ) {
			MessageBox.dialog("Only allow User Addition");
			return false;	
		} else if(division == "MOD" && wrtoffMgmtDvCd == 4 ) {   // 1.시스템생성 2.사용자 추가 3. 사용자제외 4. 일시정지제외
			// 일시정지제외는 배치가 생성한 후로 작업자가 수정할수 없음.
			MessageBox.dialog("Can not modify to Suspension Exclusion");			
			return false;	
		}
		
		var svcNm      = $("#writeOffListMngSaveForm [name=svcNm]").val();
		var custNm     = $("#writeOffListMngSaveForm [name=custNm]").val();
		var entrSttsNm = $("#writeOffListMngSaveForm [name=entrSttsNm]").val();
		
		if(svcNm == "" || custNm == "" || entrSttsNm == "") {
			MessageBox.dialog("Subscriber ID is invalid");
			return false;			
		}
		
		
		$.ajax({
			type : "POST",  
			async: false,
			url  : baseUrl + "bsar/writeOffManage/saveWriteOffListMng",
			data :{   entrNo : entrNo
					, workYymm : workYymm
					, wrtoffMgmtDvCd : wrtoffMgmtDvCd
				    , division : division				// NEW or MOD
			},
			dataType:"json",
			success : function(data) {
				
				MessageBox.dialog(data.message);
				
			 	if(data.resultCode == "SUCCESS") {
			 		$("#writeOffListMngSearchBtn").click();
			 	}
			},
			error:function(data){
				MessageBox.error(data, "err.500");
			}
		});	
		
	});
	
	
	//하단 저장폼에 가입번호 입력 후 포커스가 이동시 가입자가 있는지 조회
	$("#writeOffListMngSaveForm [name=entrNo]").blur(function() {
		var thisValue = $(this).val();
		$(this).val($.trim(thisValue));
		if ( $(this).is('[readonly]') || $(this).val() == "" ) {
			//readonly는 상단에서 내려온 값이므로 유효성 조회를 하지 않는다.
			return false;
		}
		
/* 		if($(this).val() == "") {
			return false;
		}
		
		var input = $(this).val();
	    if (/^\d*\.?\d{0,1}$/.test(input)) {
	        var amount = parseFloat(input);
	       MessageBox.dialog("valid::"+amount);
	    } else {
	        MessageBox.dialog("invalid::" + input);
	    }
	     */
		
		var entrNoBeforeDel = $("#writeOffListMngSaveForm [name=entrNo]").val();
		
		$("#writeOffListMngSaveForm").each(function(){ this.reset(); });
		
		$.ajax({
			type : "POST",  
			async: false,
			url  : baseUrl + "bsar/writeOffManage/findWroffTrgtSubInfo",
			data :{entrNo : entrNoBeforeDel },
			dataType:"json",
			success : function(data) {
				
				if(jQuery.isEmptyObject(data)) {
					MessageBox.dialog("Not found Subscriber ID");
					return false;
				} 
																
			 	$.each(data || [], function(key, value) { 
					$("#writeOffListMngSaveForm [name=" + key+"]").val(value);
				});		
			 	
			 	$("#writeOffListMngSaveFormDivision").val("NEW");
			 	$("#writeOffListMngSaveForm [name=entrNo]").val(entrNoBeforeDel);
			},
			error:function(data){
				MessageBox.error(data, "err.500");
				$("#writeOffListMngSaveForm [name=entrNo]").val(entrNoBeforeDel);
			}
		});	
		
	});
	
	
});



</script>
<div class="contents_box">
	<!-- 컨텐츠를 감싸는 박스 //-->
	<div class="contents_box">
	
		<!-- 검색조건이 두줄일 경우 //-->
		<div class="search_box_01">
			<form id="writeOffListMngSearchForm" >
				<table class="table_test">
					<tr>
						<td><s:message code="bs.label.000134"/><!-- 작업연월 --></td>
						<td>
							<input type="text" class="form_calendar01" style="width:80px;" id="writeOffListMngWorkYymm" name="workYymm" value="${workYymm}">
						</td>
						<td>Manage Division<!-- 작업구분 --></td>
						<td colspan="3">
							<select name="wrtoffMgmtDvCd" class="form_select01">
								<option value="ALL">All</option>
								<code:out codeType="WrtoffMgmtDvCd" value="${lang}" option="listbox"/>
							</select>
						</td>
					</tr>
					<tr>	
						<td><s:message code="bs.bsArManage.grid.000001"/><!-- 서비스 --></td>
						<td>
							<select id="writeOffListMngSvc" name="svcDomain" class="form_select01">
								<option value="ALL">All</option>
								<code:out codeType="SvcDomain" option="listbox"/>	
							</select>
						</td>
						<td><s:message code="bs.label.000290"/><!-- 대상구분 --></td>
						<td>
							<select id="writeOffListMngTrgtDiv" name="trgtDvCd" class="form_select01">
								<c:forEach var="list" items="${trgtDvCd}" varStatus="status">
									<option value="${list.cmmnCd}">${list.cmmnCdnm}</option>
								</c:forEach>																			
							</select>
						</td>
						<th class="s_btn">
							<img src="<s:url value="/resources/images/common/line_01.gif"/>" />
							<span class="btns7 save"><input type="button" id="writeOffListMngSearchBtn" value="<s:message code="ar.ar22.label.000001"/>"/></span>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="title" style="margin: 5px 0px 0px 0px;">
		<form id="writeOffListMngPagingForm">
			<ul class="btn_listtop f_right">
				<li class="page"><span class="text" id="currentCnt"></span> / <span class="text" id="totalCnt"></span></li>
				<li><a href="#" id="writeOffListMngNavi"><img src="<s:url value="/resources/images/btn/btn_page.gif"/>" /></a></li>
			</ul>
			<input type="hidden" name="page" value="0">
		</form>
	</div>
	
</div>
<div class="mt_10">
		<table id="writeOffListMngGrid"></table>
</div>
	<form id="writeOffListMngSaveForm" class="mt_10">
		<table class="table_view01" style="width: 100%;" border="1" >
			<colgroup>
				<col width="12%" /><col width="16%" /><col width="12%" /><col width="16%" /><col width="12%" /><col width="16%" />
			</colgroup>
			<tr>
				<th>Subscriber ID</th>
				<td>
					<input type="hidden"  id="writeOffListMngSaveFormDivision">
					<input type="text" class="form_normal01" name="entrNo">
				
				</td>
			
				<th>Service ID</th>
				<td>
					<input type="text" class="form_readonly" readonly="readonly"  name="svcNm" />
				</td>
			<%-- 	<th >Valid End Date</th>
				<td>
					<input type="text" class="form_normal01" style="width: 85px; height:16px; background:#fff;" 
					 id="prodValdEndDt1" name="valdEndDt" value="${minDate}"/>
				</td> --%>
			
				<th>Subscriber Name</th>
				<td>
					<input type="text" class="form_readonly" readonly="readonly"  style="width: 100%;" name="custNm" />
				</td>
			</tr>
			<tr>
				<th>Subscription Status</th>
				<td>
					<input type="hidden" name="entrSttsCd">
					<input type="text" class="form_readonly" readonly="readonly" name="entrSttsNm" />
				</td>
				<th>Manage Division</th>
				<td colspan="3">
					<select name="wrtoffMgmtDvCd" class="form_select01">
						<option value="">Choose</option>
						<code:out codeType="WrtoffMgmtDvCd" value="${lang}" option="listbox"/>
					</select>
				</td>
			</tr>
		</table>
	</form>	

<div class="mt_10" >
	<span class="btns9 save f_left" ><input type="button" id="inActiveReqToOcs" value="Inactive Request to OCS"/></span>
	
	<span class="btns7 save ml_15 f_right" ><input type="button" id="writeOffListMngClose"  value="<s:message code="bs.bsArManage.subpop.000037"/>"/></span>
	<span class="btns9 save ml_15 f_right"><input type="button" id="writeOffListMngSave" value="Save"/></span>
	<span class="btns9 save f_right"><input type="button" id="writeOffListMngReset" value="Reset"/></span>
</div>
