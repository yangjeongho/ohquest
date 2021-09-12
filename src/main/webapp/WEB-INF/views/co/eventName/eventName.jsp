<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>
<script type="text/javascript">


$(function(e){	
	
	 fInitLoad_first();
	 fInitLoad();
	 
	 
	 $("#eventNameForm #eventNameDeleteBtn").click(function(e){
		 e.preventDefault();
		 $("#eventNameMainDiv #contentsDivEventName  #manfInputForm  #mode").val("D");
		 $("#eventNameForm #eventNameSaveBtn").click();
	 });
	 
	 
	$("#eventNameForm #eventNameSaveBtn").click(function(e){
		e.preventDefault();
		
		var vControlId = $("#manfInputForm #controlId").val();
		var vControlNm = $("#manfInputForm #controlNm").val();
		
		if (vControlId == "" ) {
			$("#manfInputForm #controlId").focus();
			MessageBox.dialog('<s:message code="eventName.msg.000001"/>');
			
			return;
		}
		
		if (vControlNm == "" ) {
			$("#manfInputForm #controlNm").focus();
			MessageBox.dialog('<s:message code="eventName.msg.000002"/>');
			
			return;
		}
		
	
		var vUrl = baseUrl+"co/saveEventname";
		divMask("#eventNameMainDiv","Save...");
		
		$.ajax({
			type : "POST",  
			async: true,
			url: vUrl,
			data: $("#eventNameMainDiv #contentsDivEventName #manfInputForm").serialize(),
			dataType:"json",
			success : function(data) {
				gf_console.log("success ......." + JSON.stringify(data));
				
				MessageBox.dialog(data.resultCode);
				
				var mode = $("#eventNameMainDiv #contentsDivEventName  #manfInputForm  #mode").val();
				if (mode == "I") {
					$("#eventNameMainDiv #contentsDivEventName  #manfInputForm  #mode").val("U");
					fInitLoad();
				} else if (mode == "U") {
					fInitLoad();
				} else if (mode == "D") {
					fInitLoad_first();
					fInitLoad();
					$("#eventNameForm #eventNameClearBtn").click();
				}
				
				 
					
			},
			error:function(data){
				gf_console.log("success ......." + JSON.stringify(data));
				MessageBox.dialog(data.resultCode + ":: \n" +data.message);
			},
			complete:function(jqXHR, textStatus){
				gf_console.log("complete .......");
				divUnmask("#eventNameMainDiv");
			}
		});	
		
		
	});
	
	$("#eventNameForm #eventNameCloseBtn").click(function(e){
		e.preventDefault();
		Dialog.close('#${param.dialogName}');
	});
	
	$("#eventNameForm #eventNameClearBtn").click(function(e){
		e.preventDefault();
	
        
		$("#eventNameMainDiv #contentsDivEventName  #manfInputForm  #controlId").val("");
		$("#eventNameMainDiv #contentsDivEventName  #manfInputForm  #controlNm").val("");
		fInitLoad_first();
	});
	
	
	$("#eventNameSortBtn").click(function(){
		jQuery("#contentsDivEventName #manfGrid").jqGrid('searchGrid',
			{sopt:['cn','bw','eq','ne','lt','gt','ew']}
		);
	});	

	
});

function fInitLoad_first() {
	// 초기화 
	
	$("#eventNameMainDiv #contentsDivEventName #manfInputForm #mode").val("I");
	$("#eventNameMainDiv #contentsDivEventName  #manfInputForm #controlId").attr("readonly",false);

	$("#eventNameMainDiv #contentsDivEventName  #manfInputForm #controlId").removeClass("form_readonly");
	$("#eventNameMainDiv #contentsDivEventName  #manfInputForm #controlId").addClass("form_normal01");
}

function fInitLoad() {

	$("#contentsDivEventName #manfGrid").jqGrid("clearGridData", true);
	
	divMask("#eventNameMainDiv","Wait...");
	$.ajax({
		
		
		type : "POST",  
		async : true,
		url : baseUrl + "co/eventNameSearch",
		data : $("#eventNameSearchForm").serializeArray(),
		dataType : 'json',
		success : function(data) {
			if (data.list.length <=0 ) {
				MessageBox.dialog('<s:message code="cos.msg.none.data"/>');
			} else {
				gf_addMultiGridList("#contentsDivEventName #manfGrid", data.list);
			}
		}, error:function(data){
			MessageBox.dialog("err.500");
		}, complete:function(jqXHR, textStatus){
			divUnmask("#eventNameMainDiv");
		}
	});
}



$("#contentsDivEventName #manfGrid").jqGrid(
		{
			datatype : "local",
			height : 250,
			width : 770,
			colNames : [ 
									'<s:message code="eventName.label.controlid"/>',//
									'<s:message code="eventName.label.ControlNm"/>',//
 								  ], 
			colModel : [ 
				             		 { name : 'controlId',  	index : 'controlId', 	 		width : "500",   	sorttype : "string",		align:'left' }, 
						             { name : 'controlNm', 		index : 'controlNm',			width : "200", 		sorttype : "string",		align:'left' },
				       ],
		
	   	   	viewrecords: true,
	   	    autowidth: true,
	   	   	shrinkToFit: true,
		   	multiselect: false,
		   	hidegrid: false,
	   	   	caption: 'Controller Name',
	   		onSelectRow: function (id) {
	        	
	        	
	        	var rowData=$("#contentsDivEventName #manfGrid").getRowData(id);
	        	autoBinding("#eventNameMainDiv #contentsDivEventName #manfInputForm", rowData);
	        	$("#eventNameMainDiv #contentsDivEventName #manfInputForm #mode").val("U");
	        	
	        	$("#eventNameMainDiv #contentsDivEventName  #manfInputForm #controlId").attr("readonly",true);
    			$("#eventNameMainDiv #contentsDivEventName  #manfInputForm #controlId").removeClass("form_normal01");
    			$("#eventNameMainDiv #contentsDivEventName  #manfInputForm #controlId").addClass("form_readonly");
	    		
	        	
	        }
		});

</script>

<div id="eventNameMainDiv">
   <div  class="warp">

	    
	    <div id="contentsDivEventName" class="contents_box">
	    	<form id="manfInputForm" >	        
		    	<div class="title">
					<h1><s:message code="eventName.label.EventNameList"/></h1>
					
					<div class="f_right">
						<span class="btns3 save"><input type="button" value='<s:message code="cmn.btn.search"/>'  id="eventNameSortBtn"/></span>
					</div>
				</div>
				<table id="manfGrid"></table>
				
		    	<div class="title">
					<h1><s:message code="eventName.label.EventNameDetail"/></h1>
				</div>
				<input type="hidden" class="form_normal01" id="mode"  name="mode"  style="width:100%;" value="">
				<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
					<colgroup>
						<col width="10%" />
						<col width="90%" />
					</colgroup>
					<tr>
						<th class="key"><s:message code="or.user.dlgtAuth.elementTable.label.000"/></th>
						<td><input type="text" class="form_normal01" id="controlId"  name="controlId"  style="width:100%;" value=""></td>
					</tr>
					<tr>
						<th class="key"><s:message code="code.label.000068"/></th>
						<td><input type="text" class="form_normal01"  id="controlNm" name="controlNm"  style="width:100%;" value="" ></td>					
					</tr>
			    </table>
		   	</form>	    				
	    </div>
	    
	    <div id="buttonDivEventName"  class="contents_box">
			<form id="eventNameForm">
				<div class="contents_box mt_5">
					<div class="f_right">
						<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.reset"/>'  	id="eventNameClearBtn"/></span>
						<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.save"/>'  	id="eventNameSaveBtn"/></span>	
						<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.delete"/>' 	id="eventNameDeleteBtn"/></span>		
						<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.close"/>'  	id="eventNameCloseBtn"/></span>
					</div>
				</div>
			</form>	
		</div>
	</div>
</div>
</div>


