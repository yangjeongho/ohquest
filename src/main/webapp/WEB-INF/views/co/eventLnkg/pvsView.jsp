<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
//tab생성
common_tab("lnkgSlave");
//탭 선택 이벤트제어
$("#lnkgSlave").bind("tabsselect", function(e, tab) {
	if(tab.index == 0) {				//totalInfo(이력조회)
	}
	else if(tab.index == 1) {
	}
	
});

$(function(e){
	
	//그리드 초기화
	<%--ABA_CO_LNKG--%>
	$("#lnkgGrid").jqGrid({
		datatype : "local",
		height :100,
		width : 965,
		colNames : [ 
					'<s:message code="eventLnkg.label.lnkgSeqno"/>',							//
					'<s:message code="ccs.csCccs000.counselOrgOffers.lable.entrNo"/>',			//
					'<s:message code="eventLnkg.label.prodNo"/>',								//
					'<s:message code="cs.label.000124"/>',										//user ID
					'<s:message code="ccs.csCccs011.csCccs011ListTable.lable.OperatorId"/>',	//
					'<s:message code="ccs.ccsWork0004_20130326.workListGrid1.label.000001"/>',	//svcCd
					'<s:message code="eventLnkg.label.rsnCd"/>',								//
					'<s:message code="co.smscode.smscode.label.00002"/>',						//
					'<s:message code="vo.label.000051"/>',										//requestId
					'<s:message code="res.label.000044"/>',										//
					'<s:message code="eventLnkg.label.prssApplCd"/>',							//
					'<s:message code="eventLnkg.label.crteDttm"/>',								//
					'<s:message code="eventLnkg.label.aplyDttm"/>',								//
					'<s:message code="eventLnkg.label.userPw"/>',								//
					'<s:message code="eventLnkg.label.bfrProdNo"/>',							//
					'<s:message code="eventLnkg.label.bfrImsi"/>',								//
					'<s:message code="eventLnkg.label.meid"/>',									//
					'<s:message code="eventLnkg.label.bfrmeid"/>',								//
					'<s:message code="eventLnkg.label.simNo"/>',								//
					'<s:message code="eventLnkg.label.bfrSimNo"/>',								//
					'<s:message code="eventLnkg.label.voipPridUrl"/>',							//
					'<s:message code="eventLnkg.label.voipPridUrl"/>',							//
					'<s:message code="eventLnkg.label.pvSttsTime"/>',							//
					'<s:message code="eventLnkg.label.pvSttsCd"/>',								//
					], 
		colModel : [ 
					 { name : 'lnkgSeqno',   	index : 'lnkgSeqno',       width : "70",   sorttype : "string"},
		             { name : 'entrNo',   		index : 'entrNo',          width : "70",   sorttype : "string"}, 
		             { name : 'prodNo',   		index : 'prodNo',          width : "70",   sorttype : "string"},
		             { name : 'userId',   		index : 'userId',          width : "70",   sorttype : "string", hidden:true},
		             { name : 'operatorId',   	index : 'operatorId',      width : "70",   sorttype : "string", hidden:true},
		             { name : 'svcCd',   		index : 'svcCd',           width : "70",   sorttype : "string"},
		             { name : 'rsnCd',   		index : 'rsnCd',           width : "70",   sorttype : "string", hidden:true},
		             { name : 'eventCd',   		index : 'eventCd',         width : "70",   sorttype : "string"},
		             { name : 'requestId',   	index : 'requestId',       width : "70",   sorttype : "string"},
		             { name : 'imsi',   		index : 'imsi',            width : "70",   sorttype : "string"},
		             { name : 'prssApplCd',   	index : 'prssApplCd',      width : "70",   sorttype : "string"},
		             { name : 'crteDttm',   	index : 'crteDttm',        width : "70",   sorttype : "string"},
		             { name : 'aplyDttm',   	index : 'aplyDttm',        width : "70",   sorttype : "string"},
		             { name : 'userPw',   		index : 'userPw',          width : "70",   sorttype : "string"},
		             { name : 'bfrProdNo',   	index : 'bfrProdNo',       width : "70",   sorttype : "string"},
		             { name : 'bfrImsi',   		index : 'bfrImsi',         width : "70",   sorttype : "string"},
		             { name : 'meid',   		index : 'meid',            width : "70",   sorttype : "string"},
		             { name : 'bfrmeid',   		index : 'bfrmeid',         width : "70",   sorttype : "string"},
		             { name : 'simNo',   		index : 'simNo',           width : "70",   sorttype : "string"},
		             { name : 'bfrSimNo',   	index : 'bfrSimNo',        width : "70",   sorttype : "string"},
		             { name : 'voipPridUrl',   	index : 'voipPridUrl',     width : "70",   sorttype : "string"},
		             { name : 'voipPuidUrl',   	index : 'voipPuidUrl',     width : "70",   sorttype : "string"},
		             { name : 'pvSttsTime',   	index : 'pvSttsTime',      width : "70",   sorttype : "string"},
		             { name : 'pvSttsCd',   	index : 'pvSttsCd',        width : "70",   sorttype : "string"}
		           ],
	    
		multiselect : false,
   	   	viewrecords : true,
   	   	shrinkToFit : true,
        onSelectRow : function (id) {
        	var rowData=$("#lnkgGrid").getRowData(id);
        	callLnkgDtlGird(rowData.lnkgSeqno);
			callLnkgDevGird(rowData.lnkgSeqno);
			callLnkgSubGird(rowData.lnkgSeqno);
    	}
		});
	
	
		<%--ABA_LNKG_DTL--%>
		$("#lnkgDtlGrid").jqGrid({
			datatype : "local",
			height :100,
			width : 950,
			colNames : [ 
						'<s:message code="eventLnkg.label.lnkgSeqno"/>',//lnkgDtlSeqno
						'<s:message code="ccs.csCccs000.counselOrgOffers.lable.entrNo"/>',//
						'<s:message code="eventLnkg.label.prodNo"/>',//
						'<s:message code="cs.label.policy.000036"/>',//prodCd
						'<s:message code="eventLnkg.label.valdStrtDttm"/>',//
						'<s:message code="cos.label.PrssDvCd"/>',//
			            '<s:message code="ccs.csCccs011.csCccs011ListTable.lable.OperatorId"/>',//ftrCd',
			            '<s:message code="ccs.csCccs002.offerTable.lable.entrSvcSeqno"/>',//
			            '<s:message code="eventLnkg.label.dlUpdateStamp"/>',//
			            '<s:message code="ccs.ccsWork0004_20130326.workListGrid1.label.000001"/>',//svcCd			             'piType',
			            '<s:message code="eventLnkg.label.sysCreationDate"/>',//
			            '<s:message code="eventLnkg.label.dlServiceCode"/>',//
			            '<s:message code="eventLnkg.label.ftrValue"/>',//
			            '<s:message code="eventLnkg.label.workDvCd"/>',//
			            '<s:message code="eventLnkg.label.workChnlCd"/>',//
			            '<s:message code="eventLnkg.label.valdEndDttm"/>',//
			            '<s:message code="eventLnkg.label.sysUdpateDate"/>',//
			            '<s:message code="eventLnkg.label.ftrParam"/>',//
						], 
			colModel : [ 
						 { name : 'lnkgSeqno',   	index : 'lnkgSeqno',        width : "70",   sorttype : "string"},
						 { name : 'lnkgDtlSeqno',   index : 'lnkgDtlSeqno',     width : "70",   sorttype : "string"},
			             { name : 'entrNo',   		index : 'entrNo',          	width : "70",   sorttype : "string"}, 
			             { name : 'prodNo',   		index : 'prodNo',          	width : "70",   sorttype : "string"},
			             { name : 'prodCd',   		index : 'prodCd',          	width : "70",   sorttype : "string"},
			             { name : 'valdStrtDttm',   index : 'valdStrtDttm',     width : "70",   sorttype : "string"},
			             { name : 'prssDvCd',   	index : 'prssDvCd',         width : "70",   sorttype : "string"},
			             { name : 'operatorId',   	index : 'operatorId',       width : "70",   sorttype : "string"},
			             { name : 'ftrCd',   		index : 'ftrCd',          	width : "70",   sorttype : "string"},
			             { name : 'entrSvcSeqno',   index : 'entrSvcSeqno',     width : "70",   sorttype : "string"},
			             { name : 'dlUpdateStamp',  index : 'dlUpdateStamp',    width : "70",   sorttype : "string"},
			             { name : 'svcCd',   		index : 'svcCd',          	width : "70",   sorttype : "string"},
			             { name : 'piType',   		index : 'piType',          	width : "70",   sorttype : "string"},
			             { name : 'sysCreationDate',index : 'sysCreationDate',  width : "70",   sorttype : "string"},
			             { name : 'dlServiceCode',  index : 'dlServiceCode',    width : "70",   sorttype : "string"},
			             { name : 'ftrValue',   	index : 'ftrValue',         width : "70",   sorttype : "string"},
			             { name : 'workDvCd',   	index : 'workDvCd',         width : "70",   sorttype : "string"},
			             { name : 'workChnlCd',   	index : 'workChnlCd',       width : "70",   sorttype : "string"},
			             { name : 'valdEndDttm',   	index : 'valdEndDttm',      width : "70",   sorttype : "string"},
			             { name : 'sysUdpateDate',  index : 'sysUdpateDate',    width : "70",   sorttype : "string"},
			             { name : 'ftrParam',   	index : 'ftrParam',     	width : "70",   sorttype : "string"}
			           ],
		    
			multiselect : false,
	   	   	viewrecords : true,
	   	   	shrinkToFit : true,
	        onSelectRow : function (id) {
	    	}
	
			});
		
		<%--ABA_CO_LNKG_DEV--%>
		$("#lnkgDevGrid").jqGrid({
			datatype : "local",
			height :100,
			width : 950,
			colNames : [ 
						 '<s:message code="eventLnkg.label.lnkgSeqno"/>',//
						 '<s:message code="eventLnkg.label.devSeqno"/>',//
						 '<s:message code="ccs.csCccs000.counselOrgOffers.lable.entrNo"/>',		//prssDvCd',
						 '<s:message code="ccs.csCccs011.csCccs011ListTable.lable.OperatorId"/>',//dlUpdateStamp',
						 '<s:message code="eventLnkg.label.piType"/>',//
						 '<s:message code="eventLnkg.label.sysCreationDate"/>',//
						 '<s:message code="eventLnkg.label.dlServiceCode"/>',//
						 '<s:message code="eventLnkg.label.meid"/>',//
						 '<s:message code="eventLnkg.label.workDvCd"/>',//
						 '<s:message code="eventLnkg.label.workChnlCd"/>',//
						 '<s:message code="eventLnkg.label.modelId"/>',//
						 '<s:message code="eventLnkg.label.devType"/>',//
						 '<s:message code="eventLnkg.label.serial"/>',//
						 '<s:message code="eventLnkg.label.mac"/>',//
						 '<s:message code="eventLnkg.label.sysUdpateDate"/>',//
						 '<s:message code="eventLnkg.label.smcId"/>',//
						 '<s:message code="eventLnkg.label.cableId"/>',//
						], 
			colModel : [ 
						 { name : 'lnkgSeqno', 		index : 'lnkgSeqno',  		width : "70",   sorttype : "string"},
						 { name : 'devSeqno', 		index : 'devSeqno',  		width : "70",   sorttype : "string"},
			             { name : 'entrNo',   		index : 'entrNo',       	width : "70",   sorttype : "string"}, 
			             { name : 'prssDvCd', 		index : 'prssDvCd',  		width : "70",   sorttype : "string"},
			             { name : 'operatorId', 	index : 'operatorId',  		width : "70",   sorttype : "string", hidden:true},
			             { name : 'dlUpdateStamp',	index : 'dlUpdateStamp',  	width : "70",   sorttype : "string"},
			             { name : 'piType', 		index : 'piType',  			width : "70",   sorttype : "string"},
			             { name : 'sysCreationDate',index : 'sysCreationDate',  width : "70",   sorttype : "string"},
			             { name : 'dlServiceCode', 	index : 'dlServiceCode',  	width : "70",   sorttype : "string"},
			             { name : 'meid', 			index : 'meid',  			width : "70",   sorttype : "string"},
			             { name : 'workDvCd', 		index : 'workDvCd',  		width : "70",   sorttype : "string"},
			             { name : 'workChnlCd', 	index : 'workChnlCd',  		width : "70",   sorttype : "string"},
			             { name : 'modelId', 		index : 'modelId',  		width : "70",   sorttype : "string"},
			             { name : 'devType',   		index : 'devType',     		width : "70",   sorttype : "string"},
			             { name : 'serial', 		index : 'serial',  			width : "70",   sorttype : "string"},
			             { name : 'mac', 			index : 'mac',  			width : "70",   sorttype : "string"},
			             { name : 'sysUdpateDate', 	index : 'sysUdpateDate',  	width : "70",   sorttype : "string"},
			             { name : 'smcId', 			index : 'smcId',  			width : "70",   sorttype : "string"},
			             { name : 'cableId', 		index : 'cableId',  		width : "70",   sorttype : "string"}
			             
			           ],
		    
			multiselect : false,
	   	   	viewrecords : true,
	   	   	shrinkToFit : true,
	        onSelectRow : function (id) {
	    	}
	
			});
		
		<%--ABA_CO_LNKG_SUBSCRIBER--%>
		$("#lnkgSubGrid").jqGrid({
			datatype : "local",
			height :100,
			width : 950,
			colNames : [ 
						'<s:message code="eventLnkg.label.lnkgSeqno"/>',//
						'<s:message code="eventLnkg.label.lnkbSubsSeqno"/>',//
						'<s:message code="bs.bsArManage.grid.000045"/>',//
						'<s:message code="ccs.csCccs000.counselOrgOffers.lable.entrNo"/>',//
						'<s:message code="eventLnkg.label.prodNo"/>',//
						'<s:message code="cs.label.000124"/>',//
						'<s:message code="cos.label.PrssDvCd"/>',//
						'<s:message code="ccs.ccsWork0004_20130326.workListGrid1.label.000001"/>',//
						'<s:message code="res.label.000044"/>',//IMSI
						'<s:message code="eventLnkg.label.meid"/>',//
						'<s:message code="eventLnkg.label.pvSttsTime"/>',//
						'<s:message code="eventLnkg.label.pvSttsCd"/>',//
						'<s:message code="eventLnkg.label.workDvCd"/>',//
						'<s:message code="eventLnkg.label.workChnlCd"/>',//
						'<s:message code="eventLnkg.label.assignDate"/>',//
						'<s:message code="eventLnkg.label.releaseDate"/>',//
						'<s:message code="eventLnkg.label.subMac"/>',//
						'<s:message code="eventLnkg.label.gwSerial"/>',//
						'<s:message code="eventLnkg.label.gwDevId"/>',//
						'<s:message code="eventLnkg.label.bandWidth"/>',//
						'<s:message code="eventLnkg.label.quota"/>',//
						], 
			colModel : [ 
						 { name : 'lnkgSeqno',   	index : 'lnkgSeqno',        width : "70",   sorttype : "string"},
						 { name : 'lnkbSubsSeqno',  index : 'lnkbSubsSeqno',    width : "70",   sorttype : "string"},
			             { name : 'status',   		index : 'status',         	width : "70",   sorttype : "string"}, 
			             { name : 'entrNo',   		index : 'entrNo',         	width : "70",   sorttype : "string"},
			             { name : 'prodNo',   		index : 'prodNo',         	width : "70",   sorttype : "string"},
			             { name : 'userId',   		index : 'userId',        	width : "70",   sorttype : "string", hidden:true},
			             { name : 'prssDvCd',   	index : 'prssDvCd',        	width : "70",   sorttype : "string"},
			             { name : 'svcCd',   		index : 'svcCd',        	width : "70",   sorttype : "string"},
			             { name : 'imsi',   		index : 'imsi',        		width : "70",   sorttype : "string"},
			             { name : 'meid',   		index : 'meid',        		width : "70",   sorttype : "string"},
			             { name : 'pvSttsTime',   	index : 'pvSttsTime',       width : "70",   sorttype : "string"},
			             { name : 'pvSttsCd',   	index : 'pvSttsCd',        	width : "70",   sorttype : "string"},
			             { name : 'workDvCd',   	index : 'workDvCd',        	width : "70",   sorttype : "string"},
			             { name : 'workChnlCd',   	index : 'workChnlCd',       width : "70",   sorttype : "string"},
			             { name : 'assignDate',   	index : 'assignDate',       width : "70",   sorttype : "string"},
			             { name : 'releaseDate',   	index : 'releaseDate',      width : "70",   sorttype : "string"},
			             { name : 'subMac',   		index : 'subMac',       	width : "70",   sorttype : "string"},
			             { name : 'gwSerial',   	index : 'gwSerial',      	width : "70",   sorttype : "string"},
			             { name : 'gwDevId',   		index : 'gwDevId',     		width : "70",   sorttype : "string"},
			             { name : 'bandWidth',   	index : 'bandWidth',        width : "70",   sorttype : "string"},
			             { name : 'quota',   		index : 'quota',			width : "70",   sorttype : "string"}
			           ],
		    
			multiselect : false,
	   	   	viewrecords : true,
	   	   	shrinkToFit : true,
	        onSelectRow : function (id) {
	    	}
	
		});
		
		
		
		
		
		callLnkgGird();
		
});



$("#lnkgSearchForm #pvSttsCd").change(function(e){
	callLnkgGird();
});

function callLnkgGird(){
		gf_clearGridList("#lnkgGrid");
		var userId = "${userId}";
		var pvSttsCd = $("#lnkgSearchForm #pvSttsCd").val();
		$.ajax({
			type : "GET",  
			async : false,
			url : baseUrl + "co/evntLngk/lnkgGrid?userId="+userId+"&pvSttsCd="+pvSttsCd,
			dataType : 'json',
			data : '',
			dataType:"json",
			success : function(data) {
				gf_addMultiGridList("#lnkgGrid", data.list);
			},
			error:function(data){
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				
			}
			
		});
}

function callLnkgDtlGird(lnkgSeqno){
		gf_clearGridList("#lnkgDtlGrid");
		$.ajax({
			type : "GET",  
			async : false,
			url : baseUrl + "co/evntLngk/lnkgDtlGrid?lnkgSeqno="+lnkgSeqno,
			dataType : 'json',
			data : '',
			dataType:"json",
			success : function(data) {
				gf_addMultiGridList("#lnkgDtlGrid", data.list);
			},
			error:function(data){
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				
			}
			
		});
}

function callLnkgDevGird(lnkgSeqno){
		gf_clearGridList("#lnkgDevGrid");
		$.ajax({
			type : "GET",  
			async : false,
			url : baseUrl + "co/evntLngk/lnkgDevGrid?lnkgSeqno="+lnkgSeqno,
			dataType : 'json',
			data : '',
			dataType:"json",
			success : function(data) {
				gf_addMultiGridList("#lnkgDevGrid", data.list);
			},
			error:function(data){
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				
			}
			
		});
}

function callLnkgSubGird(lnkgSeqno){
		gf_clearGridList("#lnkgSubGrid");
		$.ajax({
			type : "GET",  
			async : false,
			url : baseUrl + "co/evntLngk/lnkgSubGrid?lnkgSeqno="+lnkgSeqno,
			dataType : 'json',
			data : '',
			dataType:"json",
			success : function(data) {
				gf_addMultiGridList("#lnkgSubGrid", data.list);
			},
			error:function(data){
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				
			}
			
		});
}


$("#subsViewClose").click(function(e){
	Dialog.close('#${param.dialogName}');
});




</script>

<!-- <div id="wrap_900" > -->
	<form id="lnkgSearchForm">
	<div class="search_box_01">
		<div class="f_left">
			<p>
				<s:message code="bs.bsArManage.grid.000045"/><!-- status -->
				&nbsp;
				<select id="pvSttsCd" name="pvSttsCd" class="form_select01" style="width:100px;">
					<option value="E"><s:message code="log4j.logger.org.apache.activemq"/></option>
					<option value=""><s:message code="ar.ar1.label.000017"/></option>
				</select>
			   	<!-- <input type="text" class="form_normal01" id="searchValue" style="width:200px;" /> -->
		   	</p>
		</div>
	</div>	
	</form>
	<div class="contents_box">
		<div style="width:965px;float:left">
			<div class="title">
				<h1><s:message code="eventLnkg.label.ABA_CO_LNKG"/></h1>
			</div>
			<table id="lnkgGrid"></table>
		</div>
	</div>
	<div class="contents_box">	
		<div class="contents_box mt_10" style="width:100%;" id="lnkgSlave">
			<ul class="tab_box">
				<li class="on" ><span id="dtlspan"><a href="#dtldiv"><s:message code="eventLnkg.ABA_CO_LNKG_DTL"/></a></span></li>
			    <li class="off"><span id="devspan"><a href="#devdiv"><s:message code="eventLnkg.ABA_CO_LNKG_DEV"/></a></span></li>
			    <li class="off"><span id="subspan"><a href="#subdiv"><s:message code="eventLnkg.ABA_CO_LNKG_SUBSCRIBER"/></a></span></li>
			</ul>
			<div class="f_left  mt_5" style="width:950px;float:left" id="dtldiv">
				<div class="title">
					<h1><s:message code="eventLnkg.label.ABA_CO_LNKG_DTL"/></h1>
				</div>
				<table id="lnkgDtlGrid"></table>
			</div>
			<div class="f_left  mt_5" style="width:950px;" id="devdiv">
				<div class="title">
					<h1><s:message code="eventLnkg.label.ABA_CO_LNKG_DEV"/></h1>
				</div>
				<table id="lnkgDevGrid"></table>
			</div>
			<div class="f_left  mt_5" style="width:950px;"id="subdiv">
				<div class="title">
					<h1><s:message code="eventLnkg.label.ABA_CO_LNKG_SUBSCRIBER"/></h1>
				</div>
				<table id="lnkgSubGrid"></table>
			</div>
		</div>
		<div class="f_right mt_5">
			<span class="btns7 save"><input id="showPreVision" type="button" value= '<s:message code="cmn.btn.preVision"/>' /></span>
			<span class="btns7 save"><input id="subsViewClose" type="button" value= '<s:message code="cmn.btn.close"/>'  /></span>
		</div>
	</div>
<!-- </div> -->
