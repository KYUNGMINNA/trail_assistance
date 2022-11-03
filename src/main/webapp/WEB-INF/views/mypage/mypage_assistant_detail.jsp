<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/views/include/header.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/choiCss.css" rel="stylesheet">


<div class="container-fluid" id="wrapper">

	<div class="row">

		<!--사이드바 메뉴-->
		<div class="col-md-2" id="menu-nav"></div>

		<!-- 본문 -->
		<div class="col-md-8 clearfix">
			<h4>나의 접수 내역 상세 조회</h4>
			<table class="table table-bordered" id="apply-detail-table">
				<tbody>
					<tr>
						<th>이름</th>
						<td>${mypageDetail.helper_name}</td>
						<th>주민등록번호</th>
						<td>${mypageDetail.helper_ssn_number}</td>
					</tr>
					<tr>
						<th>선택 조력자 유형</th>
						<!-- articleboard(조력자 공고)의 제목을 가져옴  -->
						<td>${mypageDetail.helepr_articleboard}</td>
						<th>전화번호</th>
						<td>${mypageDetail.helper_phone_tel}</td>
					</tr>
					<tr>
						<!--<th>신청 조력자 유형</th>
						<td>${mypageDetail.small}</td> -->
						<th>직업</th>
						<td>${mypageDetail.helper_job}</td>
						<th>지정 법원</th>
						<td>${mypageDetail.law2}</td>
					</tr>

					<tr>
						<th>주소</th>
						<td>${mypageDetail.helper_address1}${mypageDetail.helper_address2}</td>
						<th>평정기준표</th>
						<td>
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">평정기준표 조회</button>
						</td>
					</tr>
					<tr>
						<%-- <th>신청자 상태</th>
						<td>${mypageDetail.helperIsIneligible}</td> --%>
					</tr>
				</tbody>
			</table>
			<h4>평정기준표 코멘트</h4>
			<div class="col-md-6">
				<textarea class="form-control detail-textarea" row="5" style="resize: none;" readonly> ${mypageDetail.helper_status} 
				</textarea>
				<%-- <c:set var = "string1" value = "${mypageDetail.evalComent}"/>
				<textarea class="form-control col-md-6" readonly>
					${fn:trim(string1)}
				</textarea> --%>


			</div>
			<%-- <div class="aplly_detail_list_btn">
				<button type="button" class="btn btn-dark float-right" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage_assistant_history?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
			</div> --%>
			<div class="aplly_detail_list_btn">
				<button type="button" class="btn btn-dark float-right" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage_assistant_history'">목록</button>
			</div>
		</div>
	</div>
</div>






<!--------------------------------------- 모달 ----------------------------------------->
<!-- 모달 -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- 모달 내용 -->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="text-align: center;">평정기준표</h4>
			</div>
			<div class="modal-body">
				<table class="table table-bordered apply-detail-modal">
					<tbody>
						<tr>
							<th rowspan="2">평정항목</th>
							<th rowspan="2">세부항목</th>
							<th rowspan="2">배점</th>
							<th colspan="3">내용</th>
						</tr>
						<tr>
							<th>구분</th>
							<th>기준</th>
							<th>배점</th>
						</tr>
						<tr>
							<td rowspan="9">기본평정</td>
							<td rowspan="6">경력점수</td>
							<td rowspan="6">${eval.totalCareer + eval.insideCareer}</td>
							<td rowspan="3">통산경력</td>
							<td>10년 이상</td>
							<td><input type="radio" name="totalCareer" value="5" onclick="return(false);" <c:if test="${eval.totalCareer eq 5}">
                                    	checked
                                    	</c:if>>5</td>
						</tr>
						<tr>
							<td>5~10 년</td>
							<td><input type="radio" name="totalCareer" value="4" onclick="return(false);" <c:if test="${eval.totalCareer eq 4}">
                                    	checked
                                    	</c:if>>4</td>
						</tr>
						<tr>
							<td>5년 미만</td>
							<td><input type="radio" name="totalCareer" value="3" onclick="return(false);" <c:if test="${eval.totalCareer eq 3}">
                                    	checked
                                    	</c:if>>3</td>
						</tr>
						<tr>
							<td rowspan="3">관내경력</td>
							<td>10년 이상</td>
							<td><input type="radio" name="innerCareer" value="5" onclick="return(false);" <c:if test="${eval.insideCareer eq 5}">
                                    	checked
                                    	</c:if>>5</td>
						</tr>
						<tr>
							<td>5~10 년</td>
							<td><input type="radio" name="innerCareer" value="4" onclick="return(false);" <c:if test="${eval.insideCareer eq 4}">
                                    	checked
                                    	</c:if>>4</td>
						</tr>
						<tr>
							<td>5년 미만</td>
							<td><input type="radio" name="innerCareer" value="3" onclick="return(false);" <c:if test="${eval.insideCareer eq 3}">
                                    	checked
                                    	</c:if>>3</td>
						</tr>
						<tr>
							<td rowspan="2">사무소 소재지</td>
							<td rowspan="2">${eval.officeAddress}</td>
							<td colspan="2">관내사무소</td>
							<td><input type="radio" name="officeLocation" value="5" onclick="return(false);" <c:if test="${eval.officeAddress eq 5}">
                                    	checked
                                    	</c:if>>5</td>
						</tr>
						<tr>
							<td colspan="2">관외사무소</td>
							<td><input type="radio" name="officeLocation" value="3" onclick="return(false);" <c:if test="${eval.officeAddress eq 3}">
                                    	checked
                                    	</c:if>>3</td>
						</tr>
						<tr>
							<!-- 나중에 여기 사무소 주소지 동적으로 뿌려야 함 -->
							<td colspan="5">신청인 사무소주소지 : ${mypageDetail.helper_office_address1}</td>
						</tr>
						<tr>
							<td rowspan="3">인성평가</td>
							<td rowspan="3"></td>
							<td rowspan="3">${eval.personality}</td>
							<td colspan="2">우수</td>
							<td><input type="radio" name="personalityEval" value="5" onclick="return(false);" <c:if test="${eval.personality eq 5}">
                                    	checked
                                    	</c:if>>5</td>
						</tr>
						<tr>
							<td colspan="2">평균</td>
							<td><input type="radio" name="personalityEval" value="4" onclick="return(false);" <c:if test="${eval.personality eq 4}">
                                    	checked
                                    	</c:if>>4</td>
						</tr>
						<tr>
							<td colspan="2">미흡</td>
							<td><input type="radio" name="personalityEval" value="3" onclick="return(false);" <c:if test="${eval.personality eq 3}">
                                    	checked
                                    	</c:if>>3</td>
						</tr>
						<tr>
							<td rowspan="2">면접</td>
							<td rowspan="2"></td>
							<td rowspan="2">${eval.interview}</td>
							<td colspan="2">우수</td>
							<td><input type="radio" name="interview" value="5" onclick="return(false);" <c:if test="${eval.interview eq 5}">
                                    	checked
                                    	</c:if>>5</td>
						</tr>
						<tr>
							<td colspan="2">미흡</td>
							<td><input type="radio" name="interview" value="3" onclick="return(false);" <c:if test="${eval.interview eq 3}">
                                    	checked
                                    	</c:if>>3</td>
						</tr>
						<!-- 자격증 점수 (최대 4개) -->
						<tr>
							<td rowspan="4">자격증점수</td>
							<td rowspan="4"></td>
							<td rowspan="4">${eval.license}</td>
							<td colspan="2"></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td></td>
						</tr>
						<!-- 합계 -->
						<tr>
							<td colspan="2">합계</td>
							<td>${eval.totalCareer + eval.insideCareer + eval.officeAddress +
                                    	eval.personality + eval.interview + eval.license }</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<td colspan="2">감정인 평정표</td>
							<td>${eval.appraiserScore}</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<td>조정평점</td>
							<td>심사위원 추천</td>
							<td><input type="number" min="0" max="7" id="recommendScore" disabled value="${eval.adjustmentRating}"></td>
							<td colspan="3">최대 7점</td>
						</tr>
						<!-- 최종점수 동적으로 얻어와 뿌리기 -->
						<tr>
							<td colspan="2">최종점수 (종합)</td>
							<td>${eval.totalCareer + eval.insideCareer + eval.officeAddress +
                                    	eval.personality + eval.interview + eval.license + eval.appraiserScore +
                                    	eval.adjustmentRating}</td>
							<td colspan="3"><strong>${eval.totalCareer + eval.insideCareer + eval.officeAddress +
                                    	eval.personality + eval.interview + eval.license + eval.appraiserScore +
                                    	eval.adjustmentRating}</strong>점 / 총점</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>





















