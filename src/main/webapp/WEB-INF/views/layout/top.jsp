<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set value='${sessionScope["org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE"].language}' var="lang" scope="session"/> 

<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Oh Quest</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />

	</head>
	<body class="homepage">

		<!-- Header 
			<header id="header">
				<div class="logo container">
					<div>
						<h1><a href="main.do" id="logo">TXT</a></h1>
						<p>A responsive site template by HTML5 UP</p>
					</div>
				</div>
			</header>
			-->
			
			
 		
 		<img src="<c:url value="/resources/images/ant_101.png"/>" />
			OH QUEST ANT stock top process 
		
					
<ul class="menu">
<li class="current"><a href="<s:url value="/main.do"/>">Home</a></li>
<li><a href="<s:url value="/stock/stockList.do"/>">Select Stock</a></li>
<li><a href="<s:url value="/stock/myStockSale.do"/>">My Stock</a></li>
<li><a href="<s:url value="/stock/stockMessage.do"/>">Stock Message</a>
<li><a href="<s:url value="/account/main.do"/>">My Account</a></li>
<li><a href=""><span class="icon" data-icon="R"></span>Temp</a>
	<ul>
	<li><a href=""><span class="icon" data-icon="G"></span>Sub Item</a></li>
	<li><a href=""><span class="icon" data-icon="A"></span>Sub Item</a>
		<ul>
		<li><a href=""><span class="icon" data-icon="Z"></span>Sub Item</a></li>
		<li><a href=""><span class="icon" data-icon="k"></span>Sub Item</a></li>
		<li><a href=""><span class="icon" data-icon="J"></span>Sub Item</a></li>
		<li><a href=""><span class="icon" data-icon="="></span>Sub Item</a></li>
		</ul>
	</li>
	<li class="divider"><a href=""><span class="icon" data-icon="T"></span>li.divider</a></li>
	</ul>
</li>
</ul>
<!-- 
<label for="text1">Text Field</label>
<input id="text1" type="text"  class="form_normal01" />

<button class="small pink"><i class="icon-plus-sign"></i> .pink</button>

<button class="pill"><i class="icon-star"></i> .pill</button>

Pop
<a class="button pop" href=""><i class="icon-music"></i> .pop</a>

Inset
<button class="inset"><i class="icon-plus-sign"></i> .inset</button>

Square
<button class="square"><i class="icon-minus-sign"></i> .square</button>
 -->
		<!-- Nav -->
		<!--  
			<nav id="nav" class="skel-layers-fixed">
				<ul>
					<li class="current"><a href="<s:url value="/main.do"/>">Home</a></li>
					<li>	
						<a href="#">Stock</a>
						<ul>
							<li><a href="<s:url value="/stock/stockList.do"/>">추천증권</a></li>
							<li><a href="#">사고 팔자</a></li>
							  sub 메뉴
							<li>
								<a href="#">Phasellus consequat</a>
								<ul>
									<li><a href="#">Lorem ipsum dolor</a></li>
									<li><a href="#">Phasellus consequat</a></li>
									<li><a href="#">Magna phasellus</a></li>
									<li><a href="#">Etiam dolore nisl</a></li>
								</ul>
							</li>
							
							<li><a href="#">Accounts</a></li>
						</ul>
					</li>
					<li><a href="<s:url value="/stock/stockList/add"/>">MyStock</a></li>
					<li><a href="<s:url value="/stock/myStock.do"/>">We...</a></li>
					<li><a href="<s:url value="/main.do"/>">...</a></li>
				</ul>
			</nav>
	-->

	</body>
</html>