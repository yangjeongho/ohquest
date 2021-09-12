<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="<s:url value="/resources/javascript/menu/head.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/nav.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/menu/menu.js"/>"></script>
										
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
	<!--header //-->
	<header>
		<!-- 로고 //-->
		<div class="logo">
			<hgroup>
				<h1><img src="<s:url value="/resources/images/common/logo.gif"/>" alt="A Cube" /></h1>
			</hgroup>
		</div>
		<!--// 로고 -->
		<!-- //-->
		<div class="top_box">
			<!-- 로그인정보 //-->
			<div class="top_info_box">
				<ul>
					<li>
						<span>UNITEL > IT TEAM(00052398)</span>
						<span>2012-10-18 Thursday 14:00:00</span>
					</li>

					<li class="loginfo">
						<b>Hong Gi Min</b>
						<a href="<s:url value="/security/logout"/>"><img src="<s:url value="/resources/images/btn/logout.gif"/>" /></a>
					</li>
				</ul>
			</div>
			<!--// 로그인정보 -->
			<!-- Navigation //-->
			<nav>
				<ul class="menu" id="menu">
					<sec:menuTop/>
					
				</ul>
				<!-- 메뉴관련 스크립트 //-->
				<script type="text/javascript">
					var menu=new menu.dd("menu");
					menu.init("menu","menuhover");
				</script>
				<!--// 메뉴관련 스크립트 -->
			</nav>
			<!--// Navigation -->
		</div>
		<!--// -->
	</header>
