<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">

$(function(e){
	
	//jqgrid
	$("#relsTypeList").jqGrid(
		{
			datatype : "local",
			width : 300,
			height : 150,
			colNames : [ '<s:message code="bqCode.label.000001"/>',//
			             '<s:message code="bqCode.label.000002"/>',//
			             '<s:message code="bqCode.label.000003"/>',//
			             '<s:message code="bqCode.label.000004"/>',//
						],
			colModel : [ { name : 'relsTpeNm', index : 'relsTpeNm', sorttype : "string", width:"280",align:"center"}, 
			             { name : 'relsType', index : 'relsType', sorttype : "string", align:"center", hidden:true},
			             { name : 'custType', index : 'custType', sorttype : "string", align:"center", hidden:true},
			             { name : 'relsCustType', index : 'relsCustType', sorttype : "string", align:"center", hidden:true}
			           ],
			multiselect : false,
			viewrecords : true,
			shrinkToFit : false,
// 			caption : "Policy Product List",
			onSelectRow : function(id) {
				var rowData = $('#relsTypeList').getRowData(id);
				clearForm();				
				$("#bpCode001Form #relsTpeNm").val(rowData.relsTpeNm);
				$("#bpCode001Form #custType").val(rowData.custType);
				$("#bpCode001Form #relsCustType").val(rowData.relsCustType);
				//수정값
				$("#bpCode001Form #relsType").val(rowData.relsType);
			}
		});
	
	// 폼초기화
	function clearForm(){
		$("#bpCode001Form #relsTpeNm").val("");
		$("#bpCode001Form #custType").val("1");
		$("#bpCode001Form #relsCustType").val("1");
	}
	
	// Relation Type 변경시 type List 불러오기
	$("#bpCode001Form #custRelsDvCd").change(function(e){
		e.preventDefault();
		if($(this).val()!=""){
			$(this).loadingDialog();
			divMask("#bpCode001MainDiv","Uploading...");
			$.ajax({
				type : "POST",  
				async : true,
				url : baseUrl + "co/bpCode/bpCode001RelTypList",
				data : $("#bpCode001Form").serialize(),
				dataType : 'json',
				success : function(data) {
					clearForm();
					gf_clearGridList("#relsTypeList");
					gf_addMultiGridList("#relsTypeList", data.list);
				},	error:function(data){
					//서버 비정상 동작시 구현
					MessageBox.dialog("err.500");
				}, complete:function(jqXHR, textStatus){
					$(this).hideLoading();
					divUnmask("#bpCode001MainDiv");
				}
			});	
		}
	});
	
	// 저장,수정
	$("#bpCode001Form #bpCode001SaveBtn").click(function(e){
		e.preventDefault();
		
		if($("#bpCode001Form #custRelsDvCd").val()==""){
			alert('<s:message code="bqCode.msg.000001"/>')
			$("#bpCode001Form #custRelsDvCd").focus();
			return;
		}
		if($("#bpCode001Form #relsTpeNm").val()==""){
			alert('<s:message code="bqCode.msg.000002"/>')
			$("#bpCode001Form #relsTpeNm").focus();
			return;
		}
		
		var relsType = {
							custRelsDvCd 	: $("#bpCode001Form #custRelsDvCd").val(),
							relsTpeNm		: $("#bpCode001Form #relsTpeNm").val(),
							custType		: $("#bpCode001Form #custType :selected").val(),
							relsCustType	: $("#bpCode001Form #relsCustType :selected").val(),
							relsType		: $("#bpCode001Form #relsType").val(),
						};
// 		alert(JSON.stringify(relsType));
		$(this).loadingDialog();
		divMask("#bpCode001MainDiv","Uploading...");
		$.ajax({
			type : "POST",  
			async : true,
			contentType: "application/json",
			url : baseUrl + "co/bpCode/bpCode001SaveRelTyp",
			data : JSON.stringify(relsType),
			dataType : 'json',
			success : function(data) {
				if(data.list.length>0){
					gf_clearGridList("#relsTypeList");
		 			$("#bpCode001Form #relsTpeNm").val("");
		 			$("#bpCode001Form #custType").val("1");
		 			$("#bpCode001Form #relsCustType").val("1");
					gf_addMultiGridList("#relsTypeList", data.list);
					alert('<s:message code="cs.msg.priceplan.0023"/>')
				}else{
					alert('<s:message code="cs.msg.cug.0001"/>')
				}
			},	error:function(data){
				//서버 비정상 동작시 구현
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
				$(this).hideLoading();
				divUnmask("#bpCode001MainDiv");
			}
		});	
	});
	
	//수정
	$("#bpCode001Form #bpCode001NewBtn").click(function(e){
		e.preventDefault();
		$("#bpCode001Form #relsTpeNm").focus();
		clearForm();
		$("#bpCode001Form #relsType").val("");
	});
	
	//닫기
	$("#bpCode001Form #bpCode001CloseBtn").click(function(e){
		e.preventDefault();
		Dialog.close('#${param.dialogName}');
	});
});
</script>
<div id = "bpCode001MainDiv">
<div style="width: 410px; border: 0px">
<form id="bpCode001Form" name="bpCode001Form">
	<div>
		<table class="table_view01 mt_5" style="width: 100%;">
			<colgroup>
				<col width="30%" />
				<col width="" />
			</colgroup>
			<tr>
				<th><s:message code="co.label.relationType"/></th>
				<td>
					<select id="custRelsDvCd" name="custRelsDvCd"  style="border: 1px solid;">
						<option value=""><s:message code="code.msg.choose"/></option>
						<code:out codeType="RelationType" option="listbox"/>
					</select>
				</td>
			</tr>
			<tr>
				<th><s:message code="co.label.typeList"/></th>
				<td>
					<table id="relsTypeList"></table>
				</td>
			</tr>
			</table>
			
			<div class="f_left">
				<div class="title">
					<h1><s:message code="bqCode.label.000005"/></h1>
				</div>
			</div>
			
			<table class="table_view01 mt_5" style="width: 100%;">
			<colgroup>
				<col width="25%" />
				<col width="" />
			</colgroup>
			<tr>
				<th><s:message code="co.label.relationName"/></th>
				<td>
					<input id="relsTpeNm" name="relsTpeNm" type="text" class="form_select01" style="width: 100%;">
				</td>
			</tr>
			<tr>
				<th><s:message code="co.label.parentType"/></th>
				<td>
					<select id="custType" name="custType">
						<code:out codeType="CustDvCd" option="listbox"/>
					</select>
				</td>
			</tr>
			<tr>
				<th><s:message code="co.label.relationType"/></th>
				<td>
					<select id="relsCustType" name="relsCustType">
						<code:out codeType="CustDvCd" option="listbox"/>
					</select>
				</td>
			</tr>
		</table>
	</div>
	<br/>
	<div class="contents_box mt_5">
		<div class="f_right">
			<span class="btns7 save"><input type="button" value="<s:message code="cmn.btn.new" />"  id="bpCode001NewBtn" /></span>
			<span class="btns7 save"><input type="button" value="<s:message code="cmn.btn.confirm" />"  id="bpCode001SaveBtn" /></span>
			<span class="btns7 save"><input type="button" value="<s:message code="cmn.btn.close" />"  id="bpCode001CloseBtn" /></span>
		</div>
	</div>
	
	<input type="hidden" id="relsType" name="relsType" value="" />
</form>
</div>
</div>