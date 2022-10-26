<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="${pageContext.request.contextPath }/resources/css1/list_style.css" rel="stylesheet">


<%@ include file="../include/header.jsp"%>



<div class="container-fluid" id="wrapper">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8 board-table">
			<div class="titlebox">
				<h3>공고 목록</h3>
			</div>
			<form action="<c:url value='/articleboard/list' />">
				<div class="sear-wrap ">
					<div class="md1">
						<button type="submit" class="btn btn-info sear-btn">검색</button>
					</div>
					<div class="md2">
						<input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}">
					</div>
					<div class="md3">
						<select class="form-control search-select" name="condition">
							<option value="article_title" ${pc.paging.condition == 'article_title' ? 'selected' : '' }>제목</option>
							<option value="article_content" ${pc.paging.condition == 'article_content' ? 'selected' : '' }>내용</option>
							<option value="article_type" ${pc.paging.condition == 'article_type' ? 'selected' : '' }>기관 종류</option>
						</select>
					</div>
				</div>
			</form>
			<table class="table table-bordered table-hover">
				<thead>
					<c:if test="${login.type==1}">
						<th>번호</th>
					</c:if>
					<th>개인/기관</th>
					<th class="article_title">조력자 유형</th>
					<th>공고 모집 시작일</th>
					<th>공고 모집 마감일</th>
					<c:if test="${login.type == 1}">
						<th>공고 게시글 작성일</th>
					</c:if>
				</thead>
				<tbody style="text-align: center;">
					<c:forEach var="vo" items="${articleList}">
						<tr>
							<c:if test="${login.type == 1}">
								<td>${vo.article_id}</td>
							</c:if>
							<td>${vo.article_type}</td>
							<td><a href="<c:url value='/articleboard/view/${vo.article_id}${pc.makeURI(pc.paging.pageNum)}' />"> ${vo.article_title}</a> &nbsp;&nbsp;&nbsp;</td>
							<td><fmt:formatDate value="${vo.article_start_date}" pattern="yyyy-MM-dd " /></td>
							<td><fmt:formatDate value="${vo.article_expired_date}" pattern="yyyy-MM-dd " /></td>
							<c:if test="${login.type == 1}">
								<td><fmt:formatDate value="${vo.article_regdate}" pattern="yyyy-MM-dd" /></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<form action="<c:url value='/articleboard/list' />" name="pageForm">
				<div class="text-center clearfix">
					<hr>
					<ul id="pagination" class="pagination pagination-sm">
						<c:if test="${pc.prev}">
							<li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
						</c:if>

						<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
							<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="#" data-pagenum="${num}">${num}</a></li>
						</c:forEach>

						<c:if test="${pc.next}">
							<li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
						</c:if>
					</ul>

					<c:if test="${login.type==1 }">

						<button type="button" class="btn btn-info" onclick="location.href='<c:url value="/articleboard/write" />'">글 등록</button>
					</c:if>
				</div>
				<input type="hidden" name="pageNum" value="${pc.paging.pageNum}"> <input type="hidden" name="cpp" value="${pc.paging.cpp}"> <input type="hidden" name="condition" value="${pc.paging.condition}"> <input type="hidden" name="keyword" value="${pc.paging.keyword}">
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	const msg = '${msg}';
	if (msg !== '') {
		alert(msg);
	}
	$(function() {

		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault(); //a태그의 고유기능 중지.

			const value = $(this).data('pagenum');
			console.log(value);

			document.pageForm.pageNum.value = value;
			document.pageForm.submit();

		});
		$('keywordInput').keydown(function(e) {
			if (e.keyword === 13) {
				$('#pagination').click();
			}
		});

	}); //end jQuery
</script>