<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<style>
.join-wrap {
	text-align: center;
	padding: 20px;
}

.join-title {
	font-size: 40px;
	font-weight: bold;
	margin-bottom: 20px;
}

.join-select {
	margin-top: 50px;
}

.join-btn-wrap>button {
	width: 300px;
	height: 200px;
	font-size: 20px;
	margin: 0px 30px;
}

.icon-wrap img {
	margin: 0 130px;
}
</style>
<div class="container-fluid join-wrap text-center" id="wrapper">
	<h1 class="join-title">조력자 유형 선택</h1>
	<span>본인이 해당하는 조력자 유형을 선택해 주세요.</span> <br> <br>

	<div class="join-select">
		<div class="join-btn-wrap">
			<button id="join-user-btn" type="button" class="btn btn-default btn-primary" onclick="location.href='<c:url value='/assistant/userSelect' />'">
				<div>
					<img width="100px" src="../resources/img/user.svg" alt="user">
				</div>
				개 인
			</button>
			<button id="join-com-btn" type="button" onclick="location.href='<c:url value='/assistant/comSelect' />'" class="btn btn-default btn-info">
				<div>
					<img width="100px" src="../resources/img/company.svg" alt="company">
				</div>
				기 관
			</button>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
        // 개인 회원가입 버튼 이벤트
        $('#join-user-btn').on('click', function () {
            alert("정말 개인 회원가입을 진행하시겠습니까?");
            location.href=<c:url value='/assistant/userSelect'/>
        });
        // 기관 회원가입 버튼 이벤트
        $('#join-com-btn').on('click', function () {
            alert("정말 기관 회원가입을 진행하시겠습니까?");
        });
</script>


























