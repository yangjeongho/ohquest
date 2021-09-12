<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>

<script>


$(function(e){
	$("#searchAddressForm").click(function(e){
		e.preventDefault();	
		$("#registForm").hide();
		$("#registForm2").hide();
		$("#registAddressForm").hide();
		$("#registAddressForm1").hide();
		$("#csvUploadDialog").hide();
		$("#csvUploadDialog1").hide();
		$("#uploadResult").hide();
		
	    if ($("#searchVal").val() ==""){
	    	MessageBox.dialog('<s:message code="address.msg.000009"/>');
	    	return;
	    }
	    $(this).loadingDialog("주소를 검색중입니다. 잠시만 기다려 주세요");
		$.ajax({
			type : "GET",  
			async : false,
			url : baseUrl + "common/address/search?callBack=${param.callBack}&coverageMode=${param.coverageMode}",
			dataType : 'html',
			data : $("#searchForm").serializeArray(),
			success : function(data) {
				$("#addressSearchList").hide().empty().append(data).show();
			},
			error:function(data){
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				$(this).hideLoading();
			}
		});
		
	});
	
	
	$("#searchForm").submit(function(e){
		e.preventDefault();
		$("#address").click();
		return false ;
	});
	
	$("#registFormA").click(function(e){
		e.preventDefault();	
		$("#registAddressForm").show();
		$("#registAddressForm1").show();
		$("#registForm").show();
		$("#registForm2").show();		
		$("#addressSearchList").hide().empty();
		$("#csvUploadDialog").hide();
		$("#csvUploadDialog1").hide();
		$("#uploadResult").hide();
	});
	
	$("#multiUpload").click(function(e){
		e.preventDefault();	
		$("#registAddressForm").hide();
		$("#registAddressForm1").hide();
		$("#registForm").hide();
		$("#registForm2").hide();		
		$("#addressSearchList").hide().empty();
		$("#csvUploadDialog").show();
		$("#csvUploadDialog1").show();		
		$("#uploadResult").hide();
		$("#attach").val("");
	});
	
	
	$("#registAddress1").click(function(e){
		e.preventDefault();	
		check_num($("#addNum").val(),$("#addNum"));
		if(submitToAdd()){	
			MessageBox.confirm('<s:message code="address.msg.000021"/>', function(){
				$(this).loadingDialog("중복 된 주소를 확인 중입니다. 잠시만 기다려 주세요");
				$.ajax({
					type : "POST",  
					async : false,
					url : baseUrl + "common/address/check/",
					dataType : 'json',
					data : $("#registAddressForm").find("[type=text]").serialize(),
					success : function(data) {
						if(data.RESULT == "SUCCESS"){
							
							if (data.COUNT == 0 ){
								registAddress();
							}else{
								MessageBox.dialog('<s:message code="address.msg.000011"/>');
							}
						}else{
							MessageBox.dialog('<s:message code="address.msg.000012"/>');
							//errorMessage(data.MESSAGE);
						}
					},
					error:function(data){
						MessageBox.dialog('<s:message code="cos.msg.server"/>');
					},
					complete:function(jqXHR, textStatus){
						
					}
				});
			},function(){
				return false ;
			});
		}
				
	});
	
	function registAddress(){
		$(this).loadingDialog("주소를 등록 중입니다. 잠시만 기다려 주세요");
		$.ajax({
			type : "POST",  
			async : true,
			url : baseUrl + "address/process/I",
			dataType : 'json',
			data : $("#registAddressForm").find("[type=text]").serialize(),
			success : function(data) {
				if(data.RESULT == "SUCCESS"){
					MessageBox.dialog('<s:message code="address.msg.000013"/>');
					$("#addNum").val("");
					$("#city").val("");
					$("#district").val("");
					$("#subDistrict").val("");
					$("#building").val("");
					$("#entrance").val("");
					$("#apt").val("");
					$("#location").val("");
					
				}else{
					MessageBox.dialog('<s:message code="address.msg.000014"/>');
					//errorMessage(data.MESSAGE);
				}
			},
			error:function(data){
				MessageBox.dialog('<s:message code="cos.msg.server"/>');
			},
			complete:function(jqXHR, textStatus){
				
			}
		});
	}
	
	function submitToAdd(){
		var ret = true;
		$("[required=required]").each(function(e){
			if($(this).val() == ""){
				MessageBox.dialog($(this).attr('title')+'<s:message code="address.msg.000019"/>');
				$(this).focus();
				ret = false ;
				return false;
			}
		});
		return ret;
	}
	
	function check_num(num, obj) {
		 var val = "0123456789";
		 var len = num.length;
		 
		 for(var i=0; i<len; i++) {
			  if(val.indexOf(num.substring(i, i+1)) < 0) {
				  MessageBox.dialog('<s:message code="address.msg.000020"/>');
			   obj.val("");
			   obj.focus();
			   return;
			  }
	     }
	}
	
	$("#csvUploadBtn").click(function(e){
		e.preventDefault();
		
		var fileName = $.trim($('[id=attach]').val().toLowerCase());
		if(fileName == '') {
			MessageBox.dialog('<s:message code="address.msg.000024"/>');
			return false;
		}
		if(!(fileName.lastIndexOf(".csv") != -1 )){
			MessageBox.dialog('<s:message code="address.msg.000025"/>');
			return false;
		}
		
		MassageBox.confirm('<s:message code="address.msg.000026"/>', function(){
			$(this).loadingDialog("주소를 일괄 등록 중입니다. 잠시만 기다려 주세요");
			$('[id=csvUploadForm]').ajaxSubmit({ 
				url : baseUrl + "address/upload" +($.browser.msie ? '.html' :''),
			  	contentType: "multipart/form-data",
				success : function(e) { 
					if($.browser.msie){
						e = JSON.parse(e);	
					}
                	$("#uploadResult").empty().append(e).show();
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
		    <form name="searchForm" id="searchForm">
			<div class="f_left">
				<p>
					<s:message code="address.msg.000031"/>
					<input type="hidden" id="searchKey" name="searchKey" value="default">
					<input class="form_normal01"  type="text" id="searchValue" name="searchValue" placeholder="Input Address" value="${searchVal}">
					<input type="hidden"  id="mode" name="mode" value="${mode}">
				</p>
			</div>
			<!-- 조회 버튼 //-->
			<div class="f_right">
				<img src="<c:url value="/resources/images/common/line_01.gif"/>" />
				<span class="btns9 save"><input type="submit" value='<s:message code="cmn.btn.search"/>'  id="searchAddressForm"/></span>
				<c:if test="${mode ne 'SELECT'}" >
			    <span class="btns9 save"><input type="submit" value="register" id="registFormA"/></span> 
			    <span class="btns9 save"><input type="submit" value="multi register" id="multiUpload"/></span> 
			    </c:if>	
			</div>
			<!--// 조회 버튼 //-->
			</form>
		</div>
		
		<!--// 검색조건이 한줄일 경우 -->
	</div>
	<div id="addressSearchList">
			
	</div>
	<div id="registAddressForm" style="display:none">
		<%-- <table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_list01 mt_5">
			<colgroup>
				<col width="10%" /><col width="10%" /><col width="15%" /><col width="15%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="20%" />
			</colgroup>
			 <tr>
				<th><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
				<th><s:message code="co.label.city"/></th>
				<th><s:message code="co.label.district"/></th>
				<th><s:message code="co.label.subDistrict"/></th>
				<th><s:message code="co.label.building"/></th>
				<th><s:message code="co.label.entrance"/></th>
				<th><s:message code="co.label.apt"/></th>
				<th><s:message code="cmn.btn.select"/></th> 
			</tr>
			<tr id="registForm">
				<td><input type="text" class="form_normal01" style="width:95%;" id="addNum" name="addNum" title="addNum" required="required" maxlength="6"/></td>
				<td><input type="text" class="form_normal01" style="width:95%;" id="city" name="city" title="city" required="required"/></td>
				<td><input type="text" class="form_normal01" style="width:95%;" id="district" name="district" title="district" required="required"/></td>
				<td><input type="text" class="form_normal01" style="width:95%;" id="subDistrict" name="subDistrict"/></td>
				<td><input type="text" class="form_normal01" style="width:95%;" id="building" name="building"/></td>
				<td><input type="text" class="form_normal01" style="width:95%;" id="entrance" name="entrance"/></td>
				<td><input type="text" class="form_normal01" style="width:95%;" id="apt" name="apt"/></td>
				<td rowspan="2"><div class="contents_box mt_5 both"><span class="btns3 save"><input type="submit" id="registAddress1" value="regist"/></span></div></td>
			</tr>
			<tr id="registForm2">
				<td>location :</td>
				<td colspan="6"><input class="form_normal01" style="width:95%;" type="text" id="location" name="location"/></td>		
			</tr>
		</table> --%>
		<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_list01 mt_5">
			<colgroup>
				<col width="12%" /><col width="38%" /><col width="12%" /><col width="38%" />
			</colgroup>
			<tr>
			    <th><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="addNum" name="addNum" title="addNum" required="required" maxlength="6"/></td>
				<th><s:message code="co.label.city"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="city" name="city" title="city" required="required"/></td>
			</tr>
			<tr>
			    <th><s:message code="co.label.district"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="district" name="district" title="district" required="required"/></td>
				<th><s:message code="co.label.subDistrict"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="subDistrict" name="subDistrict" /></td>
			</tr>
			<tr>
			    <th><s:message code="co.label.building"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="building" name="building" /></td>
				<th><s:message code="co.label.entrance"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="entrance" name="entrance" /></td>
			</tr>
			<tr>
			    <th><s:message code="co.label.apt"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="apt" name="apt" /></td>
				<th><s:message code="co.label.location"/></th>
				<td><input type="text" class="form_normal01" style="width:95%;" id="location" name="location" /></td>
			</tr>
		</table>
	</div>
	
	<div class="contents_box mt_5" id="registAddressForm1" style="display:none">
		<!-- 버튼 //-->
		<div class="f_right">
			<span class="btns7 save"><input type="submit" value="<s:message code="cmn.label.save"/>" id="registAddress1" mode="I"/></span> 
		</div>
		<!--// 버튼 -->
	</div>
	
	<form id="csvUploadForm" name="csvUploadForm" action="<s:url value="/address/upload"/>" method="POST" enctype="multipart/form-data"> 		
	<div id="csvUploadDialog" style="display:none">
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
				<td><a href="<s:url value="/resources/csv/address_en.csv"/>"><s:message code="code.msg.000009"/></a></td>
			</tr>
			<tr>
				<th><s:message code="cs.lable.notice.000016"/></th>
				<td><input type="file" id="attach" name="attach"/>
				</td>
			</tr>			
		</table>
	</div>
	<div class="contents_box mt_5" id="csvUploadDialog1" style="display:none">
		<!-- 버튼 //-->
		<div class="f_right"> 
			<span class="btns7 save"><input type="button" value='<s:message code="code.label.000004"/>' id="csvUploadBtn" /></span>
		</div>
		<!--// 버튼 -->
	</div>
	<br/>
	<div id="uploadResult" style="display:none">
	</div>
	</form>	
	
