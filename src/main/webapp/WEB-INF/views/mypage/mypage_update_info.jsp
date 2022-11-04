<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ include file="/WEB-INF/views/include/header.jsp"%>


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



<div class="container-fluid" id="wrapper">
	<div class="row">

		<!-- 왼쪽 사이드 -->
		<div class="col-md-2"></div>


		<!--  중앙 content 내용  -->
		<div class="col-md-8">
			<form action="<c:url value='/mypage/mypage_update_fin' />" name="mypage_update_fin" method="post" id="mypage_update_fin">
				<h4>기본 정보</h4>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>신청자 성명</th>
							<td>${astVo.helper_name }</td>
							<th>휴대전화번호</th>
							<td><input type="text" class="form-control" placeholder="000-0000-0000" id="helperPhoneTel" value="${astVo.helper_phone_tel }" name="helper_phone_tel" maxlength="13"> <strong id="phoneCheck"></strong></td>
						</tr>
						<tr>
							<th>접수 상태</th>
							<td><input type="text" class="form-control" id="helperJob" value="${astVo.helper_apply_status}" readonly="readonly"></td>
							<th>이메일</th>
							<td><input type="text" class="form-control" id="helper_email_address" value="${astVo.helper_email_address }" name="helper_email_address"> <strong id="emailCheck"></strong></td>
						</tr>

					</tbody>
				</table>




				<!-- --------------------- 사무서 정보---------------------------------  -->
				<h4>사무소 정보</h4>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>사무소명</th>
							<td><input type="text" class="form-control" maxlength="20" value="${astVo.helper_office_name}" name="helper_office_name"></td>

							<th>사업자 등록번호</th>
							<td><input type="text" maxlength="13" class="form-control" placeholder="000-00-00000" id="helper_bussiness_reg_num" value="${astVo.helper_bussiness_reg_num}" name="helper_bussiness_reg_num"> <strong id="bussinessNumCheck"></strong></td>
						</tr>
						<tr>
							<th>사무소 전화번호</th>
							<td><input type="text" maxlength="9" class="form-control" id="helper_offic_tel" placeholder="0000-0000" value="${astVo.helper_offic_tel}" name="helper_offic_tel"> <strong id="officeTelCheck"></strong></td>
							<th>사무소 팩스번호</th>
							<td><input type="text" maxlength="13" class="form-control" id="helper_offic_fax_tel" value="${astVo.helper_offic_fax_tel}" name="helper_offic_fax_tel"> <strong id="officeFaxCheck"></strong></td>
						</tr>
						<tr>
							<th rowspan="3">사무소 주소</th>
							<td>우편번호</td>
							<td colspan="2">
								<div class="input-group">
									<input type="text" class="form-control" value="${astVo.helper_office_zipcode}" name="helper_office_zipcode" id="helper_office_zipcode" readonly="readonly"> <span class="input-group-btn">
										<button class="btn btn-default" type="button" onclick="goPopup3()">주소 찾기</button>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td colspan="2"><input type="text" class="form-control" value="${astVo.helper_office_address1}" name="helper_office_address1" id="helper_office_address1" readonly="readonly"></td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td colspan="2"><input type="text" class="form-control" value="${astVo.helper_office_address2}" name="helper_office_address2" id="helper_office_address2"></td>
						</tr>
					</tbody>
				</table>

				<!--  수정 버튼  -->
				<!--                <input type="submit" value="수정" class="btn btn-primary center-block btn-block" id="updateBtn">
 -->
				<button type="button" class="btn btn-primary center-block btn-block" id="updateBtn">수정</button>


				<!-- assistant_id 전달을 위한 input -->
				<input type="text" value="${astVo.assistant_id}" class="assistant_id" id="assistant_id" name="assistant_id" style="display: none">
			</form>
			<!--  form 전송 끝  -->
		</div>


	</div>
	<!--  class="row" 끝 -->
</div>
<!--  class="container-fluid" 끝 -->


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>

$(function() {
   
   //입력값들의 유효성 검증을 위한 정규표현식 변수 
   const bussinessNumCheck = RegExp(/^[0-9]{3}-[0-9]{2}-[0-9]{5}$/);
   const phoneCheck = RegExp(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/);
   const emailCheck = RegExp(/^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/);
   const faxCheck = RegExp(/^[0-9]{3}-[0-9]{3}-[0-9]{4}$/);
   const comTelCheck = RegExp(/^[0-9]{4}-[0-9]{4}$/);

   let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false
   
   //전화번호 체크
   $('#helperPhoneTel').keyup(function() {
      if($(this).val() === '') {
         $(this).css('background', 'pink');
         $('#phoneCheck').html('<b style="font-size: 10px; color: red">[전화번호는 필수입니다!]</b>');
         chk1 = false;
      }

      //정규표현식에 어긋난 값이면 false, 올바른 값이면 true.
      else if(!phoneCheck.test($(this).val())) {
         $(this).css('background', 'pink');
         $('#phoneCheck').html('<b style="font-size: 10px; color: red">[숫자 000-0000-0000형태로 입력하세요!]</b>');
         chk1 = false;
      }
      else
      {
         $(this).css('background', 'white');
         $('#phoneCheck').html('<b style="font-size: 10px; color: green">[규칙과 일치합니다!]</b>');
         chk1 = true;
      }
   });
   
   //사업자 번호 체크
   $('#helper_bussiness_reg_num').keyup(function() {
      if($(this).val() === '') {
         $(this).css('background', 'pink');
         $('#bussinessNumCheck').html('<b style="font-size: 10px; color: red">[사업자 번호는 필수입니다!]</b>');
         chk2 = false;
      }

      //정규표현식에 어긋난 값이면 false, 올바른 값이면 true.
      else if(!bussinessNumCheck.test($(this).val())) {
         $(this).css('background', 'pink');
         $('#bussinessNumCheck').html('<b style="font-size: 10px; color: red">[숫자 000-00-00000형태로 입력하세요!]</b>');
         chk2 = false;
      }
      else
      {
         $(this).css('background', 'white');
         $('#bussinessNumCheck').html('<b style="font-size: 10px; color: green">[규칙과 일치합니다!]</b>');
         chk2 = true;
      }
   });
   
   //이메일 체크
   $('#helper_email_address').keyup(function() {
      if($(this).val() === '') {
         $(this).css('background', 'pink');
         $('#emailCheck').html('<b style="font-size: 10px; color: red">[이메일 정보는 필수입니다!]</b>');
         chk3 = false;
      }

      //정규표현식에 어긋난 값이면 false, 올바른 값이면 true.
      else if(!emailCheck.test($(this).val())) {
         $(this).css('background', 'pink');
         $('#emailCheck').html('<b style="font-size: 10px; color: red">[abcd@naver.com 등의 이메일형태로 입력하세요!]</b>');
         chk3 = false;
      }
      else
      {
         $(this).css('background', 'white');
         $('#emailCheck').html('<b style="font-size: 10px; color: green">[규칙과 일치합니다!]</b>');
         chk3 = true;
      }
   });
   
   //팩스번호 체크
   $('#helper_offic_fax_tel').keyup(function() {
      if($(this).val() === '') {
         $(this).css('background', 'pink');
         $('#officeFaxCheck').html('<b style="font-size: 10px; color: red">[팩스 정보는 필수입니다!]</b>');
         chk4 = false;
      }

      //정규표현식에 어긋난 값이면 false, 올바른 값이면 true.
      else if(!faxCheck.test($(this).val())) {
         $(this).css('background', 'pink');
         $('#officeFaxCheck').html('<b style="font-size: 10px; color: red">[번호 000-000-0000 형태로 입력하세요!]</b>');
         chk4 = false;
      }
      else
      {
         $(this).css('background', 'white');
         $('#officeFaxCheck').html('<b style="font-size: 10px; color: green">[규칙과 일치합니다!]</b>');
         chk4 = true;
      }
   });
   
   //사업자 전화번호 체크
   $('#helper_offic_tel').keyup(function(){
      if($(this).val() === '') {
         $(this).css('background', 'pink');
         $('#officeTelCheck').html('<b style="font-size: 10px; color: red">[회사 전화번호는 필수입니다!]</b>');
         chk5 = false;
      }

      //정규표현식에 어긋난 값이면 false, 올바른 값이면 true.
      else if(!comTelCheck.test($(this).val())) {
         $(this).css('background', 'pink');
         $('#officeTelCheck').html('<b style="font-size: 10px; color: red">[번호 0000-0000 형태로 입력하세요!]</b>');
         chk5 = false;
      }
      else
      {
         $(this).css('background', 'white');
         $('#officeTelCheck').html('<b style="font-size: 10px; color: green">[규칙과 일치합니다!]</b>');
         chk5 = true;
      }
   });
   
   
   
   //수정 버튼 처리
   $('#updateBtn').click(function() {
      
      if(chk1 && chk2 && chk3 && chk4 && chk5) {
         alert('수정을 진행합니다!');
         $('#mypage_update_fin').submit();
      } else {
         alert('입력값이 올바른지 확인하세요!');
      }
      
   }); //수정버튼 처리 끝
   
   
}); //jquery end


function goPopup3(){
   //주소 찾기 버튼을 누르면 절대경로로 팝업창을 오픈
   var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup3.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

}


function jusoCallBack3(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
   document.getElementById('helper_office_address1').value=roadAddrPart1;
   document.getElementById('helper_office_address2').value=addrDetail;
   document.getElementById('helper_office_zipcode').value=zipNo;
   
      
}


/*    $('#updateBtn').click(function() {


         if (confirm('이대로 수정을 진행할까요?')) {
            $('#mypage_update_fin').submit();
            
         }
   }); */
</script>



