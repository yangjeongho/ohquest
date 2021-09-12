<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
var gf_msg_loading = "<s:message code="cmn.msg.loading"/>" ;
var gf_msg_searching = "<s:message code="cmn.msg.searching"/>" ;
var gf_msg_processing = "<s:message code="cmn.msg.processing"/>" ;
var err_default 	= "<s:message code='err.default' javaScriptEscape='true'/>";
var err_nodata 	= "<s:message code='err.nodata' javaScriptEscape='true'/>";
var err_500 		= "<s:message code='err.500' javaScriptEscape='true'/>";
<s:message code='err.last.seq' var="lastSeq"/> 
<c:forEach begin="1" end="${lastSeq}" varStatus="status">
<fmt:formatNumber pattern="000000" value="${status.count}" var="errMsgCode"/>var err_${errMsgCode} 	= "<s:message code='err.${errMsgCode}' javaScriptEscape='true'/>";
</c:forEach>