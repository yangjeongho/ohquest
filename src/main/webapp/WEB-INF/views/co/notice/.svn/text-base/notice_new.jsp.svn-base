<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>
<script  type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<script type="text/javascript">

	$(function(e){
	});
	
	$("#newNoticeRegForm #updateNoticeBtn").click(function(e) {
		e.preventDefault();
		//alert($("#newNoticeRegForm").serialize());
		$.ajax({
			type : "POST",
			async : false,
			url : baseUrl + "notice/update_notice",
			dataType : 'json',
			data : $("#newNoticeRegForm").serialize(),
			success : function(data) {
				//데이터 저장이  성공하였을 경우
				$("#newNoticeRegForm #notice_seqno").val(data.notice_seqno);
					//파일 저장 Start
					noticeFileUpload(function(){
						//customer.custNo = data.object;
						notice.notice_seq = data.object;
						if(eventBtn == "SaveConfirm" || eventBtn == "Confirm"){
							callBackNotice(noitce);
						}
						if(eventBtn == "SaveConfirm" || eventBtn == "Save"){
							MessageBox.dialog("<s:message code="cmn.msg.saved"/>", function(){
								Dialog.close('#${param.dialogName}');
							});	
						}	
					});
			},
			complete : function(jqXHR, textStatus) {
				MessageBox.dialog('<s:message code="cmn.label.SaveComplete"/>');
				Dialog.close('#${param.dialogName}');
				//부모창 화면 조회
				$("#noticeSearchForm #searchNoticeBtn").click();
				//부모창 화면 초기화
				$("#noticeRegForm #notice_seqno").val(-1);
 	  	 		$("#noticeRegForm #notice_title").val("");
 	  	 		$("#noticeRegForm #notice_content").val("");
 	  	 		$("#noticeRegForm #notice_personid").val("");
 	  	 		$("#noticeRegForm #notice_ndate").val("");
 	  	 		$("#noticeRegForm #notice_type").val("01");
 	  	 		$("#noticeRegForm #fileCnt").html("");
			}
		});
	});

	function notice_detail() {
		Dialog.open({
			div : '#noticeDialog',
			url : baseUrl + "co/notice/notice_detail",
			title :'<s:message code="cmn.label.notice"/>',//공지사항
			width : 800,
			height : 700,
			modal : true
		});
	}

	//삭제
	$("#deleteNoticeBtn").click(function(e) {
		e.preventDefault();
			var items_str = gf_getMultiSelectedGridData("#noticeSearchForm #noticeTable");
			var seqs_str = "";
			$.each(items_str,function(key,data){
				seqs_str = seqs_str+data.notice_seqno+",";
			});
			
			if(items_str != "")
			{
			$.ajax({
				type : "POST",  
				async : false,
				url : baseUrl + "notice/notice_detail?deleteItem="+seqs_str+"&_method=DELETE",
						//&_method=DELETE will be using as indicator
				dataType : 'json',
				success : function(data) {
					if(data != ''){
						MessageBox.dialog('<s:message code="cmn.label.DeleteComplete"/>');
						Dialog.open({
							div : '#noticeDialog',
							url : baseUrl + "notice/notice_detail"
									+ "?dialogName=noticeDialog",
							title :'<s:message code="cmn.label.notice"/>',//공지사항
							width : 800,
							height : 700,
							modal : true
						});
					}else{
						MessageBox.dialog("err.500");
					}
				},
				error:function(data){
					MessageBox.dialog("err.500");
				},
				complete:function(jqXHR, textStatus){			
			}
		});	
		}else{
			MessageBox.dialog('<s:message code="cs.msg.notice.0002"/>');
		}
		});
	
	
	//파일Add 버튼 클릭
	$("#newNoticeRegForm #addAttachBtn").click(function(e){
		e.preventDefault();
		var fileDtlDvCd = $("#newNoticeRegForm #fileDtlDvCdSlt").val();
		if(fileDtlDvCd==''){
			alert("<s:message code="cs.msg.cust.0027"/>");
			return ;
		}
		if(fileDtlDvCd == '0'){
			var existProf = false ;
			var profileObj = null;
			$("#newNoticeRegForm [id$=fileDtlDvCd]").each(function(e){
				if($(this).val() == '0'){
					existProf = true ;
					profileObj = $(this).prev().prev().prev();
					return false ;
				}
			});
			if(existProf == true && $(profileObj).next().val() == 'NONE' && confirm("<s:message code="cs.msg.cust.0030"/>")){
				$(profileObj).attr('checked', false).attr('disabled', true);
				$(profileObj).next().val('DELETE');
			}else if(existProf == true && $(profileObj).next().val() == 'CREATE'){
				alert("<s:message code="cs.msg.cust.0031"/>");
				return ;
			}
		}
		var attachInfo = $("<span style='float:left;'><input type='file' id='attach' name='attach' value='attach'/> <a href='#' id='delBtn' name='delBtn'><img src='<s:url value="/resources/images/btn/sbtn_del.gif"/>'/></a></span>");
		if($("#newNoticeRegForm #attachFileDiv").html()!= ''){
			var exist  = true ;
			$("#newNoticeRegForm #attachFileDiv").find('[id=attach]').each(function(e){
				if($(this).val()==''){
					exist  = false ;
					return false ; 
				}
			});
			if(!exist){
				alert("<s:message code="cs.msg.batch.notselected"/>");
				return ;
			}
		}
		$(attachInfo).find('[name=delBtn]').bind('click', deleteAttach) ;
		$(attachInfo).find('[name=attach]').bind('change', checkChangeAttach) ;
		$(attachInfo).appendTo($("#newNoticeRegForm #attachFileDiv"));
		var baseIndex = $("#newNoticeRegForm #attachFileDiv").find('[id=attach]').length-1;
		changeOldFileIndex("workType"	, baseIndex, false);
		changeOldFileIndex("fileDvCd"	, baseIndex, false);
		changeOldFileIndex("fileDtlDvCd", baseIndex, false);
		changeOldFileIndex("fileSeqno"	, baseIndex, false); 
		$(attachInfo).append("<input type='hidden' id='csNoticeFiles["+baseIndex+"].workType'    name='csNoticeFiles["+baseIndex+"].workType' value='CREATE'/>");
		$(attachInfo).append("<input type='hidden' id='csNoticeFiles["+baseIndex+"].fileDvCd'    name='csNoticeFiles["+baseIndex+"].fileDvCd' value='1'/>");
		$(attachInfo).append("<input type='hidden' id='csNoticeFiles["+baseIndex+"].fileDtlDvCd' name='csNoticeFiles["+baseIndex+"].fileDtlDvCd' value='"+fileDtlDvCd+"'/>");
		$(attachInfo).append("<input type='hidden' id='csNoticeFiles["+baseIndex+"].fileSeqno'   name='csNoticeFiles["+baseIndex+"].fileSeqno' value=''/>");
	});
	
	
	var deleteAttach = function(){
		var idx = 0;
		var oThis = $(this).parent();
		var attachLen = $("#newNoticeRegForm #attachFileDiv").find('[id=attach]').length;
		var baseIndex = 0 ;
		if(attachLen == 0 ){
			baseIndex = 0 ;
		}else{
			baseIndex = attachLen ;
		}
		$("#newNoticeRegForm #attachFileDiv").find('[id=attach]').each(function(e){
			if($(this).parent().html() == $(oThis).html()){
				idx = $(this).parent().index();
				return false ;
			}
		});
		changeNewFileIndex("workType"	, idx);
		changeNewFileIndex("fileDvCd"	, idx);
		changeNewFileIndex("fileDtlDvCd", idx);
		changeNewFileIndex("fileSeqno"	, idx);
		$(this).parent().empty().remove();	
		changeOldFileIndex("workType"	, baseIndex, true);
		changeOldFileIndex("fileDvCd"	, baseIndex, true);
		changeOldFileIndex("fileDtlDvCd", baseIndex, true);
		changeOldFileIndex("fileSeqno"	, baseIndex, true);
	};
	
	var checkChangeAttach = function(){
		var fileName = $.trim($(this).val().toLowerCase());
		/*
		if(fileName != '') {				
			if(!(fileName.lastIndexOf(".jpg") != -1 )){
				alert("<s:message code="cs.msg.cust.0028"/>");
				$(this).val('');
				return false;
			}
		}*/
	};
	
	function changeNewFileIndex(compName, currIdx){
		var idx = currIdx ;
		var del = false ;
		$('#newNoticeRegForm #attachFileDiv [id*='+compName+']').each(function(i, e){
			if(i > idx){
				var oldIdx = i;	
				var newIdx = i - 1;	
				
				var oldId = $(e).attr('id');
				var newId = new String(oldId).replace('customerFiles\['+ oldIdx +'\]\.'+compName, 'customerFiles\['+ newIdx +'\]\.'+compName);
				$(e).attr('id', newId);
				
				var oldName = $(e).attr('name');
				var newName = new String(oldName).replace('customerFiles\['+ oldIdx +'\]\.'+compName, 'customerFiles\['+ newIdx +'\]\.'+compName);			
				$(e).attr('name', newName);
			}
			
		});		
	}
	
	function changeOldFileIndex(compName, baseIndex, minus){
		var idx = baseIndex ;
		$('#newNoticeRegForm #oldFileAttach [id*='+compName+']').each(function(i, e){
			var oldIdx = idx ;			
			var newIdx = oldIdx +1;
			
			if(minus == true){
				newIdx = oldIdx - 1;
			}
			var oldId = $(e).attr('id');
			var newId = new String(oldId).replace('csNoticeFiles\['+ oldIdx +'\]\.'+compName, 'csNoticeFiles\['+ newIdx +'\]\.'+compName);
			$(e).attr('id', newId);
			
			var oldName = $(e).attr('name');
			var newName = new String(oldName).replace('csNoticeFiles\['+ oldIdx +'\]\.'+compName, 'csNoticeFiles\['+ newIdx +'\]\.'+compName);			
			$(e).attr('name', newName);
			
			idx++ ;
		});		
	}
	
	$("#newNoticeRegForm [id^=delFlag]").click(function(e){
		alert("delFlag");
		if($(this).is(':checked') == 'true'){
			$(this).next().val('NONE');
		}else {
			$(this).next().val('DELETE');
		}
	});
	
	
	function noticeFileUpload(callback){
		var existFile = 'false' ;
		var chkFile = 'true' ;
		
		var i = 0 ;

		$('#attachFileDiv').find('[id=attach]').each(function(e){
			var fileName = $.trim($(this).val().toLowerCase());
			if(fileName != '') {
				existFile = 'true' ;				
			}else{
				//마지막은 혹시나 파일 선택하지 않았으면 지워버린다.
				$(this).parent().empty().remove();
			}
			i++;
		});
		$("#newNoticeRegForm [id$=workType]").each(function(e){
			if($(this).val() == 'CREATE' || $(this).val() == 'DELETE'){
				existFile = true;
				return false ;
			}
		});
		if(chkFile == 'true' && existFile == 'false') {
			if(typeof(callback) == 'function'){
            	setTimeout(callback, 100) ;
    		}
			return ;
		}
		$(this).loadingDialog();
		$('[id=newNoticeRegForm]').ajaxSubmit({ 
			url : baseUrl + "notice/notice_upload"+($.browser.msie ? '.html' :''), //"cs/cust/csCust001/upload" +($.browser.msie ? '.html' :''),
			contentType: "multipart/form-data",			
			success : function(data) {
				if(data.resultCode == 'FAIL'){
					MessageBox.dialog(data.message); 	
				}else if(data.resultCode == 'SUCCESS'){
		            $(this).hideLoading();
		            
		            if(typeof(callback) == 'function'){
		            	setTimeout(callback, 100) ;
		    		}
				}				
			}
        });	
		return false ;
	}
	
	
	function callBackNotice(notice){
		try{
			/* 
			if($("#newnoticeregform").find("#custdvcode").is('select')){
				customer.custdvcodename = $("#newnoticeregform").find("#custdvcode :selected").text();
				customer.custkindcodename = $("#newnoticeregform").find("#custkindcode  :selected").text();
			}else{
				customer.custdvcodename = $("#newnoticeregform").find("#custdvcodetext").val();
				customer.custkindcodename = $("#customerregistform").find("#custkindcodetext").val();	
			}
			 */	
		}catch(e){
			alert(e);
		}
		
		if(eval("window.${param.callBack}") != null){
			var funcName = eval("${param.callBack}");
			funcName(notice);
		}
	}
	
</script>

<form id="newNoticeRegForm">
	<!-- 입력 테이블 //-->
	<table width="100%" cellpadding="0" cellspacing="0" border="1"
		class="table_view01 mt_10">
		<colgroup>
			<col width="30%" />
			<col width="70%" />
		</colgroup>
		
		<input type="hidden" id="notice_seqno" name="notice_seqno" value="-1">

		<tr>
			<th><s:message code="cmn.label.title"/></th>
			<td><input type="text" class="form_normal01"
				style="width: 100%;" id="notice_title" name="notice_title" /></td>
		</tr>
		<tr>
			<th><s:message code="cmn.label.author"/></th>
			<td><input type="text" class="form_normal01"
				style="width: 100%;" id="notice_personid" name="notice_personid" value="${userId}"
				readonly="readonly" />
			</td>
		</tr>
		<tr>
			<th><s:message code="cs.lable.notice.000004"/></th>
			<td>
				<select id="notice_type" name="notice_type"  class="form_select01" style="width: 124px;">
					<option value="01"><s:message code="cs.lable.notice.000011" /></option>
					<option value="02"><s:message code="cs.lable.notice.000004" /></option>
					<option value="03"><s:message code="cs.lable.notice.000012" /></option>
				</select>
			</td>
		</tr>
		<tr>
			<th><s:message code="cmn.label.content"/></th>
			<td><textarea rows="10" cols="85" id="notice_content"
					name="notice_content"></textarea>
		</tr>
		<tr>
			<td style="width:300px; vertical-align: top; margin-top:20px;background-color:#E5F2EB;">
				<table width="100%">
					<tr>
					<th><s:message code="cs.lable.notice.000013" /><br>
						<div class="f_right">
							<span class="btns7 save"><input type="button" value="<s:message code="cmn.btn.add"/>" id="addAttachBtn"/></span>
						</div>
					</th>
					</tr>										
				</table>
			</td>
			<td style="width:50%;">
				<table >
					<tr><td><div id="attachFileDiv"></div></td></tr>
				</table>								
				<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01 mt_5" width="100%" id="oldFileAttach">
				 <%--<c:forEach items="${customer.customerFiles}" var="imageFile" varStatus="status"> --%>
				 <c:forEach items="${notice.csNoticeFiles}" var="noticeFile" varStatus="status">
			    	<tr><th width="30%">
			    	<input type="checkbox" id="delFlag${status.index }" name="delFlag" checked/>
			    	<input type='hidden' id='csNoticeFiles[${status.index}].workType' name='csNoticeFiles[${status.index}].workType' value='NONE'/>
					<input type='hidden' id='csNoticeFiles[${status.index}].fileDvCd' name='csNoticeFiles[${status.index}].fileDvCd' value='${noticeFile.fileDvCd}'/>
					<input type='hidden' id='csNoticeFiles[${status.index}].fileDtlDvCd' name='csNoticeFiles[${status.index}].fileDtlDvCd' value='${noticeFile.fileDtlDvCd}'/>
					<input type='hidden' id='csNoticeFiles[${status.index}].fileSeqno' name='csNoticeFiles[${status.index}].fileSeqno' value='${noticeFile.fileSeqno}'/>
			    	<label for="delFlag${status.index}"><code:out codeType="AuthCode" value="${noticeFile.fileDtlDvCd}" /></label>								    	
			    	</th>
			    	<td width="70%">
			    	<a href="<c:url value="/notice/downFile"/>?downLoadPath=${noticeFile.filePath}&fileName=<c:out value="${noticeFile.fileName}"/>" target="_blank"><c:out value="${noticeFile.fileName}"/></a>
			    	</td></tr>								    									    	
			     </c:forEach>
				</table>
			</td>
		</tr>
	</table>
	<!--// 입력 테이블 -->

	<!-- 컨텐츠를 감싸는 박스 //-->
	<div class="contents_box mt_5">
		<!-- 버튼 //-->
		
			<div class="f_right">
				<span class="btns9 save"><input type="submit" value="<s:message code="cmn.btn.save"/>"id="updateNoticeBtn" /> </span>
				<!--<span class="btns9 save"><input type="submit" value= '<s:message code="cmn.btn.delete"/>'  id="deleteNoticeBtn" /></span>-->		
			</div>
		
		<!--// 버튼 -->
	</div>
</form>