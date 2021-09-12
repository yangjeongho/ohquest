<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set value="${ss_member}" var="user"/>
<script type="text/javascript">

$(function(e){
	$("#scSec001Form #scSec001ChangeUserBtn").click(function(e){
		e.preventDefault();
		if($("#scSec001Form #userId").val() == ''){
			MessageBox.dialog('<s:message code="sec.msg.000001"/>'); //Input User ID!
			return ;
		}
		
		$.ajax({
			type : "POST",  
			async : true,
			url : baseUrl + 'security/sso',
			data : {userId : $("#scSec001Form #userId").val(), marketCode : $("#scSec001Form #marketCode").val()},
			dataType : 'json',
			success : function(data) { 
				if(data.messageParam.resultCode == 'SUCCESS'){
					$("#reloadMainBtn").click();
				}else{
					MessageBox.dialog(data.messageParam.message);
				}
			}
		});
	});
	$("#scSec001Form #scSec001Closetn").click(function(e){
		e.preventDefault();
		Dialog.close("#${param.dialogName}");
	});
});

</script>


<div id="wrap_400" style="width:380px">
	<div class="contents_box" style="width:100%">
		<form id="scSec001Form" method="post">
	 	<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
			<colgroup>
				<col width="50%" />
				<col width="50%" />
			</colgroup>
			<tr>
				<th><s:message code="login.label.SelectMarket"/></th>
				<td> <select id="marketCode" class="form_select01">
					<option value="1" ${user.marketCode eq '2' ? 'selected' : ''}><s:message code="code.label.unitel"/></option>
					<option value="2" ${user.marketCode eq '1' ? 'selected' : ''}><s:message code="code.label.univision"/></option>
				</select></td>
			</tr>
			<tr>
				<th><s:message code="co.security.label.000003"/></th>
				<td> <input type="text" id="userId" name="userId" class="form_normal01" style="width:100%;" title="<s:message code="co.security.label.000003"/>" /></td>
			</tr>
		</table>
		
		<!-- 컨텐츠를 감싸는 박스 //-->
		<div class="contents_box">
			<!-- 버튼 //-->
			<div class="f_right">
				<span class="btns7 save"><input type="submit" value="<s:message code="co.security.label.000002"/>" id="scSec001ChangeUserBtn"/></span>
				<span class="btns7 save"><input type="submit" value="<s:message code="cmn.btn.close"/>" id="scSec001Closetn"/></span>
			</div>
			<!--// 버튼 -->
		</div>
		</form>
	</div>    
</div>
