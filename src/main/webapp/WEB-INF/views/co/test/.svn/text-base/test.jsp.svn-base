<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<script>



$(function(e){	
		
	$("#trans").click(function(e){
		e.preventDefault();
		var url = $("#url").val();
		var param ="";
		var i = 0;
		$("[id=name]").each(function(e){
			if($(this).val() != ""){
				param += $(this).val()+ "=" + $("[id=value]").eq(i).val() + "&";
			}
			i++;
		});
		MessageBox.confirm('<s:message code="code.msg.000030"/>', function(){
			$.ajax({
				type : "GET",  
				async : false,
				url : baseUrl + "openapi/get/test?url="+ escape(url+"?"+param),
				dataType : 'html',			
				data : "",
				success : function(data) {
					/* if(data.RESULT == "SUCCESS"){
						alert("전송성공");					
					}else{
						alert("전송실패");
					}	 */	
					$("#testList").empty().append(data);
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
	});
	
});	

</script>
		   
<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_list01 mt_5">
	<colgroup>
		<col width="30%" /><col width="70%" />
	</colgroup>
	 <tr>
		<th><s:message code="co.label.url"/></th>
		<td><input type="text" class="form_normal01" style="width:95%;" id="url" name="url" value="http://"/></td>	
	</tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_list01 mt_5">
	<colgroup>
		<col width="30%" /><col width="70%" />
	</colgroup>
	 <tr>
		<th><s:message code="code.label.000068"/></th>
		<th><s:message code="co.label.value"/></th>
	</tr>
	 <tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	<tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	<tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	<tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	<tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	 <tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	<tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	<tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	<tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	<tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	<tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>
	<tr>
		<td><input type="text" class="form_normal01" style="width:95%;" id="name" name="name" /></td>
		<td><input type="text" class="form_normal01" style="width:95%;" id="value" name="value" /></td>	
	</tr>

</table>
<div class="contents_box mt_5">
	<!-- 버튼 //-->
	<div class="f_right">
		<span class="btns7 save"><input type="submit" value='<s:message code="cmn.btn.send"/>' id="trans"/></span> 
	</div>
	<!--// 버튼 -->
</div>

<br>
<s:message code="co.label.result"/>
<div id="testList">

</div>

