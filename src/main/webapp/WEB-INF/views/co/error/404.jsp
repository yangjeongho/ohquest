<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file ="page/header.jsp" %>
$blue: #0A7189
$lblue: #75C6D9

body
	background-color: $blue
	color: #fff
	font: 100% 'Lato', sans-serif
	font-size: 1.8rem
	font-weight: 300

a
	color: $lblue
	text-decoration: none
  
h3
	margin-bottom: 1%

ul
	list-style: none
	margin: 0
	padding: 0
	line-height: 50px
  
li
	a:hover
		color: #fff
  
.center
	text-align: center
    
/* Search Bar Styling */

// Thank you Will Boyd (@lonekorean) for the alignment fix
form > *
	vertical-align: middle

.srchBtn
	border: 0
	border-radius: 7px
	padding: 0 17px
	background: #e74c3c
	display:inline
	width: 99px
	border-bottom: 5px solid #c0392b
	color: #fff
	height: 65px
	font-size: 1.5rem
	cursor: pointer
  
.srchBtn:active
	border-bottom: 0px solid #c0392b

.srchFld
	border: 0
	border-radius: 7px
	padding: 0 17px
	display:inline
	max-width: 404px
	width: 40%
	border-bottom: 5px solid #bdc3c7
	height: 60px
	color: #7f8c8d
	font-size: 19px

.srchFld:focus
	outline-color: rgba(white,0)

/* 404 Styling */
.header
	font-size: 13.0rem
	font-weight: 700
	margin: 2% 0 2% 0
	text-shadow: 0px 3px 0px #7f8c8d

/* Error Styling */
.error
	margin: -70px 0 2% 0
	font-size: 7.4rem
	text-shadow: 0px 3px 0px #7f8c8d
	font-weight: 100

<section class="center">
    <article>
      <h1 class="header">404</h1>
      <p class="error">ERROR</p>
    </article>
    <article>
      <img src="http://i62.tinypic.com/vovg1x.png" alt="Funny Face">
    </article>
    <article>
      <p>Lost? Maybe I can help.</p>
    </article>
    <article>
      <form action="">
        <input type="text" name="search" class="srchFld" placeholder="What are you looking for?" required/>
        <button type="submit" class="srchBtn">Search</button>
      </form>
    </article>
    <article>
      <h3>My Suggestions.</h3>
      <ul>
        <li><a href="">Home</a></li>
        <li><a href="">Portfolio</a></li>
      </ul>
    </article>
  </section>
<%@include file ="page/footer.jsp" %>