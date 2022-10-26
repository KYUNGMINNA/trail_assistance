<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<link href="${pageContext.request.contextPath }/resources/css1/view_style.css" rel="stylesheet">
<%@ include file="../include/header.jsp"%>

<div class="container-fluid" id="wrapper">
	<div class="row">
		<div class="col-md-2"></div>
		\
		<div class="col-md-8 board-table">
			<div class="col-xs-12 col-md-12 write-wrap">
				<div class="titlebox">
					<h3>공고글 상세 내용</h3>
				</div>
				<form>
					<div class="contenIn">
						<table class="tableVer table-bordered">
							<caption style="display: none">조력자 등재 공고 게시글 상세정보 표</caption>
							<tbody>
								<tr>
									<c:if test="${login.type == 1}">
										<th>번호</th>
										<td>${article.article_id}</td>
									</c:if>
									<th class="title">조력자 유형</th>
									<td colspan="6">${article.article_title}</td>
								</tr>
								<tr>
									<th>개인/기관 분류</th>
									<td>${article.article_type}</td>

									<th class="c-date">공고 모집 시작일</th>
									<td colspan="2">${article.article_start_date }</td>
									<th>공고 모집 마감일</th>
									<td>${article.article_expired_date}</td>
								</tr>
							</tbody>
							<tr>
								<th>내용</th>
								<td class="t-text" colspan="9">${article.article_content}</td>
							</tr>
						</table>
					</div>
				</form>
				<div class="butt">
					<c:if test="${login.type ==1 }">
						<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/articleboard/write_corr?article_id=${article.article_id}&article_type=${article.article_type}" />'">변경</button>
					</c:if>
					<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/articleboard/list?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<script>
	const msg = '${msg}';
	if (msg !== '') {
		alert(msg);
	}
</script>
<%@ include file="../include/footer.jsp"%>

