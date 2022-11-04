<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ include file="/WEB-INF/views/include/header.jsp"%>


<div class="container-fluid" id="wrapper">
	<div class="row text-center">
		<%-- <div class="col-md-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">마이페이지</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a
							href="<c:url value='/mypage/update_info' />">나의 정보 수정</a></li>
						<li class="list-group-item"><a
							href="<c:url value='/mypage/apply_history' />">나의 접수 내역</a></li>
						<li class="list-group-item"><a
							href="<c:url value='/mypage/modify_helper_form' />">조력자 신청서
								수정</a></li>
						<li class="list-group-item"><a
							href="<c:url value='/find/mypage_delete' />">회원 탈퇴</a></li>
					</ul>
				</div>
			</div> --%>

		<div class="col-lg-4 col-md-4 col-xs-4"></div>

		<div class="col-lg-4 col-md-4 col-xs-4 userCheckForm">
			<div class="pwChk-titlebox">
				<h4>안전한 이용을 위해, 비밀번호를 확인해 주세요.</h4>
			</div>
			<form action="${pageContext.request.contextPath}/mypage/pwSuccess" method="post" id="userCheckForm">
				<div class="form-group">
					<!--사용자클래스선언-->
					<label for="id">아이디</label> <input type="text" name="userId" class="form-control" id="userId" readonly="readonly" value="${loginId}">
				</div>
				<div class="form-group">
					<!--사용자클래스선언-->
					<label for="id">비밀번호</label> <input type="password" name="userPw" class="form-control" id="userPw" placeholder="비밀번호를 입력하세요.">
				</div>
				<div class="form-group">
					<button type="button" id="userCheckBtn" class="btn btn-primary btn-block">확인</button>
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>
		$(function() {
			
			//비밀번호 확인
			$('#userCheckBtn').click(function() {
				
				
				const account = $('#userId').val();
				const password = $('#userPw').val();
				
				const userInfo = {
						'account' : account,
						'password' : password,
				};
				
				if(userPw === '') {
					alert('비밀번호를 입력하세요.');
					return;
				}
				
				$.ajax({
					type: 'post',
					url: '<c:url value="/mypage/pwCheck" />',
					data: JSON.stringify(userInfo),
					contentType: 'application/json',
					success: function(data) {
						if(data === 'ok') {
							alert('비밀번호가 확인되었습니다.');
							$('#userCheckForm').submit();
						} else {
							alert('비밀번호가 틀렸습니다.');
							$('#userPw').focus();
						}
					},
					error: function() {
						alert('서버 에러입니다. 관리자에게 문의하세요.');
					}
					
				}); //비밀번호 중복확인 비동기 통신 끝
			}); //비밀번호 확인 끝
		}); // end jQuert
	</script>





















