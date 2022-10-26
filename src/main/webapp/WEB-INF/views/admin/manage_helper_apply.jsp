<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 개인 정의 스타일 추가 -->
<style>
.table>tbody>tr>th {
	text-align: center;
	vertical-align: middle;
}

.table>tbody>tr>td {
	text-align: center;
	vertical-align: middle;
}
</style>



<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container" id="wrapper">
	<h4>조력자 신청자 상세 정보 조회</h4>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<th>이름</th>
				<td>${assistant.helper_name}</td>
				<th>주민등록번호</th>
				<td>${assistant.helper_ssn_number}</td>
			</tr>
			<tr>
				<th>지원공고</th>
				<td>${assistant.helepr_articleboard}</td>
				<th>전화번호</th>
				<td>${assistant.helper_phone_tel}</td>
			</tr>
			<tr>
				<th>개인/기관</th>
				<td>${assistant.helper_cateogry_select}</td>
				<th>직업</th>
				<td>${assistant.helper_job}</td>
			</tr>
			<tr>
				<th>지정법원</th>
				<td>${assistant.law2}</td>
				<th>기본주소</th>
				<td>${assistant.helper_address1}</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td>${assistant.helper_address2}</td>
				<th>첨부파일</th>
				<td><a href="<c:url value="/admin/fileDownload?fileId=${assistant.hepler_edu_file_id}" />">학력파일</a> <a href="<c:url value="/admin/fileDownload?fileId=${assistant.hepler_career_file_id}" />">경력파일</a> <a href="<c:url value="/admin/fileDownload?fileId=${assistant.hepler_license_file_id}" />">자격증파일</a></td>
			</tr>
			<tr>
				<th>평정기준표</th>
				<td>
					<button type="button" id="eval-detail-btn" class="btn btn-info" data-toggle="modal" data-target="#myModal">평정기준표 조회</button>
				</td>
				<th>신청자 상태</th>
				<td><select name="assistantStatus" id="assistant_status" class="form-control">
						<option value="접수" <c:if test="${assistant.helper_apply_status eq '접수'}">
								selected
                            </c:if>>접수</option>
						<option value="승인" <c:if test="${assistant.helper_apply_status eq '승인'}">
								selected
                            </c:if>>승인</option>
						<option value="부적격" <c:if test="${assistant.helper_apply_status eq '부적격'}">
								selected
                            </c:if>>부적격</option>
						<option value="보완" <c:if test="${assistant.helper_apply_status eq '보완'}">
								selected
                            </c:if>>보완</option>
				</select></td>
			</tr>
		</tbody>
	</table>

	<!-- 모달 -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- 모달 내용 -->
			<div class="modal-content">
				<form action="#" id="evalForm">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="text-align: center;">평정기준표</h4>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
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
									<td><input type="radio" name="totalCareer" value="5" <c:if test="${eval.totalCareer eq 5}">
                                    	checked
                                    	</c:if>>5</td>
								</tr>
								<tr>
									<td>5~10 년</td>
									<td><input type="radio" name="totalCareer" value="4" <c:if test="${eval.totalCareer eq 4}">
                                    	checked
                                    	</c:if>>4</td>
								</tr>
								<tr>
									<td>5년 미만</td>
									<td><input type="radio" name="totalCareer" value="3" <c:if test="${eval.totalCareer eq 3}">
                                    	checked
                                    	</c:if>>3</td>
								</tr>
								<tr>
									<td rowspan="3">관내경력</td>
									<td>10년 이상</td>
									<td><input type="radio" name="innerCareer" value="5" <c:if test="${eval.insideCareer eq 5}">
                                    	checked
                                    	</c:if>>5</td>
								</tr>
								<tr>
									<td>5~10 년</td>
									<td><input type="radio" name="innerCareer" value="4" <c:if test="${eval.insideCareer eq 4}">
                                    	checked
                                    	</c:if>>4</td>
								</tr>
								<tr>
									<td>5년 미만</td>
									<td><input type="radio" name="innerCareer" value="3" <c:if test="${eval.insideCareer eq 3}">
                                    	checked
                                    	</c:if>>3</td>
								</tr>
								<tr>
									<td rowspan="2">사무소 소재지</td>
									<td rowspan="2">${eval.officeAddress}</td>
									<td colspan="2">관내사무소</td>
									<td><input type="radio" name="officeLocation" value="5" <c:if test="${eval.officeAddress eq 5}">
                                    	checked
                                    	</c:if>>5</td>
								</tr>
								<tr>
									<td colspan="2">관외사무소</td>
									<td><input type="radio" name="officeLocation" value="3" <c:if test="${eval.officeAddress eq 3}">
                                    	checked
                                    	</c:if>>3</td>
								</tr>
								<tr>
									<!-- 나중에 여기 사무소 주소지 동적으로 뿌려야 함 -->
									<td colspan="5">신청인 사무소주소지 : ${assistant.helper_office_address1}</td>
								</tr>
								<tr>
									<td rowspan="3">인성평가</td>
									<td rowspan="3"></td>
									<td rowspan="3">${eval.personality}</td>
									<td colspan="2">우수</td>
									<td><input type="radio" name="personalityEval" value="5" <c:if test="${eval.personality eq 5}">
                                    	checked
                                    	</c:if>>5</td>
								</tr>
								<tr>
									<td colspan="2">평균</td>
									<td><input type="radio" name="personalityEval" value="4" <c:if test="${eval.personality eq 4}">
                                    	checked
                                    	</c:if>>4</td>
								</tr>
								<tr>
									<td colspan="2">미흡</td>
									<td><input type="radio" name="personalityEval" value="3" <c:if test="${eval.personality eq 3}">
                                    	checked
                                    	</c:if>>3</td>
								</tr>
								<tr>
									<td rowspan="2">면접</td>
									<td rowspan="2"></td>
									<td rowspan="2">${eval.interview}</td>
									<td colspan="2">우수</td>
									<td><input type="radio" name="interview" value="5" <c:if test="${eval.interview eq 5}">
                                    	checked
                                    	</c:if>>5</td>
								</tr>
								<tr>
									<td colspan="2">미흡</td>
									<td><input type="radio" name="interview" value="3" <c:if test="${eval.interview eq 3}">
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
									<td><input type="number" min="0" max="7" id="recommendScore" value="${eval.adjustmentRating}"></td>
									<td colspan="3">최대 7점</td>
								</tr>
								<!-- 최종점수 동적으로 얻어와 뿌리기 -->
								<tr>
									<td colspan="2">최종점수 (종합)</td>
									<td>${eval.totalSum}</td>
									<td colspan="3"><strong>${eval.totalSum}</strong>점 / 총점</td>
								</tr>
							</tbody>
						</table>
					</div>

					<input type="hidden" id="assistant_id" value="${assistant.assistant_id}"> <input type="hidden" id="helper_name" value="${assistant.helper_name}"> <input type="hidden" id="helper_ssn_number" value="${assistant.helper_ssn_number}"> <input type="hidden" id="status" value="${form.status}"> <input type="hidden" id="form_id" value="${form.formId}"> <input type="hidden" id="acc_id" value="${assistant.acc_id}">
				</form>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="btn-modify">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>

			</div>

		</div>
	</div>

	<h4>보완 요구사항 작성</h4>
	<textarea class="form-control col-sm-5" id="requirements" rows-5 placeholder="보완 요구사항 입력" style="resize: none;">${assistant.helper_status}</textarea>

	<div class="text-center">
		<button type="button" id="btn-apply-save" class="btn btn-primary" style="margin: 0.5em">저장</button>
		<!--             <button type="button" id="btn-apply-delete" class="btn btn-danger" style="margin:0.5em">삭제</button> -->
		<button type="button" class="btn btn-default btn_list_go" style="margin: 0.5em">목록</button>
	</div>

	<input type="hidden" id="account_type" value="${login.type}">
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>


<script>

	const msg = '${msg}';
	if (msg === 'noInfo') {
		alert('해당 아이디로 신청한 조력자 정보가 없습니다.');
		location.href='/trial';
	} else if (msg === 'notLogin') {
		alert('로그인 상태가 아닙니다.');
		location.href='/trial';
	}
	
	//2022-08-24 성민호 추가 , 25일 추가 (백에서 처리해야하지만 잠깐 이렇게 처리하겠습니다.)
	const isAdmin = $('#account_type').val();
	if (isAdmin != 1) {
		alert('관리자 권한이 필요한 페이지입니다.');
		location.href='<c:url value="/"/>';
	}

	/*
		[구현해야 하는 부분]
	
		1. 모달창에서 체크된 체크박스들을 if문으로 구분하고 그에 따른 점수 부여 (5, 4, 3)
		2. 체크된 점수들을 각각 const score1, score2 ... 등으로 이름 붙이던가 해서 eval 객체로 포장하여 백엔드로 전송 (ajax)
		3. 백엔드측에서는 넘어온 점수를 매핑하여 매퍼를 통해 DB로 넘길 것
		4. 모달창의 점수 표시 부분(사용자측) 체크 확인 부분(관리자측) 을 볼 때, 점수가 백엔드에서 당겨져 올 수 있게
			컨트롤러에서 helper_apply 요청을 받았을 때 모달 정보를 addattribute 하여 넘겨줄 것
			(단, 지금은 조력자 정보가 고정적이긴 한데 나중에 동적으로 변경하게 되면 정보 및 모달창 점수를 회원 이름 기준으로 JOIN하여 조회해야 함)
	*/
	
	$(function() {
		
		// 모달에서 수정버튼 보냈을때 백엔드쪽으로 점수 정보 포장해서 전송
		// 근데 helper_id를 붙여서 전송해줘야 하는데 지금 그게 없음.
		$('#btn-modify').click(function() {
			// const helperId = $("assistant_id").val(); <- 이거 히든으로 땡겨올 것
			const assistantId = Number($("#assistant_id").val());
			const evalName = $("#helper_name").val();	
			const ssnNumber = $("#helper_ssn_number").val();
			const totalCareerScore = Number($("input[name=totalCareer]:checked").val()); // 통산경력 라디오버튼의 체크된 값 얻어오기
			const innerCareer = Number($("input[name=innerCareer]:checked").val());
			const officeLocation = Number($("input[name=officeLocation]:checked").val());
			const personalityEval = Number($("input[name=personalityEval]:checked").val());
			const interview = Number($("input[name=interview]:checked").val());
			const adjustmentRating = Number($("#recommendScore").val());
			const totalSum = totalCareerScore + innerCareer + officeLocation + personalityEval + interview + adjustmentRating;
			
			// 점수 받아온거 포장 ()
			const evalScoreList = {
					'assistantId' : assistantId,
					'evalName' : evalName,
					'ssnNumber' : ssnNumber,
					'totalCareer' : totalCareerScore,
					'insideCareer' : innerCareer,
					'officeAddress' : officeLocation,
					'personality' : personalityEval,
					'interview' : interview,
					'adjustmentRating' : adjustmentRating,
					'totalSum' : totalSum
			};
			
			// 통신
			$.ajax({
				type: 'POST',
				url: '<c:url value="/admin/score_update"/>',		// 주소 변경 필요
				contentType: 'application/json',
				dataType: 'text',
				data: JSON.stringify(evalScoreList),
				success: function (result) {
					/*
						현재 여기는 "insert"나 "update" 메시지를 반환받아야 함
						아직 관련 값 (helper_id) 이 없어 현재는 진행 불가.
					*/
					console.log('통신 성공 : ' + result);
					alert('성공적으로 점수가 저장되었습니다.');
					location.reload();
				},
				error: function () {
					alert('점수 저장 실패');
				}
			});
		});
		
		// 이거 승인 상태정보 저장하는 부분.
		$('#btn-apply-save').click(function() {
			
			// 셀렉트박스 눌린거 값 얻어오기
			const formId = $('#form_id').val();
			const accId = $('#acc_id').val();
			const assistantId = $('#assistant_id').val();
			const assistantStatus = $('#assistant_status option:selected').val();
			const status = $('#status').val();
			const requirements = $('#requirements').val();
			
			const formList = {
					'accId' : accId,
					'assistantId' : assistantId,
					'formId' : formId,
					'assistantStatus' : assistantStatus,
					'status' : status,
					'requirements' : requirements
			};
			
			// 통신
			$.ajax({
				type: 'POST',
				url: '<c:url value="/admin/manage_helper_apply"/>',
				contentType: 'application/json',
				dataType: 'text',
				data: JSON.stringify(formList),
				success: function (result) {
					console.log('통신 성공 : ' + result);
					alert('성공적으로 신청 정보를 저장했습니다.');
				},
				error: function () {
					alert('신청 정보 저장 실패');
				}
			});
	
		});
		
	
		$('.btn_list_go').click(function(){
				location.href="<c:url value='/admin/manage_assistant_history'/>"
		})
		
		
	});
</script>
