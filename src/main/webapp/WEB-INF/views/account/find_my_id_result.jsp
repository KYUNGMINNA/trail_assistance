<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 개인 정의 스타일 추가 -->
<style>
.container {
	text-align: center;
}

.table>tbody>tr>th {
	text-align: center;
	vertical-align: middle;
}

.table>tbody>tr>td {
	text-align: center;
	vertical-align: middle;
}
</style>



<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container" id="wrapper">
	<div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">아이디 찾기 결과</div>
			</div>

			<div style="padding-top: 30px" class="panel-body">
				<h4>찾은 아이디 : ${id}</h4>

				<div class="form-group">
					<div class="col-md-12 control">
						<table class="table" style="table-layout: fixed;">
							<tr>
								<td><a href="<c:url value="/account/user_join" />">회원가입</a></td>
								<td><a href="<c:url value="/account/find_my_password" />">비밀번호 찾기</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
