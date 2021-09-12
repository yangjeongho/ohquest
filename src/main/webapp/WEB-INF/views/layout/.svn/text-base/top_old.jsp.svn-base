<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set value="${pageContext.request.locale.language}" var="lang" scope="session"/>
<!DOCTYPE html>
<html lang="${lang}"> 
<head>

<link type="text/css" rel="stylesheet" href="<c:url value="/resources/styles/styles.css"/>" />
<script src="http://thecodeplayer.com/uploads/js/prefixfree-1.0.7.js" type="text/javascript" type="text/javascript"></script>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Oh!!!!!Quest</title>
<meta name="keywords" content="QUEST, WE CAN DO, MISSION" />
<meta name="description" content="" />
</head>
        
<body>
<script type="text/javascript">
$(function(){
 
	//회원등록처리
	$("#newNumber").click(function(e){
		alert("TEST");
		//e.preventDefault();
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"ui/newMember", 
			title : 'TEST', 
			width : 660, 
			height : 550, 
			modal : true
		});	
	});	
});	
</script>    





        <div id="header">
            <!-- logo -->
            <a href="#" id="logo"><img src="images/logo.png"></a>

            <!-- extra top links -->
            <div id="links">
                <a href="#"  id="newNumber">회원가입</a>
                <a href="#">ID/PW찾기</a>
                <a href="#" id="onlinePymDtlDlrCdSearch">로그인</a>
            </div>
        
            <div id="login">
                <form role="login" method="post" action="loginProcess">
                    <input name="userId" type="text" placeholder="UserId"   name="s" value="" autocomplete="off" />
                    <input name="password" type="text" placeholder="Password" name="2" value="" autocomplete="off" />
                </form>
                
                
            </div>            
            <div>
             <div href="#" class="css_btn_class">Jonin</div>
            </div>
            <!-- navigation menu -->
            <div id="navmenu">
                <nav id="menu">
                    <ul>
                        <li class="active"><a href="index.php">Home</a>
                        </li>
                        <li><a href="#">Best Quest</a>
                        </li>
                        <li><a href="#">Best Runer</a>
                        </li>
                    
                    </ul>
                </nav>

                <!-- search form -->
                <div id="search">
                    <form role="search" method="get">
                        <input type="text" placeholder="search..." name="s" value="" autocomplete="off" />
                    </form>
                </div>
            </div>
        </div>
	

</body>
</html>