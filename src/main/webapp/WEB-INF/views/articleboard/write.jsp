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
						<h3>공고글 등록</h3>
					</div>

					<form action="<c:url value='/articleboard/registForm'/>" name="registForm" method="post">
						<div class="contenIn">
							<table class="table table-bordered"">

								<tbody>
									<tr>
										<th>조력자</th>
										<td colspan="5"><input class="form-control" id="title" name="article_title"></td>
									</tr>

									<tr>
										<th>개인/기관</th>
										<td><select class="form-control" name="article_type" style="width: 80px">
												<option>개인</option>
												<option>기관</option>
										</select></td>
										<th class="c-date">시작일</th>
										<td><input type="datetime-local" class="form-control" name="start_date" id="currentDatetime" style="width: 120px"></td>
										<th>마감일</th>
										<td><input type="datetime-local" class="form-control" id="currentLocaltime" name="expired_date" style="width: 120px"></td>

									</tr>




								</tbody>

								<tr>
									<th style="vertical-align: middle;">내용</th>
									<td colspan="5" class="t-text"><textarea name="article_content" class="form-control" rows="15" id="content" cols="150" style="resize: none;">
											</textarea></td>
								</tr>


							</table>

						</div>



					</form>

					<div class="butt">
						<button class="btn" id="registBtn">등록</button>
						<button class="btn" id="listBtn">목록</button>
					</div>
				</div>


			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>



<script>
 	$(function(){
 		$('#registBtn').click(function(){
 			if($('#title').val() === ''){
 				alert('제목은 필수 항목입니다.');
 				$('#title').focus();
 				return;
 				
 				//내용은 필수 항목		
 			} else if($('#content').val() ===''){
 				alert('내용은 필수 항목입니다.');
 				$('#content').focus();
 				return;
 			
 			} else if(($('#content').val()).length > 1001){
 				alert('내용의 크기는 1-1000자 이내 입니다.');
 				$('#content').focus();
 				return;	
 				
 				
 	 			//글자수제한 50
 	 			}else if(($('#title').val()).length > 51){
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
 				
 				//내용은 필수 항목		
			
 				
 			} else{
 				document.registForm.submit();
 			}
 		});
 		
 		
 		
 		$('#listBtn').click(function(){
 			if(confirm('목록으로 돌아가시겠습니까?')){
 				location.href='<c:url value="/articleboard/list" />'	
 			}else return;
 			
 			
 		})
 		
 		
 	});
 </script>


<%@ include file="../include/footer.jsp"%>

















