<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/views/include/header.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/choiCss.css" rel="stylesheet">



<div class="container-fluid" id="wrapper">
	<div class="row">
		<div class="col-md-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">조력자 신청 관리</h3>
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="<c:url value='#' />">조력자 신청기관 관리</a></li>
					<li class="list-group-item"><a href="<c:url value='#' />">조력자 신청자 조회</a></li>
					<li class="list-group-item"><a href="<c:url value='#' />">조력자 신청자 승인 관리</a></li>
					<li class="list-group-item"><a href="<c:url value='#' />">조력자 현황 조회</a></li>
				</ul>
			</div>
		</div>

		<div class="col-xs-12 col-md-8 write-wrap">
			<div class="com-admin-titlebox">
				<p>상세보기</p>
			</div>

			<form>
				<!-- 나중에 날짜 추가할거면 여기에 추가하면 될듯 -->
				<%-- <div>
						<label>DATE</label>
						<c:if test="${article.updateDate == null}">
							<p>${article.regDate}</p>
						</c:if>
						<c:if test="${article.updateDate != null}">
							<p>${article.updateDate}</p>
						</c:if>
					</div> --%>
				<div class="form-group">
					<label>기관번호</label> <input class="form-control" name='comNo' id="comNo" value="${comDetail.comNo}" readonly>
				</div>
				<div class="form-group">
					<label>기관명</label> <input class="form-control" name='comName' value="${comDetail.comName}" readonly>
				</div>
				<div class="form-group">
					<label>전화번호</label> <input class="form-control" name='comPhone' value="${comDetail.comPhone}" readonly>
				</div>

				<div class="form-group">
					<label>주소</label> <input class="form-control" name='comAddress' value="${comDetail.comAddress}" readonly>
				</div>

				<div class="text-right">
					<button type="button" class="btn btn-primary com-detail-update-btn" id="comModify">수정</button>
					<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/admin/admin_agency_list?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
					<button type="button" class="btn btn-danger" id="com-detail-del-btn">삭제</button>
				</div>
			</form>
		</div>
	</div>
	<input type="hidden" id="account_type" value="${login.type}">
</div>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>

	//2022-08-24 성민호 추가 , 25일 추가 (백에서 처리해야하지만 잠깐 이렇게 처리하겠습니다.)
	const isAdmin = $('#account_type').val();
	if (isAdmin != 1) {
		alert('관리자 권한이 필요한 페이지입니다.');
		location.href='<c:url value="/"/>';
	}

	$(document).ready(function() {
		
		const updateMsg = '${updateMsg}';
		if(updateMsg !== '') {
			alert(updateMsg);
		}

		//수정 버튼 클릭시 확인
		$('#comModify').click(function() {
			if (confirm('수정을 진행 하시겠습니까?')) {
				location.href = '${pageContext.request.contextPath}/admin/comModify?comNo=${comDetail.comNo}'
			} else
				return;
		});
		
		//삭제 버튼 처리
		$('#com-detail-del-btn').click(function() {
			if (confirm('삭제를 진행하면 되돌릴 수 없습니다. 그래도 진행하시겠습니까?')) {
				
				const comNo = $('#comNo').val();
				
				$.ajax({
					type: 'post',
					url: '<c:url value="/admin/comDelete" />',
					data: comNo,
					contentType: 'application/json',
					success: function(data) {
						if(data === 'comDelSuccess') {
							alert('기관 삭제를 완료했습니다!');
							location.href = '<c:url value="/admin/admin_agency_list" />'
						} else {
							alert('삭제에 실패하였습니다. 관리자에게 문의하세요.');
						}
					},
					error: function() {
						alert('삭제에 실패했습니다. 관리자에게 문의하세요.');
					}
				}); //삭제 비동기 통신 끝.
			} else
				return;
		}); //삭제 버튼 처리 끝
		
	}); //end jquery
</script>





























