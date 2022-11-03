<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/choiCss.css" rel="stylesheet">


<div class="container-fluid" id="wrapper">
	<div class="row">
		<div class="col-md-2"></div>

		<div class="col-md-8">
			<h4>나의 접수 내역 조회</h4>

			<!--form select를 가져온다 -->
			<%-- <form action="<c:url value='/mypage/mypage_assistant_history' />">
		    	<div class="apply-search-wrap clearfix">
                	<button type="submit" class="btn btn-primary">검색</button>
                    <input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}">
                    <select class="form-control search-select" name="condition">
                         <option value="articleTitle" ${pc.paging.condition == 'articleTitle' ? 'selected' : ''}>공고명</option>
                         <option value="helperType" ${pc.paging.condition == 'helperType' ? 'selected' : ''}>감정인구분</option>
                    </select>
                </div>
		    </form> --%>

			<table class="table table-hover apply-history-table">
				<thead class="#">
					<tr>
						<!-- <th>번호</th>  -->
						<th>개인/기관</th>
						<th>신청 조력자 유형</th>
						<th>접수 상태</th>
						<th>사무소명</th>
						<th>접수 날짜</th>
						<!-- 0825 최필규 저녁 수정 여기입니다!!!! -->
						<th>상세</th>
						<th>정보 수정</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach var="list" items="${mypageList.assistantRegist}">
						<c:if test="${list.assistant_id !=0}">
							<tr>
								<%-- <td>${list.assistant_id}</td> --%>
								<td>${list.helper_cateogry_select}</td>
								<td>${list.helepr_articleboard}</td>
								<td>${list.helper_apply_status}</td>
								<td>${list.helper_office_name}</td>
								<td><fmt:formatDate value="${list.helper_regdate}" pattern="yyyy-MM-dd HH:mm" /></td>
								<!-- 0829 최필규 수정 -->
								<td><a href="<c:url value='/mypage/getApplyDetail/${list.assistant_id}' />">보기</a></td>
								<td><a href="<c:url value='/mypage/mypage_update_info/${list.assistant_id}' />">보기</a></td>
						</c:if>
						</tr>

					</c:forEach>




				</tbody>
			</table>


			<!----------------------------페이지 네이션을 가져옴------------------------------->

			<%-- <form action="<c:url value='/mypage/mypage_assistant_history' />" name="pageForm">
				<div class="text-center">
					<hr>
					<ul id="pagination" class="pagination pagination-sm">
						<c:if test="${pc.prev}">
							<li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
						</c:if>

						<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
							<li class="${pc.paging.pageNum == num ? 'active' : ''}">
								<a href="#" class="active" data-pagenum="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pc.next}">
							<li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
						</c:if>
					</ul>
				</div> --%>

			<!-- 페이지 관련 버튼(이전, 다음, 페이지번호)을 클릭 시 같이 숨겨서 보내줄 공통 값  -->
			<%-- <input type="hidden" name="pageNum" value="${pc.paging.pageNum}"> 
				<input type="hidden" name="cpp" value="${pc.paging.cpp}"> 
				<input type="hidden" name="condition" value="${pc.paging.condition}"> 
				<input type="hidden" name="keyword" value="${pc.paging.keyword}">
 --%>
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-------------------------------- script ------------------------------>
<!-- <script>
	$(function() {

		/* const msg = '${msg}';
		if (msg !== '') {
			alert(msg);
		} */

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
	
	
</script> -->























