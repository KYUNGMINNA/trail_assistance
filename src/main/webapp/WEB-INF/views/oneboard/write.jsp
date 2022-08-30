<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link
	href="${pageContext.request.contextPath }/resources/css1/view_style.css"
	rel="stylesheet">




</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section>


		<div class="container-fluid">

			<div class="col-md-2" id="menu-nav">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title"></h3>
						<i class="glyphicon glyphicon-leaf"></i> <span>1:1문의</span>
					</div>
					<!-- 사이드바 메뉴목록1 -->
				<ul class="list-group">
						<li class="list-group-item"><a
							href="<c:url value='/noticeboard/list' />">>공지사항</a></li>
						<li class="list-group-item"><a
							href="<c:url value='/faqboard/list' />">>FAQ</a></li>
						<li class="list-group-item"><a
							href="<c:url value='/oneboard/list' />">>1:1 문의</a></li>
					</ul>
				</div>

			</div>
			<div class="row">


				<div class="board-hon">
					<div class="col-md-8 board-table">
						




						<div class="col-xs-12 col-md-12 write-wrap">

							<div class="titlebox">
								<p>1:1문의 등록</p>
							</div>

							<form action="<c:url value='/oneboard/registForm'/>"
								name="registForm" method="post">

								<table class="table">
									<tbody class="t-control">



										<tr>
											<td class="t-title">작성자</td>
											<td><input type="text" class="form-control input-sm"
												name="one_writer" value="${login.account}"
												readonly="readonly"></td>
										</tr>

										<tr>
											<td class="t-title">문의 제목 *</td>

											<td><input type="text" class="form-control input-sm"
												name="one_title"></td>
										</tr>

										<tr>
											<td class="t-title">문의 종류1 *</td>

											<td><select class=" form-control input-sm sel"
												name="one_cate_one">
													<option>문의 유형 1</option>
													<option>문의 유형 2</option>
													<option>문의 유형 3</option>
													<option>문의 유형 3</option>
													<option>문의 유형 4</option>
											</select></td>
										</tr>



										<tr>
											<td class="t-title">문의 내용 *</td>
											<td><textarea class="form-control" rows="10"
													name="one_content" style="resize: none;"></textarea></td>
										</tr>

										<tr>
											<td class="t-title">파일 첨부 *</td>
											<td><input type="file" class="gallery-file"
												name="one_file" multiple /></td>
										</tr>
									</tbody>
								</table>



								<div class="titlefoot text-right">
									<button class="btn" id="registBtn">등록</button>
									<button class="btn" id="listBtn">목록</button>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>





		<div class="col-md-2"></div>

	</section>

	<script>
 	$(function(){
 		$('#registBtn').click(function(){
 			if($('input[name=one_title]').val() === ''){
 				alert('제목은 필수 항목입니다.');
 				$('input[name=one_title]').focus();
 				return;
 			} else if($('textarea[name=one_content]').val() ===''){
 				alert('내용은 필수 항목입니다.');
 				$('textarea[name=one_content]').focus();
 				return;
 			}else{
 				document.registForm.submit();
 			}
 			
 			
 		});
 		$('#listBtn').click(function(){
 			if(confirm('목록으로 돌아가시겠습니까?')){
 				location.href='<c:url value="/oneboard/list" />'	
 			}else return;
 			
 			
 		})
 		
 		
 	});
 </script>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>















