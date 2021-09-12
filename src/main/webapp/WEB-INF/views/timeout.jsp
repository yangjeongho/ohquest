<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>

<link rel="stylesheet" href="<s:url value="/resources/lib/jquery-mobile/jquery.mobile-1.0.css"/>" />
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/core/jquery.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery-mobile/jquery.mobile-1.0.min.js"/>"></script>

<title>Oh Quest</title>
<script type="text/javascript"> 
	<c:choose>
	<c:when test="${marketCode eq '1'}">
		location.href = "<c:url value="/" />index.jsp";
	</c:when>
	<c:when test="${marketCode eq '2'}">
		location.href = "<c:url value="/" />indexv.jsp";
	</c:when>
	<c:otherwise>
		location.href = "<c:url value="/" />index.jsp";
	</c:otherwise>
	</c:choose>
</script>
</head>
<body>
<body>
<section id="recentList" data-role="page"> 
	<div data-role="content" >
			<%-- 세션이 종료되었습니다.<br/> <a href="<c:url value="/"/>">다시 로그인 하시려면 여기를 클릭해주세요</a> --%>
	</div>
</section>
</body>
</html>
