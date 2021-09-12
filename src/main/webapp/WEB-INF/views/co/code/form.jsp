<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script  type="text/javascript" src="<s:url value="/resources/javascript/common/utils.js"/>"></script>
<c:choose>
<c:when test="${empty lookupCode.code}"><c:set var="mode" value="NEW"/><c:set var="url" value="code/form/${lang}"/></c:when>
<c:otherwise><c:set var="mode" value="MOD"/><c:set var="url" value="code/form/${lookupCode.codeGroup}/${lookupCode.code}/${lang}"/></c:otherwise>
</c:choose>
<script type="text/javascript">
	$(function(e){
		$("#startDateActive").datepicker({showAnim: "fold", dateFormat: "yy/mm/dd",  changeMonth: true,
	        changeYear: true,  showOtherMonths: true,showButtonPanel: true,
	        selectOtherMonths: true});
		$("#endDateActive").datepicker({showAnim: "fold", dateFormat: "yy/mm/dd",  changeMonth: true,
	        changeYear: true,  showOtherMonths: true,showButtonPanel: true,
	        selectOtherMonths: true}); 
		$("#resetDatePicker").click(function(e){
			e.preventDefault();
			$("#startDateActive").val("");
			$("#endDateActive").val(""); 
		});
		$("#saveCodeBtn").click(function(e){
			e.preventDefault();
			if(!formSubmitCheck()){
				return ;
			}
			$(this).loadingDialog();
			$.ajax({
				type : "POST",  
				async : true,
				url : baseUrl + "${url}",
				data : $("#codeForm").serializeArray(),
				dataType : 'json',
				success : function(data) {
					if(data.resultCode == "SUCCESS"){
						MessageBox.dialog('<s:message code="cmn.msg.saved"/>');						
						var mode = "${mode}";
						if(mode == "NEW"){
							reloadCodeType($("#codeDetailView").find("#codeGroup :selected").val());
						}else{
							$("#codeDetailView").find("#codeGroup").change();	
						}						
						Dialog.close('#dialogNewCode');
					}else{
						MessageBox.dialog(data.message);
						//MessageBox.dialog(data.message, data.messageParam);
					}
				},	error:function(data){
					//서버 비정상 동작시 구현
					MessageBox.dialog("err.500");
				}, complete:function(jqXHR, textStatus){
					;//필요시 구현
				}
			});	
		});
		
		$("#deleteCodeBtn").click(function(e){
			e.preventDefault();
			MessageBox.confirm('<s:message code="or.msg.000005"/>', function(){
				$(this).loadingDialog();
				var codeGroup = $("#codeForm").find("#codeGroup").val();
				var code = $("#codeForm").find("#code").val();
				$.ajax({
					type : "DELETE",  
					async : true,
					url : baseUrl + "code/form/"+codeGroup+"/"+code,
					dataType : 'json',
					success : function(data) {
						if(data.resultCode == "SUCCESS"){
							MessageBox.dialog('<s:message code="or.msg.000030"/>');
							reloadCodeType($("#codeDetailView").find("#codeGroup :selected").val());
							Dialog.close('#dialogNewCode');
						}else{
							MessageBox.dialog(data.message);
							//MessageBox.dialog(data.message, data.messageParam);
						}
					},	error:function(data){
						//서버 비정상 동작시 구현
						MessageBox.dialog("err.500");
					}, complete:function(jqXHR, textStatus){
						;//필요시 구현
					}
				});	
			},function(){
				return ;
			});
		});
		
		$("#codeFormCloseBtn").click(function(e){
			e.preventDefault();
			Dialog.close('#dialogNewCode');
		});
		
		function formSubmitCheck(){
			var mode = "${mode}";
			if(mode == "NEW"){
				var codeGroup = $("#codeForm").find("#codeGroup");
				var code = $("#codeForm").find("#code");
				if($(codeGroup).val() == ''){
					MessageBox.dialog('<s:message code="code.msg.000005"/>');
					$(codeGroup).focus();
					return false ;
				}
				var trimCodeValue = $.trim($(code).val());
				if( trimCodeValue == ''){
					MessageBox.dialog('<s:message code="code.msg.000006"/>');
					$(code).focus();
					return false ;
				}		
				
				$(code).val(trimCodeValue);
			}
			
			var ret = true ;
			$("#codeForm").find("[id=charMeaning]").each(function(e){
				if($(this).val() == ''){
					$(this).focus();
					ret = false ;
					return false ;
				}
			});
			if(!ret){
				MessageBox.dialog('<s:message code="code.msg.000007"/>');
				return false ;
			}
			return true ;
		}
	});
</script>
	<div>
		<form id="codeForm" name="codeForm" >
		<input type="hidden" id="securityGroupId" name="securityGroupId" value="SEC_ID"/>
		<input type="hidden" id="viewApplicationId" name="viewApplicationId" value="APP_ID"/>
		<input type="hidden" id="sourceLang" name="sourceLang" value="${lang}"/>
		
		<c:forEach items="${languages}" var="code">
		<input type="hidden" id="charLang" name="charLang" value="${code.code}"/>		
		</c:forEach>
						
		<div class="title">
			<!-- 타이틀 //-->
			<h1><s:message code="code.label.000001"/></h1>
			<!--// 타이틀 -->
		</div>
		<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
			<colgroup>
				<col width="40%" />				
				<col width="60%" />				
			</colgroup>
			<tr>
				<th><s:message code="code.label.000002"/></th>
				<td><input type="text" id="codeGroup" name="codeGroup" ${empty lookupCode.codeGroup ? 'class="form_normal01"' : 'class="form_disable"'} 
					style="width: 100%;" ${empty lookupCode.codeGroup ? '' : 'readonly'} value="${lookupCode.codeGroup}" /></td>
			</tr>
			
			<tr>
				<th><s:message code="code.label.000003"/></th>
				<td><input type="text" id="code" name="code" ${empty lookupCode.code ? 'class="form_normal01"' : 'class="form_disable"'} 
					style="width: 100%;" ${empty lookupCode.code ? '' : 'readonly'} value="${lookupCode.code}" /></td>
			</tr>
			<tr>
				<th><s:message code="code.label.000005"/></th>
				<td><input type="radio" id="enabledFlag" name="enabledFlag" value="true" ${lookupCode.enabledFlag eq true ? 'checked=true' : ''}/><s:message code="cmn.label.yes"/> 
				    <input type="radio" id="enabledFlag" name="enabledFlag" value="false" ${lookupCode.enabledFlag eq false ? 'checked=true' : ''}/><s:message code="cmn.label.no"/></td>
			</tr>
			<tr>
				<th><s:message code="code.label.000006"/></th>
				
				<td><input type="text" class="form_normal01"  style="width:80px" id="startDateActive" name="startDateActive" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${lookupCode.startDateActive}"/>" /> ~ 
					<input type="text" class="form_normal01" style="width:80px" id="endDateActive" name="endDateActive" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${lookupCode.endDateActive}"/>" /> 
					<span class="btns3 save"><input type="submit" id="resetDatePicker" value= '<s:message code="cmn.btn.reset"/>' /></span></td>
			</tr>
			<tr>
				<th><s:message code="cs.caption.priceplan.0034"/></th>
				<td><select id="svcDomain" name="svcDomain" class="form_select01" style="width:96%">
					<option value=""><s:message code="co.label.choose"/></option>
					<code:out value="${lookupCode.svcDomain }" codeType="SvcDomain" option="listbox"/>
					</select>
				</td>
			</tr>
			<tr>
				<th><s:message code="co.label.subGroup1"/></th>
				<td><input type="text" class="form_normal01"  style="width:96%" id="subGrp1" name="subGrp1" value="${lookupCode.subGrp1 }"/>
				</td>
			</tr>
			<tr>
				<th><s:message code="co.label.subGroup2"/></th>
				<td><input type="text" class="form_normal01"  style="width:96%" id="subGrp2" name="subGrp2" value="${lookupCode.subGrp2 }"/>
				</td>
			</tr>
			<tr>
				<th><s:message code="code.label.000007"/></th>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
						<colgroup><col width="15%" /><col width="85%" /></colgroup>
						<c:forEach items="${languages}" var="code">
						<tr><td>${code.meaning}</td>
							<td><input type="text" id="charMeaning" name="charMeaning" class="form_normal01" style="width: 100%;" value="${codes[code.code].meaning}" />
							</td>
						</tr>
						</c:forEach>						
					</table>
				</td>
			</tr>
			<tr>
				<th><s:message code="code.label.000008"/></th>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
						<colgroup><col width="15%" /><col width="85%" /></colgroup>
						<c:forEach items="${languages}" var="code">
						<tr><td>${code.description}</td>							 
							<td><input type="text" id="charDscpt" name="charDscpt" class="form_normal01" style="width: 100%;" value="${codes[code.code].description}" />
							</td>
						</tr>
						</c:forEach>						
					</table>
				</td>
			</tr>			
		</table>
		</form>
	</div>
	<div class="contents_box mt_5">
		<!-- 버튼 //-->
		<div class="f_right">
			<c:if test="${not empty lookupCode.code}">
			<span class="btns7 save"><input type="submit" value="<s:message code="cmn.label.del"/>" id="deleteCodeBtn"/></span>
			</c:if>
			<span class="btns7 save"><input type="submit" value="<s:message code="cmn.label.save"/>" id="saveCodeBtn"/></span> 
			<span class="btns7 save"><input type="submit" value="<s:message code="cmn.label.close"/>" id="codeFormCloseBtn"/></span>
		</div>
		<!--// 버튼 -->
	</div>	
	<div id="dialogNewCode"><div id="dialogNewCodeSource"></div></div>
