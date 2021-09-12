<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<option value=""><s:message code="code.msg.000001"/></option>
<c:forEach items="${list}" var="codeType"><option value="<c:out value="${codeType.codeGroup}" escapeXml="true"/>" ${codeType.codeGroup eq codeGroup ? 'selected' : ''}><c:out value="${codeType.codeGroup}" escapeXml="true"/></option></c:forEach>