<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>
<script src="<s:url value="/resources/lib/jquery/ui/jquery.ui.datepicker.js"/>" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/lib/jquery/ui/themes/base/jquery.ui.datepicker.css"/>" />
<script src="<s:url value="/resources/lib/jquery/ui/jquery.ui.datepicker.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>

<script type="text/javascript">
$("#featureCodeList").css({cursor:'pointer'});
$("#featureCodeList")
.jqGrid(
		{
			datatype : "local",
			height : 350,
			width : 770,
			colNames : [ 
			             '<s:message code="code.label.000080"/>',//	 'Code'
			             '<s:message code="code.label.000081"/>',//, 'Kind Cd'
			             '<s:message code="code.label.000082"/>',//, 'Kind'
			             '<s:message code="code.label.000068"/>',//, 'Name'
			             '<s:message code="code.label.000083"/>',//, 'Unit Division Code'
			             '<s:message code="code.label.000084"/>',//, 'Code Detail'
			             '<s:message code="code.label.000085"/>',//, 'Suspend Y/N' 
			           ],
			colModel : [ {
				name : 'featureCode',
				index : 'featureCode',
				width : "100",
				sorttype : "string",
				align : "right"
			}, {
				name : 'featureKindDivisionCd',
				index : 'featureKindDivisionCd',
				width : "100",
				sorttype : "string",
				align : "right",
				hidden : true
			}, {
				name : 'featureKindDivision',
				index : 'featureKindDivision',
				width : "100",
				sorttype : "string",
				align : "right"
			}, {
				name : 'featureName',
				index : 'featureKind',
				width : "220",
				sorttype : "string",
				align : "right"
			}, {
				name : 'unitDivisionCode',
				index : 'unitDivisionCode',
				width : "100",
				sorttype : "string",
				align : "right"
			}, {
				name : 'featureCodeDetail',
				index : 'featureCodeDetail',
				width : "100",
				sorttype : "string",
				align : "right"
			}, {
				name : 'susInd',
				index : 'susInd',
				width : "100",
				sorttype : "string",
				align : "right"
			}

			],

			viewrecords : true,

			shrinkToFit : false,
			caption : 'Feature Code List',
			onSelectRow : function(id) {
				gf_clearGridList("#revenueList");
				var rowData = gf_getGridDataByRowId("#featureCodeList", id);
				$("#regFeatureCode #featureCode").val(rowData.featureCode).removeClass().addClass("form_readonly").attr("readonly",true);
				$("#regFeatureCode #featureKindDivision").val(rowData.featureKindDivisionCd).attr("disabled",true);
				$("#regFeatureCode #featureKindDivisionCd").val(rowData.featureKindDivisionCd)
				$("#regFeatureCode #featureName").val(rowData.featureName).removeClass().addClass("form_readonly").attr("readonly",true);
				$("#regFeatureCode #featureCodeDetail").val(rowData.featureCodeDetail).attr("disabled",true);
				$("#regFeatureCode #unitDivisionCode").val(rowData.unitDivisionCode).removeClass().addClass("form_readonly").attr("readonly",true);
				$("#regFeatureCode #susInd").val(rowData.susInd);
				$("#regFeatureCode #mode").val("Update");

				fillFeatureCodeList("featureCodeList");
//					revenueCodeGridAjaxCall("code/getRevenueCode/", {
//						featureCode : rowData['featureCode']
//					}, "revenueList")

			}
		});
		
	fillFeatureCodeList("featureCodeList");

	$("#featureCodeRegBtn").click(
			function(e) {
				e.preventDefault();

				featureCodeGridAjaxCall("code/regFeatureCode/en",
						"regFeatureCode", "featureCodeList");

			});
	
	$("#featureCodeRegNewBtn").click(function(e){
		e.preventDefault();
		
		$("#regFeatureCode #featureCode").val("").removeClass().addClass("form_normal01").attr("readonly",false);
		$("#regFeatureCode #featureKindDivision").val("").attr("disabled",false);
		$("#regFeatureCode #featureKindDivisionCd").val("");
		$("#regFeatureCode #featureName").val("").removeClass().addClass("form_normal01").attr("readonly",false);
		$("#regFeatureCode #featureCodeDetail").val("").attr("disabled",false);
		$("#regFeatureCode #unitDivisionCode").val("").removeClass().addClass("form_normal01").attr("readonly",false);
		$("#regFeatureCode #susInd").val("Y");
		$("#regFeatureCode #mode").val("Insert");
	});

	function fillFeatureCodeList(table) {
		$.ajax({
			type : "GET",
			async : false,
			url : baseUrl + "code/ftrcode/{language}",
			dataType : 'json',
			success : function(data) {
				gf_clearGridList("#featureCodeList");
				gf_addMultiGridList("#featureCodeList", data.featureCodeList);
// 				var orUserTableRow = $("#" + table).getDataIDs();
// 				for ( var i = 0; i < data.featureCodeList.length; i++) {
// 					orUserTableRow = orUserTableRow + 1;
// 					$("#" + table).jqGrid('addRowData', orUserTableRow + 1,
// 							data.featureCodeList[i]);
// 				}

			},
			error : function(data) {
				//서버 비정상 동작시 구현
				MessageBox.dialog("err.500");
			},
			complete : function(jqXHR, textStatus) {
				//MessageBox.dialog("complete:function Saved!" + textStatus);
			}
		});
	}

	function featureCodeGridAjaxCall(curl, form, table) {
		$.ajax({
			type : "POST",
			async : false,
			url : curl,
			dataType : 'json',
			data : $("#" + form).serialize(),
			success : function(data) {
				gf_console.log(JSON.stringify(data.object));
				if (data.resultCode == "SUCCESS") {
// 					var orUserTableRow = $("#" + table).getDataIDs();
// 					for ( var i = 0; i < data.object.length; i++) {
// 						orUserTableRow = orUserTableRow + 1;
// 						$("#" + table).jqGrid('addRowData', orUserTableRow + 1,
// 								data.object[i]);
//
// 					}
					MessageBox.dialog('<s:message code="cmn.msg.saved"/>');
				}
			},
			error : function(data) {
				//서버 비정상 동작시 구현
				MessageBox.dialog('<s:message code="cs.msg.cug.0001"/>');
			},
			complete : function(jqXHR, textStatus) {
				//MessageBox.dialog("complete:function Saved!" + textStatus);
			}
		});
	}
</script>
<div class="contents_box">
	<table>
		<tr>
			<td>
				<table id="featureCodeList">
				</table>
			</td>
		</tr>
	</table>
</div>

<div class="contents_box">
	<form id="regFeatureCode">
		<table width="100%;" cellpadding="0" cellspacing="0" border="1" class="table_view01 mt_5">
			<colgroup>
				<col width="20%"/>
				<col width=""/>
				<col width="20%"/>
				<col width=""/>
			</colgroup>
			<tr>
				<th><s:message code="prm.label.000087"/></th>
				<td><input type="text" class="form_normal01" style="width: 100%;" id="featureCode" name="featureCode" maxlength="20" /></td>
				<th><s:message code="prm.label.000025"/></th>
				<td><input type="text" class="form_normal01" style="width: 100%;" id="featureName" name="featureName" /></td>
			</tr>
			<tr>
				<th><s:message code="co.label.featureCodeKind"/></th>
				<td>
					<select style="width: 100%;" id="featureKindDivision" name="featureKindDivision" class="form_select01">
						<code:out codeType="FtrKdCd" value="" option="listbox" />
					</select>
				</td>
				<th><s:message code="pdh.label.000006"/></th>
				<td>
					<select style="width: 100%;" id="featureCodeDetail" name="featureCodeDetail" maxlength="10" class="form_select01">
						<code:out codeType="FtrKdDtlCd" option="listbox"></code:out>
					</select>
				</td>
			</tr>
			<tr>
				<th><s:message code="code.label.000083"/></th>
				<td><input type="text" class="form_normal01" style="width: 100%; height: 16px" id="unitDivisionCode" name="unitDivisionCode" /></td>
				<th><s:message code="code.label.000085"/></th>
				<td>
					<select id="susInd" name="susInd" class="form_select01">
						<option value="Y"><s:message code="cs.lable.cug.000041"/></option>
						<option value="N"><s:message code="cs.lable.cug.000042"/></option>
					</select>
				</td>
			</tr>
		</table>
		<input type="hidden" id="featureKindDivisionCd" name="featureKindDivisionCd" value="" />
		<input type="hidden" id="mode" name="mode" value="Insert" />
	</form>
</div>
<div class="contents_box" style="margin-top: 10px; margin-right: " align="right">
	<span class="btns7 save"> <input type="button" id="featureCodeRegNewBtn" name="featureCodeRegNewBtn" value= '<s:message code="cmn.btn.new"/>'  /></span>
	<span class="btns7 save"> <input type="button" id="featureCodeRegBtn" name="featureCodeRegBtn" value='<s:message code="cmn.btn.reg"/>' /></span>
</div>



