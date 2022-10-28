<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link href="${pageContext.request.contextPath }/resources/css1/view_style.css" rel="stylesheet">



<%@ include file="/WEB-INF/views/include/header.jsp"%>


<div class="container-fluid">

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

		<div class="board-hon">
			<div class="col-md-8 board-table">






				<div class="col-xs-12 col-md-12 write-wrap">

					<div class="titlebox">
						<h3>FAQ 수정</h3>
					</div>
					<form action="<c:url value='/faqboard/faqUpdate' />" method="post" name="updateForm">

						<div class="form-group">
							<label>제목</label> <input class="form-control" id="title" name='faq_title' value="${faq.faq_title}">

						</div>

						<div class="form-group">
							<label>FAQ 유형</label> <select class="form-control input-sm sel" name="faq_type">
								<option <c:if test='${one.one_cate_one=="계정 분실"}'> selected='selected'</c:if>>계정분실</option>
								<option <c:if test='${one.one_cate_one=="이용 문의"}'> selected='selected'</c:if>>이용 문의</option>
								<option <c:if test='${one.one_cate_one=="건의 사항"}'> selected='selected'</c:if>>건의 사항</option>
								<option <c:if test='${one.one_cate_one=="버그 및 오류 신고"}'> selected='selected'</c:if>>버그 및 오류 신고</option>
								<option <c:if test='${one.one_cate_one=="기타"}'> selected='selected'</c:if>>기타</option>
							</select>

						</div>

						<div class="form-group">
							<label>번호</label> <input class="form-control" name='faq_id' value="${faq.faq_id}" readonly>
						</div>









						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" id="content" rows="10" name='faq_content' style="resize: none;">${faq.faq_content}</textarea>

						</div>

						<div class="titlefoot text-right ">
							<button type="button" id="listBtn" class="btn btn-dark">목록</button>
							<button type="button" id="updateBtn" class="btn btn-primary">변경</button>
							<button type="button" id="delBtn" class="btn btn-info">삭제</button>
						</div>
					</form>


				</div>

			</div>



		</div>

		<div class="col-md-2"></div>
	</div>

</div>






<script>
	$(function() {
		//목록 이동 처리
		$('#listBtn').click(function() {
			location.href = "<c:url value='/faqboard/list' />"
		});

		$('#updateBtn').click(function() {
			if ($('input[name=faq_title]').val() === '') {
				alert('제목은 필수 항목입니다.');
				$('input[name=faq_title]').focus();
				return;
			} else if ($('textarea[name=faq_content]').val() === '') {
				alert('내용은 필수 항목 입니다.');
				$('textarea[name=faq_content]').focus();
				return;
			} else if (($('#content').val()).length > 1001) {
				alert('내용의 크기는 1-1000자 이내 입니다.');
				$('#content').focus();
				return;

			} else if (($('#title').val()).length > 51) {
				alert('제목 글자 수 제한은  50입니다 !!.');
				$('#title').focus();
				return;

			} else {
				document.updateForm.submit();
			}
		});
		$('#delBtn').click(
				function() {
					if (confirm('정말 삭제하시겠습니까?')) {
						$('form[name=updateForm]').attr('action',
								'<c:url value="/faqboard/faqDelete" />');
						$('form[name=updateForm]').submit();
					}
				});

	});
</script>

<%@ include file="../include/footer.jsp"%>
</body>
</html>
















