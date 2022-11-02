

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>





<link href="${pageContext.request.contextPath }/resources/css1/view_style.css" rel="stylesheet">






<%@ include file="../include/header.jsp"%>



<div class="container-fluid" id="wrapper">

	<div class="row">

		<div class="col-md-2" id="menu-nav">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title"></h3>
					<i class="glyphicon glyphicon-leaf"></i> <span>고객 센터</span>
				</div>
				<!-- 사이드바 메뉴목록1 -->
				<ul class="list-group">
					<li class="list-group-item"><a href="<c:url value='/noticeboard/list' />">>공지사항</a></li>
					<li class="list-group-item"><a href="<c:url value='/faqboard/list' />">>FAQ</a></li>
					<li class="list-group-item"><a href="<c:url value='/oneboard/list' />">>1:1 문의</a></li>
				</ul>
			</div>

		</div>


		<div class="col-md-8 board-table">

			<div class="col-xs-12 col-md-12 write-wrap">

				<div class="titlebox">
					<h3>공지사항 상세</h3>
				</div>

				<form>
					<%-- 				<c:if test="${login.type == 1}">

							<div>
								<label>DATE</label>
								<c:if test="${notice_updatedate == null}">
									<p>${notice.notice_regdate}</p>
								</c:if>
								<c:if test="${notice_updatedate != null}">
									<p>${notice.notice_updatedate}</p>
								</c:if>

							</div>
						</c:if> --%>

					<div class="contenIn">
						<table class="tableVer table-bordered">
							<caption style="display: none">조력자 등재 공고 게시글 상세정보 표</caption>
							<tbody>
								<tr>
									<%-- 		<c:if test="${login.type == 1}">

											<th>번호</th>


											<td>${notice.notice_id}</td>
										</c:if> --%>

									<th>작성자</th>
									<td>${notice.notice_writer}</td>
									<th class="title">제목</th>
									<td colspan="6">${notice.notice_title}</td>

								</tr>

								<tr>
									<th>기관 종류</th>
									<td>${notice.notice_type}</td>
									<th>게시일</th>
									<td colspan="5">${notice.notice_regdate}</td>

								</tr>

							</tbody>

							<tr>

								<td class="t-text" colspan="9">${notice.notice_content}</td>
							</tr>


						</table>

					</div>



				</form>



				<div class="butt">
					<c:if test="${login.type ==1 }">
						<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/noticeboard/write_corr?notice_id=${notice.notice_id}&notice_type=${notice.notice_type}" />'">변경</button>
					</c:if>


					<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/noticeboard/list?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
				</div>

			</div>

		</div>

		<div class="col-md-2"></div>
	</div>
</div>




<script>
	const msg = '${msg}';
	if(msg !== ''){
		alert(msg);
	}
</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>
