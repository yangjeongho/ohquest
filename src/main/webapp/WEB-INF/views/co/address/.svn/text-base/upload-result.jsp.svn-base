<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table width="100%" cellpadding="0" cellspacing="0" border="1" class="table_view01">
<colgroup>
	<col width="5%" />				
	<col width="5%" />
	<col width="5%" />
	<col width="15%" />
	<col width="10%" />
	<col width="10%" />
	<col width="10%" />
	<col width="20%" />
	<col width="10%" />				
	<col width="10%" />				
</colgroup>

<tr>
	<th style="text-align:center;"><s:message code="ccs.csCccs000.taskHistoryListTable.lable.addNum"/></th>
	<th style="text-align:center;"><s:message code="co.label.city"/></th>
	<th style="text-align:center;"><s:message code="co.label.district"/></th>
	<th style="text-align:center;"><s:message code="co.label.subDistrict"/></th>
	<th style="text-align:center;"><s:message code="co.label.building"/></th>
	<th style="text-align:center;"><s:message code="co.label.entrance"/></th>
	<th style="text-align:center;"><s:message code="co.label.apt"/></th>
	<th style="text-align:center;"><s:message code="co.label.location"/></th>
	<th style="text-align:center;"><s:message code="co.label.result"/></th>
	<th style="text-align:center;"><s:message code="co.label.message"/></th>
</tr>
<c:forEach items="${result}" var="address">
<tr>
	<td>${address.addNum}</td>
	<td>${address.city}</td>
	<td>${address.district}</td>
	<td>${address.subDistrict}</td>
	<td>${address.building}</td>
	<td>${address.entrance}</td>
	<td>${address.apt}</td>
	<td>${address.location}</td>
	<td>${address.success ? '성공' : '실패'}</td>
	<td>${address.message}</td>
</tr>
</c:forEach>
</table>