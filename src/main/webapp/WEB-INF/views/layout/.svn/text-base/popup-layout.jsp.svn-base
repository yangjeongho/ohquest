<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set value='${sessionScope["org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE"].language}' var="lang" scope="session"/> 
<!DOCTYPE html>
<html lang="${lang}">
<head>
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/lib/jquery/ui/themes/base/jquery.ui.all.css" />" />
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/core/jquery-1.7.2.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/ui/jquery-ui-1.8.22.custom.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/monthpicker/jquery.ui.monthpicker.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/blockui/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/fixedtable/jquery.fixedtable.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/printElement/jquery.printElement.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/json2/json2.js"/>"></script>

<script type="text/javascript" src="<s:url value="/resources/javascript/common/messagebox.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/properties.jsp" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/dialog.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/loading.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/util.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/code.js"/>"></script>

<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/layout.css"/>" />
<!--// jqgrid add -->

<!-- IE 8.0을 위한 스크립트 -->
<!--[if lt IE 9]><script type="text/javascript" src="../js/html5.js"></script><![endif]-->



<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/contents.css"/>" >
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/tab.css"/>" >
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/kickstart.css"/>" />


<!-- 임시 주석  
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/jquery.loadmask.css"/>" >
-->

<!-- jqgrid add// -->
<link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/ui.jqgrid.css" />">
<script src="<s:url value="/resources/lib/jqgrid/i18n/grid.locale-en.js" />" type="text/javascript"></script>
<script src="<s:url value="/resources/lib/jqgrid/jquery.jqGrid.min.js" />" type="text/javascript"></script>

<!--// jqgrid add -->
<!-- jquery tab// -->
<!-- tab -->
<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/date.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/arFunc.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/jqGridFmt.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/excelDn.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/bsar/codeCtrl.js" />"></script>
<script type="text/javascript" src="<s:url value="/resources/lib/jquery/plugins/jqueryFileDown/jquery.loadmask.js"/>"></script>
<!-- tab -->

<title><s:message code="browser.header.title"/></title>
<script type="text/javascript">
	var baseUrl = "<s:url value="/"/>";
	var baseLang = "${lang}";
</script>
</head>
<body>
	<tiles:insertAttribute name="mainContent" />
	<div id="dialogContent" title="View dialog"><div id="dialogContentSource"></div></div>
</body>
</html>