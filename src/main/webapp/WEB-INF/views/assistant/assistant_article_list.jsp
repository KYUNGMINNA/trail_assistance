<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>



<div class="container-fluid" id="wrapper">
	<div class="row">
		<!-- 왼쪽 -->
		<div class="col-md-2"></div>


		<!-- 중앙 -->

		<div class="col-md-8">

			<form action="<c:url value='/assistant/articlelist'/>" method="post">

				<table class="table table-bordered">
					<thead>
						<tr>
							<td>
								<h4>${sele}조력자공고 목록</h4>
							</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="arti" items="${assistantarticle}">
							<tr>
								<td><label> <input type="radio" value="${arti.article_title}" name="arti_article_title"> ${arti.article_title}
								</label></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				<div class="text-center">
					<button type="submit" id="category_select" class="text-center btn btn-success">조력자 신청</button>
				</div>

			</form>
		</div>




		<!--  오른쪽 -->
		<div class="col-md-2"></div>
	</div>
</div>





<script>

	
	

</script>
<%@ include file="../include/footer.jsp"%>