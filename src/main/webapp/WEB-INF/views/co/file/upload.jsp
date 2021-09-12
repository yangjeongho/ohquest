<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form name="upload" action="<c:url value="/dm/file/upload"/>" method="POST" enctype="multipart/form-data" data-ajax="false"> 
<section id="uploadPage" data-role="page"> 
	<header data-role="header" data-position="fixed" data-theme="a">
	<a href="/home" data-ajax="false" data-icon="home"><s:message code="file.label.Home"/></a>
	<h1><s:message code="cmn.label.fileattach"/></h1>	
	</header>
	<div data-role="content" >
		1.  테스트
		<input type="file" id="attach" name="attach"/>
		<input type="submit" value='<s:message code="cmn.btn.send"/>'/> 
	</div>	
</section>
</form>