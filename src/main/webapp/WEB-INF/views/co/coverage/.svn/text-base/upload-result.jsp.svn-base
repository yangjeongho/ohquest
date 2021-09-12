<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
<colgroup>
	<col width="40%" />	
	<col width="15%" />	
	<col width="15%" />
	<col width="15%" />				
	<col width="15%" />				
</colgroup>

<tr>
	<th style="text-align:center;"><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
	<th style="text-align:center;"><s:message code="co.label.instStartDttm"/></th>
	<th style="text-align:center;"><s:message code="co.label.appInd"/></th>	
	<th style="text-align:center;"><s:message code="co.label.result"/></th>
	<th style="text-align:center;"><s:message code="co.label.message"/></th>
</tr>
<c:forEach items="${result}" var="multi">
<tr>
	<td>${multi.addressFullName}</td>
	<td><fmt:formatDate pattern="yyyy/MM/dd" value="${multi.instStartDttm}"/></td>
	<td>${multi.appInd}</td>	
	<td>${multi.success ? '성공' : '실패'}</td>
	<td>${multi.message}</td>
</tr>
</c:forEach>
</table>