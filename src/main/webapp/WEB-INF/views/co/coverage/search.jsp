<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>

<script>

function getCustomerAddress(custAddress){
	$("#addressFullName").val(custAddress.addressFullName);
	$("#addNum").val(custAddress.addNum);	
}


$(function(e){
	$("#focusInstStartDttm").click(function(e){
		e.preventDefault();
		$("#instStartDttm").focus();
	});
	$("#instStartDttm").datepicker({showAnim: "fold", dateFormat: "yy/mm/dd",  changeMonth: true,
        changeYear: true,  showOtherMonths: true,showButtonPanel: true,
        selectOtherMonths: true});
	$("#resetInstStartDttm").click(function(e){
		e.preventDefault();
		$("#instStartDttm").val("");
		
	});
	
	$("#searchAddressBtn").click(function(e){
		e.preventDefault();
		Dialog.open({
			div : '#searchAddressDialog', 
			url : baseUrl+"common/address/search?dialogName=searchAddressDialog&callBack=getCustomerAddress&coverageMode=${coverageMode}",
			title :'<s:message code="cos.title.000008"/>', 
			width : 900, 
			height : 700,  
			modal : true
		});	
	});
	
	$("#searchCoverageForm").click(function(e){
		e.preventDefault();	
		$("#registCForm").hide();
		$("#registCoverageForm").hide();
		$("#csvCoverageUploadDialog").hide();
		$("#csvCoverageUploadDialog1").hide();
		$("#coverageUploadResult").hide();		
		
	    if ($("#searchCForm").find("[id=searchValue]").val() ==""){
	    	alert('<s:message code="address.msg.000009"/>');
	    	return;
	    }
	    $(this).loadingDialog('<s:message code="coverage.msg.000009"/>');
		$.ajax({
			type : "GET",  
			async : true,
			url : baseUrl + "coverage/search?coverageMode=${coverageMode}&dialogName=${param.dialogName}&callBackCoverage=${param.callBackCoverage}",
			dataType : 'html',
			data : $("#searchCForm").serializeArray(),
			success : function(data) {
				$("#coverageSearchList").hide().empty().append(data).show();
			},
			error:function(data){
				alert('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				$(this).hideLoading();
			}
		});
		
	});
	
	
	$("#searchCForm").submit(function(e){
		e.preventDefault();
		$("#coverage").click();
		return false ;
	});	
	
	$("#registCFormA").click(function(e){
		$("#registCoverageForm").show();
		$("#registCForm").show();
		$("#coverageSearchList").hide().empty();
		$("#csvCoverageUploadDialog").hide();
		$("#csvCoverageUploadDialog1").hide();
		$("#coverageUploadResult").hide();		
	});
	
	$("#multiCUpload").click(function(e){
		$("#registCoverageForm").hide();
		$("#registCForm").hide();
		$("#coverageSearchList").hide().empty();
		$("#csvCoverageUploadDialog").show();
		$("#csvCoverageUploadDialog1").show();		
		$("#coverageUploadResult").hide();
		$("#attach").val("");
	});
	
	
	$("#saveCoverageBtn").click(function(e){
		e.preventDefault();
		var mode = $(this).attr("mode");	
		var addNum = $("#addNum").val();
		
		if(submitToCoverageAdd()){			
			MessageBox.confirm('<s:message code="coverage.msg.000001"/>', function(){
				$(this).loadingDialog('<s:message code="coverage.msg.000008"/>');
				$.ajax({
					type : "GET",  
					async : false,
					url : baseUrl + "coverage/check/"+addNum,
					dataType : 'json',
					data : "",
					success : function(data) {
						if(data.RESULT == "SUCCESS"){
							
							if (data.COUNT == 0 ){
								registCoverage(mode);
							}else{
								alert('<s:message code="coverage.msg.000010"/>');
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
			}, function(){
				return false ;
			});
		};		
	});	
	
	
	function registCoverage(mode){
		$(this).loadingDialog("커버리지를 등록 중입니다. 잠시만 기다려 주세요");
		$.ajax({
			type : "POST",  
			async : true,
			url : baseUrl + "coverage/process/"+mode,
			dataType : 'json',
			data : $("#registCoverageForm").find(":input").serialize(),
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
	
	function submitToCoverageAdd(){
		var ret = true;
		$("[required=Y]").each(function(e){
			if($(this).val() == ""){
				alert($(this).attr('title')+"은(는) 필수항목입니다.");
				$(this).focus();
				ret = false ;
				return false;
			}
		});
		return ret;
	}	
	
	
	$("#csvCoverageUploadBtn").click(function(e){
		e.preventDefault();
		
		var fileName = $.trim($('[id=attach]').val().toLowerCase());
		if(fileName == '') {
			alert('<s:message code="address.msg.000024"/>');
			return false;
		}
		if(!(fileName.lastIndexOf(".csv") != -1 )){
			alert('<s:message code="address.msg.000025"/>');
			return false;
		}
		
		MessageBox.confirm('<s:message code="address.msg.000026"/>', function(){
			$('[id=csvCoverageUploadForm]').ajaxSubmit({ 
				url : baseUrl + "coverage/upload" +($.browser.msie ? '.html' :''),
			  	contentType: "multipart/form-data",
				success : function(e) {
					if($.browser.msie){
						e = JSON.parse(e);	
					}
                	$("#coverageUploadResult").empty().append(e).show();
				}
            });	
		});
		
		return false ;
	});
	
});
	
</script>
	

	<div class="contents_box">
	
			<!-- 검색조건이 한줄일 경우 //-->
		
		<div class="search_box_01">
		    <form name="searchCForm" id="searchCForm">
			<div class="f_left">
				<p>
					<s:message code="address.msg.000031"/>
					<input class="form_normal01"  type="text" id="searchValue" name="searchValue" placeholder="Input Address" value="${searchKey[0]}">
					<input type="hidden" id="searchKey" name="searchKey" value="default">
				</p>
			</div>
			<!-- 조회 버튼 //-->
			<div class="f_right">
				<img src="<c:url value="/resources/images/common/line_01.gif"/>" />
			    <span class="btns9 save"><input type="submit" value='<s:message code="cmn.btn.search"/>' id="searchCoverageForm"/></span> 
			    <c:if test="${coverageMode ne 'SELECT'}" >
			    <span class="btns9 save"><input type="submit" value='<s:message code="cmn.btn.reg"/>' id="registCFormA"/></span> 
			    <span class="btns9 save"><input type="submit" value='<s:message code="cmn.btn.multireg"/>' id="multiCUpload"/></span> 
			    </c:if>
					
			</div>
			<!--// 조회 버튼 //-->
			</form>
		</div>
		
		<!--// 검색조건이 한줄일 경우 -->
	</div>
	<div id="coverageSearchList"></div>
	<div id="registCoverageForm" style="display:none">
		<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
			<colgroup>
				<col width="30%" /><col width="70%" /> 
			</colgroup>
			 <br/>
			<tr>
			    <th><s:message code="ar.ar22.label.000010"/></th>
				<td><input type="text" class="form_normal01" style="width:80%;" id="addressFullName" name="addressFullName" title='<s:message code="ar.ar22.label.000010"/>' required="Y" readonly/>&nbsp;<span class="btns3 save"><input type="submit"  id="searchAddressBtn" value='<s:message code="cmn.btn.search"/>' /></span></td>
				
			</tr>
			<tr>
				<th><s:message code="co.label.installDate"/></th>
				<td>
				<input type="text" class="form_normal01"  style="width:120px" id="instStartDttm" name="instStartDttm" title='<s:message code="coverage.label.000001"/>' required="Y" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${instStartDttm}"/>" />
				<span class="btns3 save"><input type="submit" id="focusInstStartDttm" value='<s:message code="cmn.btn.click"/>'/></span>&nbsp;
				<span class="btns3 save"><input type="submit" id="resetInstStartDttm" value= '<s:message code="cmn.btn.reset"/>' /></span>
				</td>
			</tr>
			<tr>
				<th><s:message code="cos.label.000145"/></th>
				<td><input type="radio" id="appInd" name="appInd" value="Y" checked/>
					<s:message code="cmn.label.yes"/> 
				    <input type="radio" id="appInd" name="appInd" value="N" />
				    <s:message code="cmn.label.no"/>
				</td>
			</tr>
			<input type="hidden" id="addNum" name="addNum" />
		</table>
	</div>
	
	<div class="contents_box mt_5" id="registCForm" style="display:none">
		<!-- 버튼 //-->
		<div class="f_right">
			<span class="btns7 save"><input type="submit" value="<s:message code="cmn.label.save"/>" id="saveCoverageBtn" mode="I"/></span> 
		</div>
		<!--// 버튼 -->
	</div>	
	
	<form id="csvCoverageUploadForm" name="csvCoverageUploadForm" action="<s:url value="/coverage/upload"/>" method="POST" enctype="multipart/form-data"> 		
	<div id="csvCoverageUploadDialog" style="display:none">
		<div class="title">
			<h1><s:message code="bs.label.000261"/></h1>
		</div>
		<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
			<colgroup>
				<col width="15%" />				
				<col width="85%" />				
			</colgroup>
			<tr>
				<th><s:message code="co.label.templateDown"/></th>
				<td><a href="<s:url value="/resources/csv/coverage_en.csv"/>"><s:message code="code.msg.000009"/></a></td>
			</tr>
			<tr>
				<th><s:message code="cs.lable.notice.000016"/></th>
				<td><input type="file" id="attach" name="attach"/>
				</td>
			</tr>			
		</table>
	</div>
	<div class="contents_box mt_5" id="csvCoverageUploadDialog1" style="display:none">
		<!-- 버튼 //-->
		<div class="f_right"> 
			<span class="btns7 save"><input type="button" value='<s:message code="code.label.000004"/>' id="csvCoverageUploadBtn" /></span>
		</div>
		<!--// 버튼 -->
	</div>
	<br/>
	<div id="coverageUploadResult" style="display:none">
	</div>
	</form>	
