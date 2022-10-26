<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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

		<div class="col-md-8">
			<h4>나의 접수 내역 조회</h4>

			<!--form select를 가져온다 -->
			<form action="<c:url value='/admin/admin_agency_list' />">
				<div class="apply-search-wrap clearfix">
					<button type="submit" class="btn btn-primary">검색</button>
					<input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}"> <select class="form-control search-select" name="condition">
						<option value="comNo" ${pc.paging.condition == 'comNo' ? 'selected' : ''}>기관번호</option>
						<option value="comName" ${pc.paging.condition == 'comName' ? 'selected' : ''}>기관명</option>
					</select>
				</div>
			</form>

			<table class="table table-hover apply-history-table">
				<thead class="#">
					<tr>
						<th>기관 번호</th>
						<th>기관명</th>
						<th>상세 보기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${comList}">
						<tr>
							<td>${list.comNo}</td>
							<td>${list.comName}</td>
							<td><a href="<c:url value='/admin/comAdminDetail/${list.comNo}${pc.makeURI(pc.paging.pageNum)}' />">보기</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>






			<!----------------------------페이지 네이션을 가져옴------------------------------->

			<form action="<c:url value='/admin/admin_agency_list' />" name="pageForm">
				<div class="text-center">
					<hr>
					<ul id="pagination" class="pagination pagination-sm">
						<c:if test="${pc.prev}">
							<li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
						</c:if>

						<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
							<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a href="#" class="active" data-pagenum="${num}">${num}</a></li>
						</c:forEach>

						<c:if test="${pc.next}">
							<li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
						</c:if>
					</ul>

				</div>

				<div class="regist-btn-wrap text-right">
					<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/admin/admin_agency_regist" />'">등록</button>
				</div>

				<!-- 페이지 관련 버튼(이전, 다음, 페이지번호)을 클릭 시 같이 숨겨서 보내줄 공통 값  -->
				<input type="hidden" name="pageNum" value="${pc.paging.pageNum}"> <input type="hidden" name="cpp" value="${pc.paging.cpp}"> <input type="hidden" name="condition" value="${pc.paging.condition}"> <input type="hidden" name="keyword" value="${pc.paging.keyword}">

			</form>
		</div>

	</div>
	<input type="hidden" id="account_type" value="${login.type}">
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-------------------------------- script ------------------------------>
<script>

	//2022-08-24 성민호 추가 , 25일 추가 (백에서 처리해야하지만 잠깐 이렇게 처리하겠습니다.)
	const isAdmin = $('#account_type').val();
	if (isAdmin != 1) {
		alert('관리자 권한이 필요한 페이지입니다.');
		location.href='<c:url value="/"/>';
	}


	$(function() {

		const msg = '${msg}';
		if (msg !== '') {
			alert(msg);
		}

		//사용자가 페이지 관련 버튼을 클릭했을 때, 기존에는 각각의 a태그의 href에다가
		//각각 다른 url을 작성해서 요청을 보내줬다면, 이번에는 클릭한 그 버튼이 무엇인지를 확인해서
		//그 버튼에 맞는 페이지 정보를 자바스크립트로 끌고와서 요청을 보내 주겠습니다.
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault(); //a태그의 고유기능 중지.

			//현재 이벤트가 발생한 요소(버튼)의
			//data-pageNum의 값을 얻어서 변수에 저장.
			const value = $(this).data('pagenum'); //
			console.log(value);

			//페이지 버튼들을 감싸고 있는 form태그를 name으로 지목하여
			//그 안에 숨겨져 있는 pageNum이라는 input태그의 value에
			//위에서 얻은 data-pageNum의 값을 삽입 한 후 submit
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		});
	}); //end jQuery
	
	
</script>























