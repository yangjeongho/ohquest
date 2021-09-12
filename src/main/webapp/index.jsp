<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set value="${pageContext.request.locale.language}" var="lang" scope="session"/>
<!DOCTYPE html>
<html lang="${lang}"> 
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="QUEST, WE CAN DO, MISSION" />
	<meta name="description" content="" />
</head>
        
<body>
    
<script type="text/javascript">
    //무조건 메인페이지로 이동처리
	location.href = "<c:url value="/main.do"/>";
	//redirectFunction("/main");
</script>    


<!-- another version - flat style with animated hover effect 
<div class="breadcrumb flat">
	<a href="#" class="active">Browse</a>
	<a href="#">Compare</a>
	<a href="#">Order Confirmation</a>
	<a href="#">Checkout</a>
</div>    
-->
<!--  
<div id="clouds">
	<div class="cloud x1"></div>
	
	<div class="cloud x2"></div>
	<div class="cloud x3"></div>
	<div class="cloud x4"></div>
	<div class="cloud x5"></div>
</div>
-->
<!--  
<div id="header">
	<h1>즐거운 하루가 시작이군요. 아름다운 밤입니다..</h1>
</div>-->

<!--  
	<div class="wrap">
	
	<nav>
		<ul class="menu">
			<li><a href="#"><span class="iconic home"></span> Home</a></li>
			<li><a href="#"><span class="iconic plus-alt"></span> About</a>
				<ul>
					<li><a href="#">Company History</a></li>
					<li><a href="#">Meet the team</a></li>
				</ul>
			</li>
			<li><a href="#"><span class="iconic magnifying-glass"></span> Services</a>
				<ul>
					<li><a href="#">Web Design</a></li>
					<li><a href="#">App Development</a></li>
					<li><a href="#">Email Campaigns</a></li>
					<li><a href="#">Copyrighting</a></li>
				</ul>
			</li>
			<li><a href="#"><span class="iconic map-pin"></span> Products</a>
				<ul>
					<li><a href="#">Widget One</a></li>
					<li><a href="#">Widget Two</a></li>
					<li><a href="#">Web App Three</a></li>
					<li><a href="#">Web App Four</a></li>
					<li><a href="#">Crazy Products</a></li>
					<li><a href="#">iPhone Apps</a></li>
				</ul>
			</li>
			<li><a href="#"><span class="iconic mail"></span> login</a>
				<ul>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Directions</a></li>
				</ul>
			</li>
		</ul>
		<div class="clearfix"></div>
	</nav>
	</div>
	

<div id="content">
	<div id="left">
	    <h1><s:message code="co.login.000002"/></h1>
		<h2>안녕하세요!</h2>
		<p>누군가에서 무슨일이 생기는지 내가 누구에서 요청을 하고 싶을때 우리의 임무를 수행한 친구를 찾자.</p>
		<p>우리는  </p>
				<ul>
			<li><a href="#">Where.</a></li>
			<li><a href="#">When.</a></li>
			<li><a href="#">What.</a></li>
			<li><a href="#">Who.</a></li>
			<li><a href="#">Hwo.</a></li>
		</ul>
		<p>통해서 알수있다. 내가 비롯 작아질때 누군가에게 요청해보자. 진짜 히어로를 나타나지 않지만 사소한 도움들이 모여서 위대한 큰일을 해 낼수 있을것이다.</p>
	</div>
	<div id="right">
		<h2>What's New?</h2>
		<h3>진행중...</h3>
		<h3>진행중...</h3> 
		<h3>진행중...</h3>
		<h2>진행중...</h2>
	</div>
</div>
<div id="footer">
	<p>Copyright &copy; 2013 OH!!!!!QUEST.</p>
	<p>Create by <a href="http://www.ohquset.com">http://www.ohquset.com</a></p>
</div>

-->
</body>
</html>

