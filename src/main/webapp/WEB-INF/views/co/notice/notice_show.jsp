<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="code" uri="http://www.ohQuest.com/jsp/tags/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script type="text/javascript">
//창닫기
$("#closeNoticeBtn").click(function(e) {
	Dialog.close('#noticeViewDialog');
});
</script>
<input type="hidden" id="seqNo" name="seqNo" value="-1">
<div class="contents_box mt_5" style="width:724px;">
<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01 mt_10">
	<colgroup>
		<col width="15%" />
		<col width="70%" />
		<col width="15%"/>
	</colgroup>
	<tr align="left">
		<th><s:message code="cs.lable.notice.000001" /></th>
		<td colspan="2">${notice.notice_title}</td>
	</tr>	
	<tr>
		<th><s:message code="cs.lable.notice.000003" /></th>
		<td align="left" >${notice.notice_personid}</td>
		<td align="center">${notice.notice_ndate}</td>
	</tr>
	<tr align="left" height="240px">
		<th><s:message code="cs.lable.notice.000002" /></th>
		<td colspan="2" style="vertical-align: top; margin-top:20px;">
				<pre><textarea rows="15" cols="85"><c:out value="${notice.notice_content}" escapeXml="true"/></textarea></pre>
		</td> 
	</tr>
</table>
<c:if test="${fn:length(notice.csNoticeFiles) > 0}">
<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01 mt_5" width="100%" id="oldFileAttach">
	<colgroup>
		<col width="15%" />
		<col width="85%" />
	</colgroup>
	<tr> 	
		<th><s:message code="cs.lable.notice.000016"/></th>
		<td width="100%">
		<c:forEach items="${notice.csNoticeFiles}" var="noticeFile" varStatus="status">
			  <%-- 	<th width="0%" style="display:none">
				  	<input type="hidden" id="delFlag${status.index }" name="delFlag" checked/>
				  	<input type='hidden' id='csNoticeFiles[${status.index}].workType' name='csNoticeFiles[${status.index}].workType' value='NONE'/>
					<input type='hidden' id='csNoticeFiles[${status.index}].fileDvCd' name='csNoticeFiles[${status.index}].fileDvCd' value='${noticeFile.fileDvCd}'/>
					<input type='hidden' id='csNoticeFiles[${status.index}].fileDtlDvCd' name='csNoticeFiles[${status.index}].fileDtlDvCd' value='${noticeFile.fileDtlDvCd}'/>
					<input type='hidden' id='csNoticeFiles[${status.index}].fileSeqno' name='csNoticeFiles[${status.index}].fileSeqno' value='${noticeFile.fileSeqno}'/>
				  	<label for="delFlag${status.index}"><code:out codeType="AuthCode" value="${noticeFile.fileDtlDvCd}" /></label>								    	
				  	</th> --%>
		<a href="<c:url value="/notice/downFile"/>?downLoadPath=${noticeFile.filePath}&fileName=<c:out value="${noticeFile.fileName}"/>" target="_blank"><c:out value="${noticeFile.fileName}"/></a>
		<c:if test="${status.index != fn:length(notice.csNoticeFiles)-1 }">
		&nbsp;<strong>,</strong>	  									 
		</c:if>   									    	
	   </c:forEach>
	  	</td> 
  	</tr>
</table>
</c:if>
<div class="contents_box mt_5" style="width:724px;">
	<!-- 버튼 //-->
		<div class="f_left" id="fileCnt">
		</div>
		<div id="fileList">
		</div>
		<div class="f_right">	
			<span class="btns9 save"> <input type="button" value="<s:message code="cmn.btn.close"/>" id="closeNoticeBtn" /></span>
		</div>					
	
	<!--// 버튼 -->
	</div>
</div>