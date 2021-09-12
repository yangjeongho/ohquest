<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
	<div class="paginate" style="clear:both; text-align:center; " >
<c:choose><c:when test="${pagination.objectsCount gt 0}">
	<c:choose><c:when test="${pagination.prevPageEnabled}">
			<%-- <a href="<c:url value="${baseUrl}?page=${pagination.firstPage}" />" class="paging_first"><img src="<s:url value="/resources/images/first_arrow.gif" />" alt="start page" class="imgover" /></a> --%>
			<a href="<c:url value="${baseUrl}?page=${pagination.firstPageForWindow - 1}" />"  page="${pagination.firstPageForWindow - 1}" class="paging_prev"><img src="<s:url value="/resources/images/btn/btn_paging_prev.gif" />" /></a>
		</c:when><c:otherwise></c:otherwise>
	</c:choose>
	<c:forEach var="p" begin="${pagination.firstPageForWindow}" end="${pagination.lastPageForWindow}">
		<c:choose><c:when test="${p eq pagination.currentPage}">
				<span class="now" page="${p}"><c:out value="${p + 1}" /></span>
			</c:when><c:otherwise>
				<a href="<c:url value="${baseUrl}?page=${p}" />"  page="${p}" class="paging_normal" ><c:out value="${p + 1}"/></a>
			</c:otherwise></c:choose>			
	</c:forEach>	
	<c:choose>
		<c:when test="${pagination.nextPageEnabled}">
			<a href="<c:url value="${baseUrl}?page=${pagination.lastPageForWindow + 1}" />"  page="${pagination.lastPageForWindow + 1}" class="paging_next" ><img src="<s:url value="/resources/images/btn/btn_paging_next.gif"/>"/></a>
			<%-- <a href="<c:url value="${baseUrl}?page=${pagination.lastPage}" />" class="paging_last"><img src="<s:url value="/resources/images/last_arrow.gif" />" alt="end page" class="imgover" /></a> --%>
		</c:when><c:otherwise></c:otherwise></c:choose>
		&nbsp;<span class="all">${pagination.lastPage + 1}</span><s:message code="co.label.page"/>
		</c:when><c:otherwise>
	<c:if test="${empty viewNoData or viewNoData ne false}"><h3><s:message code="code.msg.000028"/></h3></c:if> 
</c:otherwise></c:choose>
	</div>
