<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="tCode" value="${code}"/>
<c:forEach items="${list}" var="code"> 
	<option value="${code.code}" ${(not empty tCode and tCode eq code.code) ? 'selected' : ''}><c:out value="${code.meaning}"/></option>
</c:forEach>