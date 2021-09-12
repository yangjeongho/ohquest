<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set value='${sessionScope["org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE"].language}' var="lang" scope="session"/>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>
<script type="text/javascript">
	$(function(e){
		
		$("#newCodeBtn, #modifyCodeBtn").click(function(e){
			e.preventDefault();
			var url = "";
			var title ="" ;
			if(this.id == 'newCodeBtn'){
				title = '<s:message code="code.label.000086"/>' ;
				url = baseUrl+"code/form/${lang}?codeGroup="+$("#codeGroup :selected").val();
			}else if(this.id == 'modifyCodeBtn'){
				title = '<s:message code="code.label.000087"/>' ;
				url = baseUrl+"code/form/"+$("#codeGroup :selected").val()+"/"+$("#code :selected").val()+"/${lang}" ;
			}
			
			Dialog.open({
				div : '#dialogNewCode', 
				url : url,
				title : title, 
				width : 600, 
				height : 480, 
				modal : true
			});	
		});
		$("#codeDetailView").find("#codeGroup").change(function(e){
			e.preventDefault();
			$(this).loading({position:'right'}); 
			var codeGroup = $(this).val();
			if(codeGroup == ''){
				$("#code").empty().append("<option value=''><s:message code="code.msg.000001"/></option>").attr('disabled', 'disabled');
				$("#modifyCodeBtn").attr('disabled', 'disabled');
				$("#modifyCodeBtn").parent().removeClass('btns7').addClass('btns8');
				$(this).hideLoading();
				return ;
			}
			$.ajax({
				type : "GET",  
				async : true,
				url : baseUrl + "code/"+codeGroup+"/"+baseLang ,
				dataType : 'html',
				success : function(data) {
					if(data != ''){
						$("#code").empty().append(data).removeAttr('disabled');
						$("#modifyCodeBtn").attr('disabled', 'disabled');
						$("#modifyCodeBtn").parent().removeClass('btns7').addClass('btns8');
					}					
				},	error:function(data){
					//서버 비정상 동작시 구현
					MessageBox.dialog("err.500");
				}, complete:function(jqXHR, textStatus){
					;//필요시 구현
					$(this).hideLoading();
				}
			});	
		});
		
		$("#codeDetailView").find("#code").change(function(e){
			e.preventDefault();
			var code = $(this).val();
			if(code != ''){
				$("#modifyCodeBtn").removeAttr('disabled');
				$("#modifyCodeBtn").parent().removeClass('btns8').addClass('btns7');
			}else{
				$("#modifyCodeBtn").attr('disabled', 'disabled');
				$("#modifyCodeBtn").parent().removeClass('btns7').addClass('btns8');
			}
		});
		
		$("#codeViewCloseBtn").click(function(e){
			e.preventDefault();
			Dialog.close('#dialogContent');
		});
		
		$("#csvUploadBtn").click(function(e){
			e.preventDefault();
			var fileName = $.trim($('[id=attach]').val().toLowerCase());
			$("#uploadResult").empty();
			if(fileName == '') {
				MessageBox.dialog('<s:message code="code.msg.000002"/>');
				return false;
			}
			if(!(fileName.lastIndexOf(".csv") != -1 )){
				MessageBox.dialog("<s:message code="code.msg.000003"/>");
				return false;
			}
			
			MessageBox.confirm('<s:message code="code.msg.000004"/>', function(){
				
				$('[id=csvUploadForm]').ajaxSubmit({ 
					url : baseUrl + "code/upload" +($.browser.msie ? '.html' :''),
				  	contentType: "multipart/form-data",
					success : function(e) { 
						if($.browser.msie){
							e = JSON.parse(e);	
						}
		                $("#uploadResult").empty().append(e);
		                reloadCodeType("");
					}
	            });	
			});
			
			return false ;
		});
	});
	
	$("#refreshBtn").click(function(e){
		e.preventDefault();		
		reloadCodeType($("#codeDetailView").find("#codeGroup :selected").val());
		$("#uploadResult").empty(); //업로드 div clear
		$('[id=attach]').val("");		
	});
	
	function reloadCodeType(codeGroup){
		$("#csvUploadBtn").loadingDialog();
		if(codeGroup==""){
			codeGroup="XXX";
		}
		$.ajax({
			type : "GET",  
			async : false,
			url : baseUrl + "codetype/"+codeGroup+"/"+baseLang ,
			dataType : 'html',
			success : function(data) {
				if(data != ''){
					$("#codeDetailView").find("#codeGroup").empty().append(data);						
					$("#codeDetailView").find("#codeGroup").change();						
					$("#modifyCodeBtn").attr('disabled', 'disabled');
					$("#modifyCodeBtn").parent().removeClass('btns7').addClass('btns8');
				}					
			},	error:function(data){
				//서버 비정상 동작시 구현
				MessageBox.dialog("err.500");
			}, complete:function(jqXHR, textStatus){
				;//필요시 구현
			}
		});	
	}
</script>

	<div id="codeDetailView">
		<div class="title">
			<h1><s:message code="code.label.000001"/></h1><span class="btns3 save"><input type="button" id="refreshBtn" name="refreshBtn" value="<s:message code="cmn.label.refresh"/>"/></span>
		</div>
		<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
			<colgroup>
				<col width="15%" />				
				<col width="85%" />				
			</colgroup>
			<tr>
				<th><s:message code="code.label.000002"/></th>
				<td><select id="codeGroup" name="codeGroup" style="width:40%; " class="form_select01">
				<option value=""><s:message code="code.msg.000001"/></option>
				<c:forEach items="${codeTypeList}" var="codeType"><option value="${codeType.codeGroup}"><c:out value="${codeType.codeGroup}"/></option></c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th><s:message code="code.label.000003"/></th>
				<td><select id="code" name="code" style="width:40%;" class="form_select01" disabled="diabled">
				<option value=""><s:message code="code.msg.000001"/></option>				
				</select>
				</td>
			</tr>			
		</table>
	</div>
		
	<div class="contents_box mt_5">
		<!-- 버튼 //-->
		<div class="f_right"> 
			<span class="btns7 save"><input type="submit" value='<s:message code="cmn.btn.addCode"/>' id="newCodeBtn" /></span>
			<span class="btns8 save"><input type="submit" disabled="disabled" value='<s:message code="cmn.btn.modifyCode"/>' id="modifyCodeBtn" /></span>
			<span class="btns7 save"><input type="submit" value= '<s:message code="cmn.btn.close"/>'  id="codeViewCloseBtn"/></span>
		</div>
		<!--// 버튼 -->
	</div>	
	<form id="csvUploadForm" name="csvUploadForm" action="<s:url value="/code/upload"/>" method="POST" enctype="multipart/form-data"> 		
	<div id="csvUploadDialog">
		<div class="title">
			<h1><s:message code="cmn.msg.fileupload"/></h1>
		</div>
		<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
			<colgroup>
				<col width="15%" />				
				<col width="85%" />				
			</colgroup>
			<tr>
				<th>CSV Template</th>
				<td><a href="<s:url value="/resources/csv/code_en.csv"/>" target="_blank"><s:message code="code.msg.000009"/></a></td>
			</tr>
			<tr>
				<th><s:message code="cmn.label.file"/></th>
				<td><input type="file" id="attach" name="attach"/>
				</td>
			</tr>			
		</table>
	</div>
	<div class="contents_box mt_5">
		<!-- 버튼 //-->
		<div class="f_right"> 
			<span class="btns7 save"><input type="button" value="<s:message code="code.label.000004"/>" id="csvUploadBtn" /></span>
		</div>
		<!--// 버튼 -->
	</div>
	<br/>
	<div id="uploadResult">
	</div>
	</form>	
	
