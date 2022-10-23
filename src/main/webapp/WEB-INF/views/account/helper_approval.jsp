<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.container {
	text-align: center;
	font-size: 25px;
}

button {
	margin: 50px;
}
</style>




<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container" id="wrapper">
	<h1>회원 가입이 완료되었습니다.</h1>
	<a href="<c:url value='/' />" type="button" class="btn btn-primary btn-lg">메인 화면</a>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

