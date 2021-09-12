<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${list}" var="code">
	<c:set value="${code.codeId }" var="tCodeId"/>
	<c:set value="${code.codeName}" var="tCodeName"/>
	<c:set value="${code.tmpMode}" var="tMode"/>
	<option mode="${tMode}" tmpVal1="${code.tmpVal1}" tmpVal2="${code.tmpVal2}"  value="<c:out value="${tCodeId}"/>" ${not empty codeId and codeId eq tCodeId ? 'selected' : ''}><c:out value="${tCodeName}"/></option>
</c:forEach>