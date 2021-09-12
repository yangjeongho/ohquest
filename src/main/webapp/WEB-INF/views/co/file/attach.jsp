<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<c:choose>
<c:when test="${result eq 'true'}">
	<json:object>
		<json:property name="result" value="${result }"/>
		<json:property name="fileName" value="${fileName }"/>
		<json:property name="file" value="${file }"/>
		<json:property name="download" value="${download}" escapeXml="false"/>
	</json:object>
</c:when>
<c:otherwise>
	<json:object>
		<json:property name="result" value="${result }"/>
	</json:object>
</c:otherwise>
</c:choose>
