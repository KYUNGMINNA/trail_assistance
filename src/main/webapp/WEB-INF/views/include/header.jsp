<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>재판조력자 온라인신청</title>
<script src="https://kit.fontawesome.com/89b715172c.js" crossorigin="anonymous">
	
</script>



<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!--개인 디자인 추가-->
<%-- <link href="${pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet"> --%>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

<style>
.container-fluid {
	margin: none;
}

.navbar-header {
	font-size: 35px;
	color: white;
	margin-left: 0px;
}

.fa-scale-balanced {
	margin: 25px 0px 0px 30px;
}

header li {
	font-size: 24px;
	margin-left: 0px;
	display: inline;
}

#wrapper {
	height: auto;
	min-height: 100%;
	padding-bottom: 100px;
}

.footer {
	height: 400px;
	position: relative;
	transform: translateY(-100%);
	margin-bottom: 0;
}

html, body {
	height: 100%
}
</style>
</head>
<body>
	<!------ Header ---------->

	<header>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<i class="fa-solid fa-scale-balanced"><a href="<c:url value='/'/>" style="color: white; text-decoration: none;">온라인감정신청</a></i>
				</div>
				<c:choose>
					<c:when test="${login == null}">



						<ul class="nav navbar-nav navbar-right">
							<li><a href="<c:url value="/account/user_join" />"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
							<li><a href="<c:url value="/account/login" />"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
						</ul>
					</c:when>



					<c:otherwise>


						<ul class="nav navbar-nav navbar-right">

							<li><a href="<c:url value='/account/logout'/>"> <i class="fa-solid fa-user"></i>로그아웃
							</a></li>
						</ul>

					</c:otherwise>
				</c:choose>



			</div>
			<br>


			<div class="container-fluid">

				<div class="col-md-3"></div>

				<ul class="nav navbar-nav row">

					<c:choose>
						<c:when test="${login.type != 1}">
							<li><a href="<c:url value='/assistant/category_select'/>" class="menu">조력자 신청</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="<c:url value='/admin/manage_assistant_history' />">조력자 관리</a></li>
						</c:otherwise>
					</c:choose>


					<li><a href="<c:url value='/articleboard/list'/>" class="menu">조력자 모집 공고</a></li>





					<li><a href="<c:url value='/noticeboard/list'/>" class="menu">고객 센터</a></li>

					<c:if test="${login.type != 1}">
						<li><a href="<c:url value='/mypage/mypagePasswordAuth'/>" class="menu">마이 페이지</a></li>
					</c:if>
				</ul>
			</div>
		</nav>



	</header>