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
						<h3>공지사항 수정</h3>
					</div>

					<form action="<c:url value='/noticeboard/noticeUpdate'/>" name="updateForm" method="post">
						<input type="hidden" value="${notice.notice_id}" name="notice_id" id="notice_id">

						<div class="contenIn">
							<table class="tableVer table-bordered">
								<caption style="display: none">공고 게시글 상세정보 표</caption>
								<tbody>
									<tr>
										<%-- <c:if test="${login.type==1 }">
											<th>번호</th>
											<td><input class="form-control" name='notice_id'
												value="${notice.notice_id}" readonly></td>
										</c:if> --%>

										<th>작성자</th>
										<td><input class="form-control" name="notice_writer" value="${notice.notice_writer}" readonly></td>

										<th class="title">제목</th>
										<td colspan="6"><input class="form-control input-sm" id="title" name="notice_title" value="${notice.notice_title}">
									</tr>

									<tr>
										<th>개인/기관</th>
										<td><select class="form-control input-sm sel" name="notice_type">
												<option>개인</option>
												<option>기관</option>


										</select></td>

									</tr>



								</tbody>

								<tr>

									<td class="t-text" colspan="9"><textarea class="form-control" id="content" name="notice_content" rows="15" cols="150" style="resize: none;">${notice.notice_content}</textarea></td>
								</tr>


							</table>

						</div>
						<div class="butt ">
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
 	
 	$(function(){
 		//목록 이동 처리
 		$('#listBtn').click(function(){
 			location.href="<c:url value='/noticeboard/list' />"
 		});
 	
 	$('#updateBtn').click(function() {
		if($('input[name=notice_title]').val() === ''){
			alert('제목은 필수 항목입니다.');
			$('input[name=notice_title]').focus();
			return;
		}else if($('textarea[name=notice_content]').val()=== ''){
			alert('내용은 필수 항목 입니다.');
			$('textarea[name=notice_content]').focus();
			return;
		} else if(($('#content').val()).length > 1001){
				alert('내용의 크기는 1-1000자 이내 입니다.');
				$('#content').focus();
				return;	
			
			}else if(($('#title').val()).length > 51){
				alert('제목 글자 수 제한은  50입니다 !!.');
				$('#title').focus();
				return;	
		
		}else{
			document.updateForm.submit();
		}
	});
 	$('#delBtn').click(function(){
 		if(confirm('정말 삭제하시겠습니까?')){
 			$('form[name=updateForm]').attr('action', '<c:url value="/noticeboard/noticeDelete" />');
 			$('form[name=updateForm]').submit(); 	
	 		}	
 	});
 	
 		
 	});
 </script>



<%@ include file="../include/footer.jsp"%>
</body>
</html>
















