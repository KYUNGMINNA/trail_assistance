<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${pageContext.request.contextPath }/resources/css1/view_style.css" rel="stylesheet">
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container-fluid" id="wrapper">
	<div class="row">
		<div class="col-md-2"></div>

		<div class="board-hon">
			<div class="col-md-8 board-table">
				<div class="col-xs-12 col-md-12 write-wrap">
					<div class="titlebox">
						<h3>공고글 수정</h3>
					</div>
					<form action="<c:url value='/articleboard/articleUpdate'/>" name="updateForm" method="post">
						<div class="contenIn">
							<table class="tableVer table-bordered">
								<caption style="display: none">조력자 등재 공고 게시글 수정</caption>
								<tbody>
									<tr>
										<th>번호</th>
										<td><input type="text" class="form-control" name="article_id" value="${article.article_id}" readonly></td>
										<th class="title">조력자 유형</th>
										<td colspan="3"><input class="form-control input-sm" id="title" name="article_title" value="${article.article_title}"></td>
									</tr>

									<tr>
										<th>개인/기관</th>
										<td>
											<select class="form-control input-sm sel" name="article_type" value="${article.article_type}" style="width: 80px">
												<option>개인</option>
												<option>기관</option>
											</select>
										</td>
										<th class="c-date">공고 모집 시작일</th>
										<td><input type="datetime-local" class="form-control" name="start_date" id="currentDatetime" value="${article.article_start_date}" style="width: 120px"></td>
										<th>공고 모집 마감일</th>
										<td><input type="datetime-local" class="form-control" name="expired_date" id="currentLocaltime" value="${article.article_expired_date}" style="width: 120px"></td>
									</tr>
								</tbody>
								<tr>
									<th>내용</th>
									<td class="t-text" colspan="5"><textarea class="form-control" name="article_content" id="content" style="resize: none;" rows="15" cols="150">${article.article_content}</textarea></td>
								</tr>
							</table>

						</div>
						<div class="butt">
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
            location.href = "<c:url value='/articleboard/list' />"
         });

         $('#updateBtn').click(function() {
            if ($('input[name=article_title]').val() === '') {
               alert('제목은 필수 항목입니다.');
               $('input[name=article_title]').focus();
               return;
            } else if ($('textarea[name=article_content]').val() === '') {
               alert('내용은 필수 항목 입니다.');
               $('textarea[name=article_content]').focus();
               return;
            } else if(($('#content').val().length > 1001)){
                alert('내용의 크기는 1-1000자 이내 입니다.');
                $('#content').focus();
                return;   
             
             }else if(($('#title').val().length > 51)){
                  alert('제목 글자 수 제한은  50입니다 !!.');
                  $('#title').focus();
                  return;   
               
             }else if($('#currentDatetime').val() ===''){
             alert('등록일을 적어주세요')
             $('#currentDatetime').focus();
             return;
             }else if($('#currentLocaltime').val() ===''){
                 alert('마감일을 적어주세요')
                 $('#currentLocaltime').focus();
                 return;      
            
            } else {
               console.log('zxczxczxc');
               document.updateForm.submit();
            }
         });
         $('#delBtn')
               .click(
                     function() {
                        if (confirm('정말 삭제하시겠습니까?')) {
                           $('form[name=updateForm]')
                                 .attr('action',
                                       '<c:url value="/articleboard/articleDelete" />');
                           $('form[name=updateForm]').submit();
                        }
                     });

      });
   </script>


<%@ include file="../include/footer.jsp"%>
</body>
</html>















