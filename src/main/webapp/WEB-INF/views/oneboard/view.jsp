<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link href="${pageContext.request.contextPath }/resources/css1/view_style.css" rel="stylesheet">





<%@ include file="/WEB-INF/views/include/header.jsp"%>



<div class="container-fluid" id="wrapper">

	<div class="row">

		<div class="col-md-2" id="menu-nav">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title"></h3>
					<i class="glyphicon glyphicon-leaf"></i> <span>1:1문의</span>
				</div>
				<!-- 사이드바 메뉴목록1 -->
				<ul class="list-group">
					<li class="list-group-item"><a href="<c:url value='/noticeboard/list' />">>공지사항</a></li>
					<li class="list-group-item"><a href="<c:url value='/faqboard/list' />">>FAQ</a></li>
					<li class="list-group-item"><a href="<c:url value='/oneboard/list' />">>1:1 문의</a></li>
				</ul>
			</div>

		</div>

		<div class="board-hon">
			<div class="col-md-8 board-table">





				<div class="col-xs-12 col-md-12 write-wrap">

					<div class="titlebox">
						<h3>1:1문의 글 조회</h3>
					</div>

					<form action="<c:url value='/oneboard/registForm'/>" name="registForm" method="post">

						<table class="table">
							<tbody class="t-control">

								<tr>
									<td class="t-title">작성자</td>
									<td><input type="text" class="form-control input-sm" name="one_writer" value="${one.one_writer}" readonly></td>
								</tr>

								<tr>
									<td class="t-title">문의 제목 *</td>

									<td><input type="text" class="form-control input-sm" name="one_title" value="${one.one_title}" readonly></td>
								</tr>

								<tr>
									<td class="t-title">문의 유형 *</td>
									<td><select class=" form-control input-sm sel" name="one_cate_one" readonly disabled="disabled">
											<option <c:if test='${one.one_cate_one=="계정 분실"}'> selected='selected'</c:if>>계정분실</option>
											<option <c:if test='${one.one_cate_one=="이용 문의"}'> selected='selected'</c:if>>이용 문의</option>
											<option <c:if test='${one.one_cate_one=="건의 사항"}'> selected='selected'</c:if>>건의 사항</option>
											<option <c:if test='${one.one_cate_one=="버그 및 오류 신고"}'> selected='selected'</c:if>>버그 및 오류 신고</option>
											<option <c:if test='${one.one_cate_one=="기타"}'> selected='selected'</c:if>>기타</option>
									</select></td>
								</tr>



								<tr>
									<td class="t-title">문의 내용 *</td>
									<td><textarea class="form-control" rows="10" name="one_content" style="resize: none;" readonly>${one.one_content}</textarea></td>
								</tr>

							</tbody>
						</table>





					</form>

					<div class="butt">
						<c:if test="${login.type ==0  || login.type==1}">
							<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/oneboard/write_corr?one_id=${one.one_id}&one_type=${one.one_type}" />'">변경</button>
						</c:if>
						<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/oneboard/list?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
					</div>



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
















