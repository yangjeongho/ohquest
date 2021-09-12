<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<option value=""><s:message code="code.msg.000001"/></option>
<c:forEach items="${list}" var="code"><option value="${code.code }" ${code.enabledFlag eq false ? 'style="color:red;"' : '' }>${code.code} [<c:out value="${code.meaning}" escapeXml="true"/>]</option></c:forEach>