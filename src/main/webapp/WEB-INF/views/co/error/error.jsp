<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file ="page/header.jsp" %>
// -------------------------- Mixins

@function pixels($row, $columns, $thickness: 1) {
	$result: null;
	$concat: " ";
	@each $column in $columns {
		@if index($columns, $column) > 1 {
			$concat: ", ";
		}
		$result: $result#{$concat}#{$column}em #{$row}em #{$grey}
	}
	@return $result;
}

// -------------------------- Colors

$grey: #535353;
$lightGrey: #dddddd;

// -------------------------- Keyframes

@include keyframes(eye) {
	0% {
		box-shadow: pixels(-9, (3));
	} 5% {
		box-shadow: 0 0 0 0 $grey;
	} 50% {
		box-shadow: pixels(0, (0));
	}
}

@include keyframes(mouth) {
	0% {
		box-shadow: pixels(-4, (6, 7, 8));
	} 50% {
		box-shadow: pixels(-3, (5, 6, 7, 8));
	}
}

@include keyframes(comets) {
	0% {
		box-shadow:
		pixels(-23, (-23)),
		pixels(-20, (-20)),
		pixels(-18, (-18)),
		pixels(-17, (-17)),
		pixels(-16, (-16)),
		pixels(-15, (-15)),
		pixels(-14, (-13, -12, -11)),
		pixels(-13, (-14, -13, -12, -11, -10)),
		pixels(-12, (-14, -13, -11, -10)),
		pixels(-11, (-14, -13, -12, -11, -10)),
		pixels(-10, (-13, -12, -11)),

		// Second comet
		pixels(-19, (-9)),
		pixels(-18, (-8)),
		pixels(-17, (-7)),
		pixels(-16, (-6, -5)),
		pixels(-15, (-6, -5))
		;
	} 33% {
		box-shadow:
		pixels(-24, (-24)),
		pixels(-21, (-21)),
		pixels(-18, (-18)),
		pixels(-17, (-17)),
		pixels(-16, (-16)),
		pixels(-15, (-15)),
		pixels(-14, (-13, -12, -11)),
		pixels(-13, (-14, -13, -12, -11, -10)),
		pixels(-12, (-14, -13, -11, -10)),
		pixels(-11, (-14, -13, -12, -11, -10)),
		pixels(-10, (-13, -12, -11)),

		// Second comet
		pixels(-20, (-10)),
		pixels(-19, (-9)),
		pixels(-18, (-8)),
		pixels(-17, (-7)),
		pixels(-16, (-6, -5)),
		pixels(-15, (-6, -5))
		;
	} 66% {
		box-shadow:
		pixels(-26, (-26)),
		pixels(-22, (-22)),
		pixels(-18, (-18)),
		pixels(-17, (-17)),
		pixels(-16, (-16)),
		pixels(-15, (-15)),
		pixels(-14, (-13, -12, -11)),
		pixels(-13, (-14, -13, -12, -11, -10)),
		pixels(-12, (-14, -13, -11, -10)),
		pixels(-11, (-14, -13, -12, -11, -10)),
		pixels(-10, (-13, -12, -11)),

		// Second comet
		pixels(-21, (-11)),
		pixels(-19, (-9)),
		pixels(-18, (-8)),
		pixels(-17, (-7)),
		pixels(-16, (-6, -5)),
		pixels(-15, (-6, -5))
		;
	}
}

@include keyframes(ground) {
	0% {
		box-shadow: 
		pixels(6, (-12, -11, -10, -9, -8, -7, -6, 4, 5, 6, 7, 8, 9, 10, 11, 12)),
		pixels(8, (8, 9, 10)),
		pixels(9, (-7, -6)),
		pixels(10, (6, 7)),
		pixels(11, (-10, -9))
		;
	} 15% {
		box-shadow: 
		pixels(6, (-12, -11, -10, -9, -8, -7, -6, 4, 5, 6, 7, 8, 9, 10, 11, 12)),
		pixels(8, (4, 5, 6)),
		pixels(9, (-12, -11)),
		pixels(10, (2, 3)),
		pixels(11, (10, 11))
		;
	} 30% {
		box-shadow: 
		pixels(6, (-12, -11, -10, -9, -8, -7, -6, 4, 5, 6, 7, 8, 9, 10, 11, 12)),
		pixels(8, (0, 1, 2)),
		pixels(9, (8, 9)),
		pixels(10, (-2, -1)),
		pixels(11, (6, 7))
		;
	} 45% {
		box-shadow: 
		pixels(6, (-12, -11, -10, -9, -8, -7, -6, 4, 5, 6, 7, 8, 9, 10, 11, 12)),
		pixels(8, (-4, -3, -2)),
		pixels(9, (4, 5)),
		pixels(10, (-6, -5)),
		pixels(11, (2, 3))
		;
	} 60% {
		box-shadow: 
		pixels(6, (-12, -11, -10, -9, -8, -7, -6, 4, 5, 6, 7, 8, 9, 10, 11, 12)),
		pixels(8, (-8, -7, -6)),
		pixels(9, (0, 1)),
		pixels(10, (-10, -9)),
		pixels(11, (-2, -1))
		;
	} 75% {
		box-shadow: 
		pixels(6, (-12, -11, -10, -9, -8, -7, -6, 4, 5, 6, 7, 8, 9, 10, 11, 12)),
		pixels(8, (-12, -11, -10)),
		pixels(9, (-4, -3)),
		pixels(10, (10, 11)),
		pixels(11, (-6, -5))
		;
	}
}

@include keyframes(dino) {
	0% {
		// Rear leg up
		box-shadow: 
		pixels(-10, (2, 3, 4, 5, 6, 7, 8, 9)),
		pixels(-9, (1, 2, 4, 5, 6, 7, 8, 9, 10)),
		pixels(-8, (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
		pixels(-7, (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
		pixels(-6, (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
		pixels(-5, (1, 2, 3, 4, 5)),
		pixels(-4, (0, 1, 2, 3, 4, 5)),
		pixels(-3, (-9, -3, -2, -1, 0, 1, 2, 3, 4)),
		pixels(-2, (-9, -2, -1, 0, 1, 2, 3, 4)),
		pixels(-1, (-9, -8, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6)),
		pixels(0, (-9, -8, -7, -4, -3, -2, -1, 0, 1, 2, 3, 4, 6)),
		pixels(1, (-9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4)),
		pixels(2, (-8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4)),
		pixels(3, (-7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3)),
		pixels(4, (-6, -5, -4, -3, -2, -1, 0, 1, 2)),
		pixels(5, (-5, -4, -3, -2, -1, 0, 1)),
		pixels(6, (-4, -3, 0, 1)),
		pixels(7, (-3, -2, 1)),
		pixels(8, (1)),
		pixels(9, (1, 2))
		;
	} 50% {
		// Front leg up
		box-shadow:
		pixels(-10, (2, 3, 4, 5, 6, 7, 8, 9)),
		pixels(-9, (1, 2, 4, 5, 6, 7, 8, 9, 10)),
		pixels(-8, (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
		pixels(-7, (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
		pixels(-6, (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
		pixels(-5, (1, 2, 3, 4, 5)),
		pixels(-4, (-3, -2, 0, 1, 2, 3, 4, 5)),
		pixels(-3, (-9, -2, -1, 0, 1, 2, 3, 4)),
		pixels(-2, (-9, -2, -1, 0, 1, 2, 3, 4)),
		pixels(-1, (-9, -8, -3, -2, -1, 0, 1, 2, 3, 4)),
		pixels(0, (-9, -8, -7, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6)),
		pixels(1, (-9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 6)),
		pixels(2, (-8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4)),
		pixels(3, (-7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3)),
		pixels(4, (-6, -5, -4, -3, -2, -1, 0, 1, 2)),
		pixels(5, (-5, -4, -3, -2, -1, 0, 1)),
		pixels(6, (-4, -3, -2, 1, 2)),
		pixels(7, (-4, -3)),
		pixels(8, (-4)),
		pixels(9, (-4, -3))
		;
	}
}

// -------------------------- Elements

body {
	font-size: 7px; // Control the size of the animation
	background-color: $lightGrey;
	> * {
		background: $grey;
		height: 0.5em;
		position: absolute;
		left: 50%;
		top: 50%;
		width: 0.5em;
	}
}

%thick {
	width: 1em;
	height: 1em;
}

.dino {
	@include animation(dino 0.25s both steps(1) infinite);
	@extend %thick;
}

.eye {
	@include animation(eye 4s both steps(1) infinite);
	@extend %thick;
}

.mouth {
	@include animation(mouth 4s both steps(1) infinite);
	@extend %thick;
}

.ground {
	@include animation(ground 0.5s both steps(1) infinite);
}

.comets {
	@include animation(comets 0.5s both steps(1) infinite);
}

.dino
.eye
.mouth
.ground
.comets

<div id="#wrap_1000">
	<div class="title">
		<!-- 타이틀 //-->
		<h1><s:message code="error.msg.000003"/></h1>
	</div>
	<div class="contents">
		<font color="red">
		<c:choose>
		<c:when test="${not empty messageCode and messageCode eq 'err.500'}">
			<s:message code="err.500"/>
			(${message}) <br>
		</c:when>
		<c:when test="${not empty messageCode }">
			<s:message code="${messageCode}" />
		</c:when>
		<c:otherwise>
			<s:message code="err.500"/>
		</c:otherwise>
		</c:choose>
		</font>
	</div>
</div>