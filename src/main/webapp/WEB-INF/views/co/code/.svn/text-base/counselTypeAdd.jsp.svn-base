<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script  type="text/javascript" src="<s:url value="/resources/javascript/common/utils.js"/>"></script>
<script type="text/javascript">
$(function(e){
/*  $('#counselTypeLev2Add').css("display","none"); 
	 $('#counselTypeLev3Add').css("display","none");  */
	 createComboBox($("#Lev1TypAdd"), baseUrl + "code/counselListbox", {level: "1"}, null); 
	 $("#codeIdOk").val("0");   //Id 등록할 수 있는 값 1 없는값 0	
	 $("#codeIdLevCheck").val("1");
	 $('#codeIdCheck').removeAttr('readonly');
	
	 function refreshAdd(){
		 $("#codeIdOk").val("0");   //Id 등록할 수 있는 값 1 없는값 0	
		 $("#codeIdLevCheck").val("1");
		 createComboBox($("#Lev1TypAdd"), baseUrl + "code/counselListbox", {level: "1"}, null); 
		 $('#codeIdCheck').removeAttr('readonly');
		   $("#codeIdCheck").val("");
		/* $("#codeIdCheck").focus(); */
		 
		   $("#Lev1TypAddBox").val("");
    	   $("#Lev1TypAddBox").attr('disabled', false);	
    	   $("#Lev2TypAdd").val("X");
    	   $("#Lev2TypAdd").attr('disabled', true);
     	   $("#Lev2TypAddBox").attr('disabled', true);
           $("#Lev2TypAddBox").val("");
           $("#Lev3TypAddBox").attr('disabled', true);	
           $("#Lev3TypAdd").val("X");
    	   $("#Lev3TypAdd").attr('disabled', true);
    	   $("#Lev3TypAddBox").attr('disabled', true);
           $("#Lev3TypAddBox").val("");
           $("#EventcodeIdCheck").val("");
           $("#EventcodeIdCheck").attr('disabled', true);
           $("#Lev3TypEventAddBox").val("");
           $("#Lev3TypEventAddBox2").val("");
           $("#Lev3TypEventAddBox").attr('disabled', true);
		   $("#Lev3TypEventAddBox2").attr('disabled', true); 
           $("#Lev4TypAddBox").attr('disabled', true);	
           $("#Lev4TypAdd").val("X");              
           
    	   $("#Lev4TypAdd").attr('disabled', true);
    	   $("#Lev4TypAddBox").attr('disabled', true);
           $("#Lev4TypAddBox").val("");
           $("#Lev4TypEventAddBox").val("");
           $("#Lev4TypEventAddBox2").val("");
           $("#Lev4TypEventAddBox").attr('disabled', true);
		   $("#Lev4TypEventAddBox2").attr('disabled', true); 
		   $("#Event4CodeIdCheck").val("");
		   $("#Event4CodeIdCheck").attr('disabled', true);	  
		   
		   $("#Lev5TypAdd").val("X");
           $("#Lev5TypAddBox").attr('disabled', true);	
    	   $("#Lev5TypAdd").attr('disabled', true);
    	   $("#Lev5TypAddBox").attr('disabled', true);
           $("#Lev5TypAddBox").val("");
           $("#Lev5TypEventAddBox").attr('disabled', true);
           $("#Lev5TypEventAddBox").val("");
           $("#Lev5TypEventAddBox2").attr('disabled', true);
           $("#Lev5TypEventAddBox2").val("");
           
           $("#codeIdCheck").val("");
           $("#codeIdOkSave").val("");          
        
           createComboBox($("#Lev1TypAdd"), baseUrl + "code/counselListbox", {level: "1"}, null); 
	 }
	
	 $("#refreshBtn").click(function (e){
	      
		 refreshAdd();
	 });
	  
	 $("#codeViewCloseBtnAdd").click(function (e){
		 
		Dialog.close('#${param.dialogName}');
	 }); 	 
	 
	 //아이디 체크
	 $("#idCheckBtn").click(function (e){
		e.preventDefault();
		var id ="";
		var pattern1 = /(^[a-zA-Z])/;
		var pattern2 = /([^a-zA-Z0-9\-_])/;
		id=$("#codeIdCheck").val();
		
		if(id.length <1){
			MessageBox.dialog('<s:message code="bs.blWkID.required"/>');
			 return;
		}else if(id.length >4){
			MessageBox.dialog('<s:message code="code.msg.000023"/>');
			 return;
		}else if(!pattern1.test(id)){
			MessageBox.dialog('<s:message code="code.msg.000024"/>');
			 return;
		}/* else if(!pattern2.test(id)){
			alert("아이디는 영문 숫자 조합");
			return false;
		} */
		
		if(id !== ""){
			$.ajax({
				type : "GET",  
				async : false,
				url : baseUrl + "co/counselTypeIdCheck" ,
				data : { codeId :id} ,
				dataType : 'json',
				success : function(data) {
					
			      if(data.idCheck ==1){
			    	  MessageBox.dialog('<s:message code="code.msg.000025"/>');
			    	  $("#codeIdOk").val("1");
			    	  $("#codeIdOkSave").val($("#codeIdCheck").val());
			    	  
			    	 
			    	  createComboBox($("#Lev1Typ"), baseUrl + "code/counselListbox", {level: "1"}, null); 
			    	   $("input[name=codeIdCheck]").attr("readonly",true);
			    	   
			    	   
			      }else{
			    	  MessageBox.dialog('<s:message code="code.msg.000026"/>');
			    	  $("#codeIdOk").val("0");
			    	  $("#codeIdCheck").focus();
			      }
					
			        
				},error:function(data){
					//서버 비정상 동작시 구현
					MessageBox.dialog("err.500");
				}, complete:function(jqXHR, textStatus){
					//필요시 구현
				}
			}); //ajax
		}//if
	}); 
	 
	// 레벨 변경시 이벤트
		
     $("#Lev1TypAdd").change(function(e){
    	 e.preventDefault();
	    var selectType = $(this).val();	   
        createComboBox($("#Lev2TypAdd"), baseUrl + "code/counselListbox", {level: "2", upCodeId:selectType}, null); 
        $("#codeIdLevCheck").val(2);
      
        if($("#Lev1TypAdd").val() != 'X'){
         /*  $('#Lev1TypAddBox').attr("disabled", "disabled");     */ 
        	/* $("#Lev1TypAddBox").attr('readonly', true); */
        	var lev1 =$("#Lev1TypAdd option:selected").text();
        	  $("#Lev1TypAddBox").val(lev1);   
        	  $("#Lev1TypAddBox").attr('disabled', true);	
        	  $("#Lev2TypAdd").attr('disabled', false);
        	  $("#Lev2TypAddBox").attr('disabled', false);     	  
	       }else{
	    	   $("#Lev1TypAddBox").val("");
	    	   $("#Lev1TypAddBox").attr('disabled', false);	
	    	   $("#Lev2TypAdd").attr('disabled', true);
	    	   $("#Lev2TypAddBox").attr('disabled', true);
	           $("#Lev2TypAddBox").val("");
	           $("#Lev3TypAddBox").val("");
	           $("#Lev4TypAddBox").val("");
	           $("#Lev5TypAddBox").val("");
	           refreshAdd();   	   
	       }
	});  
 	$("#Lev2TypAdd").change(function(e){
		var selectType = $(this).val();	   
		createComboBox($("#Lev3TypAdd"), baseUrl + "code/counselListbox", {level: "3", upCodeId:selectType}, null);    
		$("#codeIdLevCheck").val(3);    
	   
		if($("#Lev2TypAdd").val() != "X"){
			var lev2 =$("#Lev2TypAdd option:selected").text();
			$("#Lev2TypAddBox").val(lev2);
			$("#Lev2TypAddBox").attr('disabled', true);
			$("#Lev3TypAdd").attr('disabled', false);
			$("#Lev3TypAdd").attr('disabled', false);
			$("#Lev3TypAddBox").attr('disabled', false);
			$("#EventcodeIdCheck").attr('disabled', false);
		
			$("#Lev4TypAdd").attr('disabled', true);
			$("#Lev4TypAddBox").attr('disabled', true);
		
			$("#Event4codeIdCheck").attr('disabled', true);
			$("#Lev5TypAdd").attr('disabled', true);
			$("#Lev5TypAddBox").attr('disabled', true);
	
			$("#Event5codeIdCheck").attr('disabled', true);
			
		} else{
			$("#Lev2TypAddBox").val("");
			$("#Lev2TypAddBox").attr('disabled', false);
			$("#Lev3TypAdd").attr('disabled', true);
			$("#Lev3TypAdd").attr('disabled', true);
			$("#Lev3TypAddBox").attr('disabled', true);
			$("#EventcodeIdCheck").attr('disabled', true);
			$("#Lev3TypEventAddBox").attr('disabled', true);
			$("#Lev3TypEventAddBox2").attr('disabled', true);
			$("#Lev3TypAddBox").val("");
			$("#Lev4TypAddBox").val("");
			$("#Lev5TypAddBox").val("");
         }	 
	        
	});  
	
		$("#Lev3TypAdd").change(function(e){  	   
			var selectType = $(this).val();	   
			createComboBox($("#Lev4TypAdd"), baseUrl + "code/counselListbox", {level: "4", upCodeId:selectType}, null);     
			$("#codeIdLevCheck").val(4);    
	    
			if($("#Lev3TypAdd").val() != "X"){
				var lev3 =$("#Lev3TypAdd option:selected").text();
				$("#Lev3TypAddBox").val(lev3);
				$("#Lev3TypAddBox").attr('disabled', true);
				$("#Lev3TypEventAddBox").attr('disabled', true);
				$("#Lev3TypEventAddBox2").attr('disabled', true);
				$("#EventcodeIdCheck").attr('disabled', true);						
			
				$("#Lev4TypAdd").attr('disabled', false);
				$("#Lev4TypAddBox").attr('disabled', false);
			
				$("#Event4CodeIdCheck").attr('disabled', false);
				
				$("#Lev3TypEventAddBox").val("");
				$("#Lev3TypEventAddBox2").val("");
				
			}else{
				$("#Lev3TypAddBox").val("");
				$("#Lev3TypAdd").attr('disabled', false);
				$("#Lev3TypAdd").attr('disabled', false);
				$("#Lev3TypAddBox").attr('disabled', false);
				$("#EventcodeIdCheck").attr('disabled', false);
			    $("#Lev3TypEventAddBox").attr('disabled', false);
				$("#Lev3TypEventAddBox2").attr('disabled', false); 
				$("#Lev4TypAddBox").val("");
				$("#Lev5TypAddBox").val("");
				
				$("#Lev4TypAddBox").attr('disabled', true);
				$("#Event4codeIdCheck").attr('disabled', true);
				$("#Lev4TypEventAddBox").attr('disabled', true);
				$("#Lev4TypEventAddBox2").attr('disabled', true); 
			}	   
	    
		});   
    
		$("#Lev4TypAdd").change(function(e){
			e.preventDefault();
			var selectType = $(this).val();	   
			 createComboBox($("#Lev5TypAdd"), baseUrl + "code/counselListbox", {level: "5", upCodeId:selectType}, null);     
			 $("#codeIdLevCheck").val(5);    

			if($("#Lel4TypAdd").val() != "X"){
				var lev4 =$("#Lev4TypAdd option:selected").text();
				$("#Lev4TypAddBox").val(lev4);
				$("#Lev4TypAddBox").attr('disabled', true);
				$("#Lev4TypEventAddBox").attr('disabled', true);
				$("#Lev4TypEventAddBox2").attr('disabled', true);
				$("#Event4CodeIdCheck").attr('disabled', false); 
				
				$("#Lev5TypAdd").attr('disabled', false);
				$("#Lev5TypAddBox").attr('disabled', false);
				$("#Lev5TypEventAddBox").attr('disabled', false);
				$("#Lev5TypEventAddBox2").attr('disabled', false);
				$("#Event5codeIdCheck").attr('disabled', false);	
				
				$("#Lev4TypEventAddBox").val("");
				$("#Lev4TypEventAddBox2").val("");
				
			}else{
				$("#Lev4TypAdd").attr('disabled', false);
				$("#Lev4TypAdd").attr('disabled', false);
				$("#Lev4TypAddBox").attr('disabled', false);
				$("#EventcodeIdCheck").attr('disabled', false);
			    $("#Lev4TypEventAddBox").attr('disabled', true);
				$("#Lev4TypEventAddBox2").attr('disabled', true);
				
				$("#Event4CodeIdCheck").attr('disabled', true);
			
				$("#Lev4TypAddBox").val("");
				$("#Lev5TypAddBox").val("");
			}	    
  
		});    
 
// SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS 등록버튼시 확인할것 실행
		$("#newTypeBtnAdd").click(function(e){	
			e.preventDefault();
			var activityCode="";
			var parentActivityCode="";
			var activityDesc="";
			var activityDescK="";
			var applyLevel="";
			var activityEventCd="";	
			var commandDesc="";
			var commandDesc1="";
		 
		 if($("#codeIdOk").val() != "1"  ){
			 MessageBox.dialog('<s:message code="code.msg.000021"/>');
			 $("#codeIdCheck").focus();
			 return;
		 }else if($("#codeIdOkSave").val() !== $("#codeIdCheck").val()){
			 MessageBox.dialog('<s:message code="code.msg.000022"/>');
			 return;
		 }else if($("#EventcodeIdCheck").val() != ""  ){
			 
		 }
		
		 activityCode  =  $("#codeIdCheck").val();

// 		alert($("#Lev1TypAddBox").val());
// 		alert($("#Lev2TypAddBox").val());
// 		alert($("#Lev3TypAddBox").val());
// 		alert($("#Lev4TypAddBox").val());
// 		alert($("#Lev5TypAddBox").val());
		if($("#Lev1TypAddBox").val() != "" && $("#Lev2TypAddBox").val() == "" && $("#Lev3TypAddBox").val() == "" &&  $("#Lev4TypAddBox").val() == ""  && $("#Lev5TypAddBox").val() == ""){		  
			
			applyLevel = "1";
			activityDesc = $("#Lev1TypAddBox").val();
			
		}else if($("#Lev1TypAddBox").val() != "" && $("#Lev2TypAddBox").val() != "" && $("#Lev3TypAddBox").val() == "" &&  $("#Lev4TypAddBox").val() == ""  && $("#Lev5TypAddBox").val() == ""){
			
			applyLevel = "2";
			activityDesc = $("#Lev2TypAddBox").val();
		 	parentActivityCode =  $("#Lev1TypAdd").val();
		 	
		}else if($("#Lev1TypAddBox").val() != "" && $("#Lev2TypAddBox").val() != "" && $("#Lev3TypAddBox").val() != "" &&  $("#Lev4TypAddBox").val() == ""  && $("#Lev5TypAddBox").val() == "" ){
			
			applyLevel = "3";
			activityDesc = $("#Lev3TypAddBox").val();
		 	parentActivityCode =  $("#Lev2TypAdd").val();
		 	
		 	activityEventCd = $("#EventcodeIdCheck").val();
		 	commandDesc= $("#Lev3TypEventAddBox").val();
		 	commandDesc1= $("#Lev3TypEventAddBox2").val();
		 	
		  
		}else if($("#Lev1TypAddBox").val() != "" && $("#Lev2TypAddBox").val() != "" && $("#Lev3TypAddBox").val() != "" &&  $("#Lev4TypAddBox").val() != ""  && $("#Lev5TypAddBox").val() == "" ){
		
			applyLevel = "4";
			activityDesc = $("#Lev4TypAddBox").val();
		 	parentActivityCode =  $("#Lev3TypAdd").val();
			activityEventCd = $("#Event4codeIdCheck").val();
		 	commandDesc= $("#Lev4TypEventAddBox").val();
		 	commandDesc1= $("#Lev4TypEventAddBox2").val();
		
		 
		}else if($("#Lev1TypAddBox").val() != "" && $("#Lev2TypAddBox").val() != "" && $("#Lev3TypAddBox").val() != "" &&  $("#Lev4TypAddBox").val() != ""  && $("#Lev5TypAddBox").val() != "" ){
			
			applyLevel = "5";
			activityDesc = $("#Lev5TypAddBox").val();
		 	parentActivityCode =  $("#Lev4TypAdd").val(); 
		 	activityEventCd = $("#Event5codeIdCheck").val();
		 	commandDesc= $("#Lev5TypEventAddBox").val();
		 	commandDesc1= $("#Lev5TypEventAddBox2").val();
			
	    }else{
	    	MessageBox.dialog('<s:message code="code.msg.000020"/>');
	       return;    	
	    }
       
		$.ajax({
			type : "GET",  
			async : false,
			url : baseUrl + "co/counselTypeAddCon" ,
			data : { activityCode : activityCode ,parentActivityCode: parentActivityCode , activityDesc:activityDesc
				   , activityDescK : activityDescK , applyLevel : applyLevel , activityEventCd : activityEventCd, commandDesc: commandDesc , commandDesc1 : commandDesc1 } ,
			dataType : 'json',
			success : function(data) {
				 MessageBox.dialog(activityCode+ '<s:message code="code.msg.000027"/>');

				 refreshAdd();
		        
			},error:function(data){
				//서버 비정상 동작시 구현
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
				//필요시 구현
			}
		}); //ajax
	
		  
	 }); 
// EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEee 등록버튼	 
	
		$("#EventcodeIdCheck").keyup(function(e){
			e.preventDefault();
			if($("#EventcodeIdCheck").val()!=""){
				
			    $("#Lev3TypEventAddBox").attr('disabled', false);
				$("#Lev3TypEventAddBox2").attr('disabled', false); 
				
			}else if($("#EventcodeIdCheck").val()==""){
			
				 $("#Lev3TypEventAddBox").attr('disabled', true);
			     $("#Lev3TypEventAddBox2").attr('disabled', true); 
			}			
		});
		
		$("#Event4CodeIdCheck").keyup(function(e){
			e.preventDefault();
			if($("#Event4codeIdCheck").val()!=""){
				
			    $("#Lev4TypEventAddBox").attr('disabled', false);
				$("#Lev4TypEventAddBox2").attr('disabled', false); 
				
			}else if($("#Event4codeIdCheck").val()==""){s
			
				 $("#Lev4TypEventAddBox").attr('disabled', true);
			     $("#Lev4TypEventAddBox2").attr('disabled', true); 
			}
		});
		
		$("#Event5codeIdCheck").keyup(function(e){
			e.preventDefault();
			if($("#Event5codeIdCheck").val()!=""){
				
			    $("#Lev5TypEventAddBox").attr('disabled', false);
				$("#Lev5TypEventAddBox2").attr('disabled', false); 
				
			}else if($("#Event5codeIdCheck").val()==""){
			
				 $("#Lev5TypEventAddBox").attr('disabled', true);
			     $("#Lev5TypEventAddBox2").attr('disabled', true); 
			}
		});
	
	 
});  //fun
</script>
	   
	   <!--SSSSSSSSSSSSSSSSSSS   1레벨 관련   -->
<div id="counselTypeLev1Add">
	<div class="title">
		<h1><s:message code="code.label.000075"/><!-- Type Lev1 --></h1><span class="btns3 save"><input type="button" id="refreshBtn" name="refreshBtn" value="refresh"/></span>
	</div>
	<table id="levTable1" width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
		<colgroup>
			<col width="15%" />				
			<col width="85%" />				
		</colgroup>		
		<tr style="width: 100px">
			<th><s:message code="co.label.newCodeId"/></th>
			<td>
				<input type="text" id="codeIdCheck" name="codeIdCheck" class="form_normal01" style="width: 300px;" value="" maxlength="4" >
				<!--   <input type="text" id="codeIdCheck" name="codeIdCheck" width="200" > -->
				<input type="hidden" id="codeIdOk" name="codeIdOk"> 
				<input type="hidden" id="codeIdLevCheck" name="codeIdLevCheck"> 
				<input type="hidden" id="codeIdOkSave" name="codeIdOkSave"> 
				<span class="btns7 save"><input type="submit" id="idCheckBtn"  value="idCheck"/>
			</td>
			<%-- 	<td><span class="btns7 save"><input type="submit" id="idCheckBtn"  value="idCheck"/></span> </td>  --%>
		</tr>
		<tr style="width: 100px">  
			<font color="red"><s:message code="code.msg.000024"/></font>  
		</tr>	
		<tr>
			<th><s:message code="code.label.000075"/></th>
			<td>
			<select id="Lev1TypAdd" name="Lev1TypAdd"  class="form_select01" title="Lev1Typ" required="required" style="width:300px; border : 1">		
				<option value="X"><s:message code="code.msg.choose"/></option> 
			</select>
			</td>
		</tr>
		<tr>
			<th><s:message code="code.label.000091"/></th>				
			<td><input type="text" id="Lev1TypAddBox" name="Lev1TypAddBox" class="form_select01" style=" width: 300px; border: 1;   "/></td>
		</tr>		
	</table>
</div>
<div class="f_right"> 
	<span class="btns7 save"><input type="submit" value='<s:message code="cmn.btn.add"/>' id="newTypeBtnAdd1" /></span> 
</div>
	<!-- SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSs 2레벨 스타트 -->
<div id="counselTypeLev2Add">
	<div class="title">
		<h1><s:message code="code.label.000076"/><!--  Type Lev2--></h1>
	</div>
	<table id="levTable2" width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01" >
		<colgroup>
			<col width="15%" />				
			<col width="85%" />				
		</colgroup>
		<tr>
			<th><s:message code="code.label.000076"/></th>
			<td> 
				<select id="Lev2TypAdd" name="lev2" style="width:40%; " class="form_select01" style="width:300px; border=1" disabled>
				<option value="X"><s:message code="code.msg.choose"/></option> 
				<!--  <input type="text" id="Lev2TypAddBox" name="Lev2TypAddBox" style="display: ;" />; -->
				</select>
			</td>
		</tr>
		<tr>
			<th><s:message code="code.label.000092"/></th>			
			<td><input type="text" id="Lev2TypAddBox" name="Lev2TypAddBox" class="form_select01" style="width: 300px; border: 1;" disabled/></td>
		</tr>					
	</table>
		<input type="hidden" value="2" in="lev2Hidden">
</div>		
	
	<!-- SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss3레벨  -->
	<div id="counselTypeLev3Add">	
		<div class="title">
			<h1><s:message code="code.label.000077"/><!--  Type Lev3--></h1>
		</div>
		<table id="levTable3" width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01" >
			<colgroup>
				<col width="15%" />	
				<col width="85%" />		
			</colgroup>
		 	<tr>
				<th><s:message code="code.label.000077"/></th>
				<td><select id="Lev3TypAdd" name="lev" style="width:40%; " class="form_select01" disabled>
			        <option value="X"><s:message code="code.msg.choose"/></option> 
				    </select>
				       
				  <!--  <input type="text" id="Lev3TypAddBox" name="Lev1TypAddBox" style="display: ;"/>; -->
				</td>
			</tr> 
			<tr>
			<th><s:message code="code.label.000096"/></th>			
			  <td>
			  <%--  <select id="EventCode3" name="lev" style="width:40%; " class="form_select01">
			   <option value="X"><s:message code="code.msg.choose"/></option> 
			   </select>			  --%>
			    <input type="text" id="EventcodeIdCheck" name="EventcodeIdCheck" class="form_select01" maxlength="5" style="width: 300px;" value="" disabled>
			  </td>
			 </tr>
			<tr>
			<th><s:message code="code.label.000093"/></th>				
			    <td><input type="text" id="Lev3TypAddBox" name="Lev3TypAddBox" class="form_select01" style="width: 300px; border: 1;" disabled/></td>
			    
			</tr>
			<tr>	
			   <th><s:message code="code.label.000097"/></th>		 		
			     <td>
			      <input type="text" id="Lev3TypEventAddBox" name="Lev3TypEventAddBox" class="form_select01" style=" width: 180px; border: 1;" disabled/>		
			      <input type="text" id="Lev3TypEventAddBox2" name="Lev3TypEventAddBox2" class="form_select01" style=" width: 180px; border: 1;" disabled/>
			    </td>		   		    
			</tr>								
		</table>
		<input type="hidden" value="3" in="lev3Hidden">
		<div class="contents_box mt_5">
	</div>
	
	
	
	<!--    SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS  4레벨  -->
	<div id="counselTypeLev4Add">	
		<div class="title">
			<h1><s:message code="code.label.000078"/><!--  Type Lev4--></h1>
		</div>
		<table id="levTable4" width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
			<colgroup>
				<col width="15%" />				
				<col width="85%" />				
			</colgroup>
		 	<tr>
				<th><s:message code="code.label.000078"/></th>
				<td>
				    <select id="Lev4TypAdd" name="lev" style="width:40%; " class="form_select01" disabled>
			        <option value="X"><s:message code="code.msg.choose"/></option> 
				    </select>
<!-- 				    <input type="text" id="Lev4TypAddBox" name="Lev4TypAddBox" style="display: ;"/>; -->
				</td>
			</tr> 
				<tr>
			<th><s:message code="code.label.000098"/></th>			
			  <td>
			  <%--  <select id="EventCode3" name="lev" style="width:40%; " class="form_select01">
			   <option value="X"><s:message code="code.msg.choose"/></option> 
			   </select>			  --%>
			    <input type="text" id="Event4CodeIdCheck" name="Event4codeIdCheck" class="form_select01" maxlength="5" style="width: 300px;" value="" disabled>
			  </td>
			 </tr>
			<tr>
			<tr>
			<th><s:message code="code.label.000094"/></th>		
			    <td><input type="text" id="Lev4TypAddBox" name="Lev4TypAddBox" class="form_select01" style="display: ; width: 300px; border: 1;" disabled/></td>
			</tr>
			<tr>
		 	 <tr>
			  <th><s:message code="code.label.000099"/></th>			
			     <td>
			      <input type="text" id="Lev4TypEventAddBox" name="Lev4TypEventAddBox" class="form_select01" style=" width: 180px; border: 1;" disabled/>		
			      <input type="text" id="Lev4TypEventAddBox2" name="Lev4TypEventAddBox2" class="form_select01" style=" width: 180px; border: 1;" disabled/>
			    </td>		   		    
			</tr>		 				
		</table>
		<!-- <input type="hidden" value="3" in="lev3Hidden"> -->
	</div>
	<!-- SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS  5레벨                       -->
	<div id="counselTypeLev5Add">	
		<div class="title">
			<h1><s:message code="code.label.000079"/><!--  Type Lev5--></h1>
		</div>
		<table id="levTable5" width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
			<colgroup>
				<col width="15%" />				
				<col width="85%" />				
			</colgroup>
<!--   		 	<tr>  -->
<!-- 				<th>Lev5 Type</th> -->
<%-- 				<td><select id="Lev5TypAdd" name="lev" style="width:40%; " class="form_select01" disabled> --%>
<!-- 			        <option value="X"><s:message code="code.msg.choose"/></option>  -->
<%-- 				    </select> --%>
<!-- 				   <input type="text" id="Lev3TypAddBox" name="Lev1TypAddBox" style="display: ;" disabled/>; -->
<!-- 				</td> -->
<!-- 			</tr>  -->
				<tr>
			<th><s:message code="code.label.000100"/></th>			
			  <td>
			  <%--  <select id="EventCode3" name="lev" style="width:40%; " class="form_select01">
			   <option value="X"><s:message code="code.msg.choose"/></option> 
			   </select>			  --%>
			    <input type="text" id="Event5codeIdCheck" name="Event5codeIdCheck" class="form_select01" maxlength="5" style="width: 300px;" value="" disabled>
			  </td>
			 </tr>
			<tr>
			<th><s:message code="code.label.000095"/></th>			
			    <td><input type="text" id="Lev5TypAddBox" name="Lev5TypAddBox" class="form_select01" style="display: ; width: 97; border: 1;" disabled/></td>
			</tr>
			 <tr>
			 <th><s:message code="code.label.000101"/></th>			
			    <td>
			      <input type="text" id="Lev5TypEventAddBox" name="Lev5TypEventAddBox" class="form_select01" style=" width: 180px; border: 1;" disabled/>		
			      <input type="text" id="Lev5TypEventAddBox2" name="Lev5TypEventAddBox2" class="form_select01" style=" width: 180px; border: 1;" disabled/>
			    </td>		   		    
			</tr> 
		</table>
	</div>			
	</div>
		 <div class="f_right"> 
		 	<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.add"/>' id="newTypeBtnAdd" /></span> 
			<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.close"/>'  id="codeViewCloseBtnAdd"/></span>
	     </div>