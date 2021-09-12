<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
//조회/페이지 이동시 처리
$("[class^=paging]").click(function(e){
	e.preventDefault();
	var pageUrl = $(this).attr('href')+"&callBackCoverage=${param.callBackCoverage}&dialogName=${param.dialogName}" ;
	
	if($(this).attr('class') == 'now'){
		return ;
	}
	
	$.ajax({
		type : "GET",  
		async : true,
		url : pageUrl,
		dataType : 'html',
		data : $("#searchCForm").serializeArray(),
		success : function(data) {
			$("#coverageSearchList").hide().empty().append(data).show();
		},
		error:function(data){
			alert('<s:message code="cos.msg.server"/>');
		},
		complete:function(jqXHR, textStatus){
			
		}
	});
});
$(function(e){
	$('[id^=instStartDttm]').datepicker({showAnim: "fold", dateFormat: "yy/mm/dd",  changeMonth: true,
        changeYear: true,  showOtherMonths: true,showButtonPanel: true,
        selectOtherMonths: true});
	/* $("[id=instStartDttm]").click(function(e){	
		e.preventDefault();
		//alert($(this).parent().find('[id=instStartDttm]').val());
		$(this).datepicker({showAnim: "fold", dateFormat: "yy/mm/dd"}); 
	}); */
	$("#resetInstStartDttm").click(function(e){
		e.preventDefault();
		$("#instStartDttm").val("");
		
	});
	$("[id=focusInstStartDttm]").click(function(e){
		e.preventDefault();
		$(this).parent().parent().find('[id^=instStartDttm]').focus();
	});
	
	$("#insertCoverage").click(function(e){	
		e.preventDefault();
		$("#view").hide();
		$("#noView").hide();
		$("#insertForm1").show();	
		$("#registCoverageForm1").show();	
		$("#registCForm1").show();	
		
	});
	
	$("[id=selectCoverage]").click(function(e){
		e.preventDefault();
		
		$("#detailCoverageSearch").show();
		$("#detailCoverageSearch2").show();
		
		var inputObj =$(this).parent().parent().parent() ;
		$("#coverageAddressFullName").val($(inputObj).find('[id=addressFullName1]').val());
		$("#coverageAddNum").val($(inputObj).find('[id=addNum1]').val());
	});
	
	$("#selectCoverageBtn").click(function(e){
 		e.preventDefault();
		if ($("#coverageSubAddress").val()==''){
			alert('<s:message code="address.msg.000004"/>');
			return;
		}
		var jsonData = {
				addressFullName : $("#coverageAddressFullName").val(),
				addNum: $("#coverageAddNum").val(),
				subAddress: $("#coverageSubAddress").val(),					
				address: $("#coverageAddressFullName").val() +" " + $("#coverageSubAddress").val()  ,					
		};
		if(eval("window.${param.callBackCoverage}") != null){
			var funcName = eval("${param.callBackCoverage}");
			funcName(jsonData);
		}
		Dialog.close('#${param.dialogName}'); 
	});
	
	$("#closeCoverageBtn").click(function(e){
		var jsonData = {
				addressFullName : "",
				addNum: "",
				subAddress: "",					
				address: "" ,					
		};
		if(eval("window.${param.callBackCoverage}") != null){
			var funcName = eval("${param.callBackCoverage}");
			funcName(jsonData);
		}
		Dialog.close('#${param.dialogName}'); 
	});
	
	
	$("#saveCoverageBtn1").click(function(e){
		e.preventDefault();
		var mode =  $(this).attr("mode");
		var addNum = $("#addNum").val();
		if(submitToAdd()){			
			MessageBox.confirm('<s:message code="coverage.msg.000001"/>', function(){
				$.ajax({
					type : "GET",  
					async : false,
					url : baseUrl + "coverage/check/"+addNum,
					dataType : 'json',
					data : "",
					success : function(data) {
						if(data.RESULT == "SUCCESS"){
							
							if (data.COUNT == 0 ){
								registCoverage1(mode);
							}else{
								alert('<s:message code="address.msg.000011"/>');
							}
						}else{
							alert('<s:message code="address.msg.000012"/>');
							//errorMessage(data.MESSAGE);
						}
					},
					error:function(data){
						alert('<s:message code="cos.msg.server"/>');
					},
					complete:function(jqXHR, textStatus){
						
					}
				});
			},function(){
				return false ;
			});
		}		
	});
	
	function registCoverage1(mode){
		
		$.ajax({
			type : "POST",  
			async : true,
			url : baseUrl + "coverage/process/"+mode,
			dataType : 'json',
			data : $("#registCoverageForm1").find(":input").serialize(),
			success : function(data) {
				if(data.RESULT == "SUCCESS"){
					alert('<s:message code="address.msg.000013"/>');
				}else{
					alert('<s:message code="coverage.msg.000007"/>');
					//errorMessage(data.MESSAGE);
				}
			},
			error:function(data){
				alert('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				
			}
		});
	}
	
	$("[id=deleteCoverage]").click(function(e){		
		var mode = $(this).attr("mode");
		var addNum = $(this).parent().parent().parent().parent().find('[id=addNum]').val();
		var coverageSeqno = $(this).parent().parent().parent().parent().find('[id=coverageSeqno]').val();			
		
		MessageBox.confirm('<s:message code="coverage.msg.000002"/>', function(){
			//$(this).parent().parent().parent().parent().remove();
			$.ajax({
				type : "POST",  
				async : true,
				url : baseUrl + "coverage/process/"+mode,
				dataType : 'json',
				//data : {"addSeqno": addSeqno, "addNum": addNum},
				data : {"addNum": addNum, "coverageSeqno" : coverageSeqno},
				success : function(data) {
					if(data.RESULT == "SUCCESS"){
						alert('<s:message code="address.msg.000015"/>');
						searchCoverage();
					}else{
						alert('<s:message code="coverage.msg.000004"/>');
						//errorMessage(data.MESSAGE);
					}
				},
				error:function(data){
					alert('<s:message code="cos.msg.server"/>');
				},
				complete:function(jqXHR, textStatus){
					
				}
			});
		},function(){
			return false ;
		});		
	});
	
	function searchCoverage(){
		$.ajax({
			type : "GET",  
			async : false,
			url : baseUrl + "coverage/search?page=${pagination.currentPage}&callBackCoverage=${param.callBackCoverage}&coverageMode=${param.coverageMode}",
			dataType : 'html',
			data : $("#searchCForm").serializeArray(),
			success : function(data) {
				$("#coverageSearchList").hide().empty().append(data).show();
			},
			error:function(data){
				alert('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				
			}
		});
	}
	
	$("[id=updateCoverage]").click(function(e){		
		var mode = $(this).attr("mode");
		var addNum = $(this).parent().parent().parent().parent().find('[id=addNum]').val();
		var coverageSeqno = $(this).parent().parent().parent().parent().find('[id=coverageSeqno]').val();
		var appInd = "Y";//$(this).parent().parent().parent().parent().find('[id=appInd]').val();		
		var instStartDttm = $(this).parent().parent().parent().parent().find('[name^=instStartDttm]').val();
		if ( $(this).parent().parent().parent().parent().find('[name^=appInd]')[1].checked){
			appInd = "N";
		}
		
		MessageBox.confirm('<s:message code="coverage.msg.000003"/>', function(){
			$.ajax({
				type : "POST",  
				async : true,
				url : baseUrl + "coverage/process/"+mode,
				dataType : 'json',
				data : {"addNum": addNum, "coverageSeqno": coverageSeqno, "instStartDttm": instStartDttm, "appInd": appInd},
				success : function(data) {
					if(data.RESULT == "SUCCESS"){
						alert('<s:message code="coverage.msg.000006"/>');
					}else{
						alert('<s:message code="coverage.msg.000005"/>');
						//errorMessage(data.MESSAGE);
					}
				},
				error:function(data){
					alert('<s:message code="cos.msg.server"/>');
				},
				complete:function(jqXHR, textStatus){
					
				}
			});
		},function(){
			return false ;
		});
	});
	
	function submitToAdd(){
		var ret = true;
		$("[required=required2]").each(function(e){
			if($(this).val() == ""){
				alert($(this).attr('title')+"은(는) 필수항목입니다.");
				$(this).focus();
				ret = false ;
				return false;
			}
		});
		return ret;
	}
	
	$("#searchAddressBtn").click(function(e){
		
		e.preventDefault();
		Dialog.open({
			div : '#searchAddressDialog', 
			url : baseUrl+"common/address/search?callBack=getCustomerAddress&coverageMode=${coverageMode}",
			title : '<s:message code="cos.title.000008"/>', 
			width : 900, 
			height : 700, 
			modal : true
		});	
	});
	
});
</script>
		   
<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_list01 mt_5" id="insertForm">
	<c:choose>
    <c:when test="${coverageMode eq 'SELECT'}">  
	<colgroup>
		<col width="" /><col width="15%" /><col width="11%" /><col width="20%" />
	</colgroup>
	 <tr>
		<th><s:message code="ar.ar22.label.000010"/></th>
		<th><s:message code="co.label.instStartDttm"/></th>
		<th><s:message code="co.label.appInd"/></th>		
		<th><s:message code="cmn.btn.select"/></th> 
	</tr>
	<c:choose>
	<c:when test="${pagination.objectsCount gt 0}">	
	<c:forEach items="${list}" var="coverage" varStatus="status">
	<c:set value="${status.count}" var="totalCount"/>
	<tr ${status.count % 2 == 0 ? 'class="row02"' : ''}>
		<td><a href="#" id="selectCoverage">${coverage.addressFullName}</a></td>
		<td><fmt:formatDate pattern="yyyy/MM/dd" value="${coverage.instStartDttm}"/></td>			
		<td>${coverage.appInd}</td>	
		<td>
		<input type="hidden" id="addNum1" name="addNum" value="${coverage.addNum}"/>
		<input type="hidden" id="addressFullName1" name="addressFullName" value="${coverage.addressFullName}"/>
		<input type="hidden" id="appInd1" name="appInd" value="${coverage.appInd}"/>
		<input type="hidden" id="instStartDttm1" name="instStartDttm" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${coverage.instStartDttm}"/>"/>
		<div class="contents_box mt_5 both"><span class="btns3 save"><input type="submit"  id="selectCoverage" value="select"/></span></span></div></td>
		</td>		
	</tr>
	</c:forEach>
	<c:forEach begin="${totalCount+1}" end="${pagination.objectsPerPage}" step="1" varStatus="status">
    <tr ${status.count % 2 == 0 ? 'class="row02"' : ''} > 
	    <td style="height:23px">&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
    </tr>
    </c:forEach>
	</c:when>
	<c:otherwise>
	<tr id="noView">
		<td colspan="4"><s:message code="coverage.msg.000011"/></td>		
	</tr>
	<tr><table align="right"><tr><td >
	<div class="contents_box mt_5">
			<!-- 버튼 //-->
			<div class="f_right">
				<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.close"/>'  id="closeCoverageBtn"/></span> 
			</div>
			<!--// 버튼 -->
	</div>
	</td></tr>
	</table>
	</c:otherwise>
	</c:choose>
	</c:when>
	<c:otherwise>
	<colgroup>
		<col width="" /><col width="15%" /><col width="11%" /><col width="20%" />
	</colgroup>
	<tr id="view">
		<th><s:message code="ar.ar22.label.000010"/></th>
		<th>instStartDttm</th>
		<th>appInd</th>		
		<th><s:message code="cmn.btn.select"/></th> 
	</tr>
	<c:choose>
	<c:when test="${pagination.objectsCount gt 0}">	
	<c:forEach items="${list}" var="coverage" varStatus="status">
	<c:set value="${status.count}" var="totalCount"/>
	<tr ${status.count % 2 == 0 ? 'class="row02"' : ''}>
		<td>${coverage.addressFullName}</td>
		<td>
			<input type="text" class="form_normal01" readonly style="width:63%;" id="instStartDttm${status.index}" name="instStartDttm" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${coverage.instStartDttm}"/>"/>
			<span class="btns3 save"><input type="submit" id="focusInstStartDttm" value='<s:message code="cmn.btn.click"/>'/></span>
		</td>
		<td><input type="radio" id="appInd" name="appInd${status.index}" value="Y" ${coverage.appInd eq 'Y' ? 'checked' : ''}/><s:message code="cmn.label.yes"/> 
			<input type="radio" id="appInd" name="appInd${status.index}" value="N" ${coverage.appInd eq 'N' ? 'checked' : ''}/><s:message code="cmn.label.no"/></td>
		<td><input type="hidden" id="coverageSeqno" name="coverageSeqno" value="${coverage.coverageSeqno}"/> 
			<input type="hidden" id="addNum" name="addNum" value="${coverage.addNum}"/> 
			<div class="contents_box mt_5 both"><%-- <span class="btns3 save"><input type="submit"  id="selectCoverage" value="select"/></span>  --%><span class="btns3 save"><input type="submit"  mode="U" id="updateCoverage" value="modify"/></span> <span class="btns3 save"><input type="submit" mode="D" id="deleteCoverage" value= '<s:message code="cmn.btn.delete"/>' /></span></div></td>
	</tr>
	</c:forEach>
	<c:forEach begin="${totalCount+1}" end="${pagination.objectsPerPage}" step="1" varStatus="status">
    <tr ${status.count % 2 == 0 ? 'class="row02"' : ''} > 
	    <td style="height:23px">&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
    </tr>
    </c:forEach>
	</c:when>
	<c:otherwise>
	<tr id="noView">
		<td colspan="3">검색된 COVERAGE가 없습니다. 등록하시겠습니까?</td>
		<td><div class="contents_box mt_5 both"><span class="btns3 save"><input type="submit"  id="insertCoverage" value="regist"/></span></div></td>
	</tr>
	<tr id="insertForm1" style="display:none">
		<table id="registCoverageForm1" width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01" style="display:none">
			<colgroup>
				<col width="30%" /><col width="70%" /> 
			</colgroup>
			 <br/>
			<tr>
			    <th><s:message code="ar.ar22.label.000010"/></th>
				<td><input type="text" class="form_normal01" style="width:80%;" id="addressFullName" name="addressFullName" title='<s:message code="ar.ar22.label.000010"/>' required="required2" readonly/>&nbsp;<span class="btns3 save"><input type="submit"  id="searchAddressBtn" value='<s:message code="cmn.btn.search"/>' /></span></td>
				
			</tr>
			<tr>
				<th><s:message code="co.label.installDate"/></th>
				<td>
				<input type="text" class="form_normal01"  style="width:120px" id="instStartDttm" name="instStartDttm" title='<s:message code="coverage.label.000001"/>' value="<fmt:formatDate pattern="yyyy/MM/dd" value="${instStartDttm}"/>" readonly required="required2"/>
				<span class="btns3 save"><input type="submit" id="focusInstStartDttm" value='<s:message code="cmn.btn.click"/>'/></span>&nbsp;
				<span class="btns3 save"><input type="submit" id="resetInstStartDttm" value= '<s:message code="cmn.btn.reset"/>' /></span>
				</td>
			</tr>
			<tr>
				<th><s:message code="cos.label.000145"/></th>
				<td><input type="radio" id="appInd" name="appInd" value="Y" checked/><s:message code="cmn.label.yes"/> 
				    <input type="radio" id="appInd" name="appInd" value="N" /><s:message code="cmn.label.no"/></td>
			</tr>
			<input type="hidden" id="addNum" name="addNum" />
		</table>
	
	
		<div class="contents_box mt_5" id="registCForm1" style="display:none">
			<!-- 버튼 //-->
			<div class="f_right">
				<span class="btns7 save"><input type="submit" value="<s:message code="cmn.label.save"/>" id="saveCoverageBtn1" mode="I"/></span> 
			</div>
			<!--// 버튼 -->
		</div>
	</tr> 	
	</c:otherwise>
	</c:choose>
	</c:otherwise>
	</c:choose>
</table>
<c:set var="baseUrl" value="/coverage/search"/>	
<c:if test="${pagination.objectsCount gt 0}">
<%@include file ="../page/pagination.jsp" %>
</c:if>

<div id="detailCoverageSearch" style="display:none">
	<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
		<colgroup>
			<col width="30%" /><col width="70%" /> 
		</colgroup>
		 <br/>
		 <tr>
		    <th><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
			<td><input type="text" class="form_normal01" style="width:95%;" id="coverageAddNum" name="coverageAddNum"  readonly/></td>
			
		</tr>
		<tr>
		    <th><s:message code="ar.ar22.label.000010"/></th>
			<td><input type="text" class="form_normal01" style="width:95%;" id="coverageAddressFullName" name="addressFullName" readonly/></td>
			
		</tr>
		<tr>
			<th><s:message code="prm.msg.000047"/></th>
			<td>
			<input type="text" class="form_normal01"  style="width:95%" id="coverageSubAddress" name="coverageSubAddress" title='<s:message code="prm.msg.000047"/>'/>
			</td>
		</tr>
	</table>
</div>
<div class="contents_box mt_5" id="detailCoverageSearch2" style="display:none">
	<!-- 버튼 //-->
	<div class="f_right">
		<span class="btns7 save"><input type="submit" value="선택" id="selectCoverageBtn"/></span> 
	</div>
	<!--// 버튼 -->
</div>
