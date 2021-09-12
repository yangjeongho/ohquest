<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
<colgroup>
	<col width="15%" />				
	<col width="15%" />
	<col width="20%" />
	<col width="10%" />
	<col width="40%" />				
</colgroup>
<tr>
	<th style="text-align:center;"><s:message code="code.label.000002"/></th>
	<th style="text-align:center;"><s:message code="code.label.000080"/></th>
	<th style="text-align:center;"><s:message code="code.label.000007"/></th>
	<th style="text-align:center;"><s:message code="co.label.result"/></th>
	<th style="text-align:center;"><s:message code="co.label.message"/></th>
</tr>
<c:forEach items="${result}" var="code">
<tr>
	<td>${code.codeGroup}</td><td>${code.code}</td><td>${code.meaning}</td><td>${code.success ? 'Success' : 'Fail'}</td><td>${code.message}</td>
</tr>
</c:forEach>
</table>