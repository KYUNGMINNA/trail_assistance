<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

/*맨 마지막 신청 버튼*/
.submit_btn_div {
	text-align: center;
}

/* 테이블의 로우스팬3인 주소 글자 중앙(세로의 중앙)위치*/
.table>tbody>tr>td.add_rowspan {
	vertical-align: middle;
}

.footer-bs {
	background-color: #333;
	padding: 30px 20px;
	color: rgba(255, 255, 255, 1.00);
}

.footer-bs .footer-brand, .footer-bs .footer-nav, .footer-bs .footer-social,
	.footer-bs .footer-ns {
	padding: 10px 25px;
}

.footer-bs .footer-nav, .footer-bs .footer-social, .footer-bs .footer-ns
	{
	border-color: transparent;
}

.footer-bs .footer-brand h2 {
	margin: 0px 0px 10px;
}

.footer-bs .footer-brand p {
	font-size: 12px;
	color: rgba(255, 255, 255, 0.70);
}

.footer-bs .footer-nav ul.pages {
	list-style: none;
	padding: 0px;
}

.footer-bs .footer-nav ul.pages li {
	padding: 5px 0px;
}

.footer-bs .footer-nav ul.pages a {
	color: rgba(255, 255, 255, 1.00);
	font-weight: bold;
	text-transform: uppercase;
}

.footer-bs .footer-nav ul.pages a:hover {
	color: rgba(255, 255, 255, 0.80);
	text-decoration: none;
}

.footer-bs .footer-nav h4 {
	font-size: 18px;
	text-transform: uppercase;
	letter-spacing: 3px;
	margin-bottom: 10px;
}

.footer-bs .footer-nav ul.list {
	list-style: none;
	padding: 0px;
}

.footer-bs .footer-nav ul.list li {
	padding: 5px 0px;
}

.footer-bs .footer-nav ul.list a {
	color: rgba(255, 255, 255, 0.80);
}

.footer-bs .footer-nav ul.list a:hover {
	color: rgba(255, 255, 255, 0.60);
	text-decoration: none;
}

.footer-bs .footer-social ul {
	list-style: none;
	padding: 0px;
}

.footer-bs .footer-social h4 {
	font-size: 18px;
	text-transform: uppercase;
	letter-spacing: 3px;
}

.footer-bs .footer-social li {
	padding: 5px 4px;
}

.footer-bs .footer-social a {
	color: rgba(255, 255, 255, 1.00);
}

.footer-bs .footer-social a:hover {
	color: rgba(255, 255, 255, 0.80);
	text-decoration: none;
}

.footer-bs .footer-ns h4 {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 3px;
	margin-bottom: 10px;
}

.footer-bs .footer-ns p {
	font-size: 12px;
	color: rgba(255, 255, 255, 0.70);
}

@media ( min-width : 768px) {
	.footer-bs .footer-nav, .footer-bs .footer-social, .footer-bs .footer-ns
		{
		border-left: solid 1px rgba(255, 255, 255, 0.10);
	}
}

footer li a {
	font-size: 15px;
}
</style>
<%@ include file="../include/header.jsp"%>

<!--     text-center 적용하면 col크기의 중간에 텍스트 작성-->
<div class="container-fluid" id="wrapper">
	<div class="row">

		<!--왼쪽 aside공간 -->
		<div class="col-md-2"></div>

		<!-- 중앙 공간-->
		<div class="col-md-8">

			<h2>${contents}조력자신청</h2>

			<form action="<c:url value='/assistant/regist'/>" method="post" name="helper_assistant">
				<br> <br>




				<!--  감정 분야 선택 -->
				<!--2022.08.30 		<div>
							<h3>감정분야 및 세부 구분 선택</h3>
							<hr>
							<span>감정 분야 선택</span>
							 <select name="mid" id="mid">
								<option value="sel" selected>중 분류</option>
								<option value="general">일반감정인</option>
								<option value="inter">통번역인</option>
								<option value="agency">기관추천조력자</option>
							</select> <select name="small" id="small">
								<option value="sel" selected>소 분류</option>
							</select>
							<hr>
						</div>

						<br> -->


				<!-- 희망 법원 선택 -->
				<div>
					<h3>희망 법원 선택</h3>
					<hr>

					<div>
						<select name="law" id='law' size="10" style="width: 150px; height: 200px;">
							<option>대법원</option>
							<option>서울고등법원</option>
							<option>서울고등법원(춘천)</option>
							<option>대구고등법원</option>
							<option>부산고등법원</option>
							<option>인천고등법원</option>
							<option>광주고등법원</option>
							<option>대전고등법원</option>
						</select>

						<button type="button" id='btn_add' style="position: relative; bottom: 150px; left: 20px;">></button>
						<button type="button" id='btn_minus' style="position: relative; bottom: 50px; right: 12px;"><</button>
						<select name="law3" id='law2' size="10" style="width: 150px; height: 200px;">
						</select> <input type="hidden" id="law3" name="law2" value="">
					</div>
					<hr>

				</div>


				<div>
					<h3>신청인 기본정보</h3>
					<hr>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>조력자명</td>
								<td><input type="text" maxlength="10" name="helper_name" id="helper_name" class="form-control" placeholder="홍길동"></td>
								<td>주민등록번호</td>
								<td><input type="text" maxlength="14" name="helper_ssn_number" id="helper_ssn_number" class="form-control" placeholder="987654-1234567"></td>
							</tr>
							<tr>
								<td>휴대전화번호</td>
								<td><input type="text" maxlength="13" name="helper_phone_tel" id="helper_phone_tel" class="form-control" placeholder="010-1234-1234"></td>
								<td>전화번호</td>
								<td><input type="text" maxlength="13" name="helper_home_tel" id="helper_home_tel" class="form-control" placeholder="02-1234-1234"></td>
							</tr>

							<tr>
								<td>이메일</td>
								<td><input type="text" name="helper_email_address" id="helper_email_address" class="form-control" placeholder="abcdef@abcdef.com" maxlength="40"></td>
								<td>직업</td>
								<td><input type="text" maxlength="10" name="helper_job" id="helper_job" class="form-control" placeholder="의사"></td>
							</tr>

							<tr>
								<td rowspan="3" class="add_rowspan">주소</td>
								<td>우편주소</td>
								<td colspan="2">
									<div class="row">
										<div class="col-md-4">
											<input type="text" name="helper_zipcode" id="helper_zipcode" class="form-control" readonly="readonly">
										</div>
										<button type="button" class="btn" id="helper_add_btn">주소찾기</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>주소</td>
								<td colspan="2"><input type="text" name="helper_address1" id="helper_address1" class="form-control" readonly="readonly"></td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td colspan="2"><input type="text" name="helper_address2" id="helper_address2" class="form-control" maxlength="20"></td>
							</tr>
						</tbody>
					</table>
					<hr>

				</div>


				<div>
					<h3>사무소 정보</h3>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>사무소명</td>
								<td><input type="text" maxlength="15" name="helper_office_name" id="helper_office_name" class="form-control" placeholder="법무법인"></td>
								<td>사업자등록번호</td>
								<td><input type="text" maxlength="13" name="helper_bussiness_reg_num" id="helper_bussiness_reg_num" class="form-control" placeholder="123-12-12345"></td>
							</tr>

							<tr>
								<td>사무소전화번호</td>
								<td><input type="text" maxlength="12" name="helper_offic_tel" id="helper_offic_tel" class="form-control" placeholder="1234-1234"></td>
								<td>사무소팩스번호</td>
								<td><input type="text" maxlength="14" name="helper_offic_fax_tel" id="helper_offic_fax_tel" class="form-control" placeholder="123-1234-4567"></td>
							</tr>
							<tr>
								<td rowspan="3" class="add_rowspan">주소</td>
								<td>우편주소</td>
								<td colspan="2">
									<div class="row">
										<div class="col-md-4">
											<input type="text" name="helper_office_zipcode" id="helper_office_zipcode" class="form-control" readonly="readonly">
										</div>
										<button type="button" class="btn office_add" id="helper_office_add_btn">주소찾기</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>주소</td>
								<td colspan="2"><input type="text" name="helper_office_address1" id="helper_office_address1" class="form-control" readonly="readonly"></td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td colspan="2"><input type="text" name="helper_office_address2" id="helper_office_address2" class="form-control" maxlength="20"></td>
							</tr>
						</tbody>
					</table>

				</div>

				<br>

				<div>
					<h3>추가 정보</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td>경력명</td>
								<td>경력 유무</td>
								<td>경력 내용</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>소송사건 당사자 경력</td>
								<td><label class="radio-inline"> <input type="radio" name="helper_sosong" value="yes"> 예
								</label> <label class="radio-inline"> <input type="radio" name="helper_sosong" value="no"> 아니오
								</label></td>
								<td><textarea name="helper_sosong_content" maxlength="40" id="helepr_sosong_content" rows="1" style="resize: none;" class="form-control"></textarea></td>
							</tr>
							<tr>
								<td>보험업계 자문 경력</td>
								<td><label class="radio-inline"> <input type="radio" name="helper_bohum" value="yes"> 예
								</label> <label class="radio-inline"> <input type="radio" name="helper_bohum" value="no"> 아니오
								</label></td>
								<td><textarea name="helper_bohum_content" id="helper_bohum_content" maxlength="40" rows="1" style="resize: none;" class="form-control"></textarea></td>
							</tr>
							<tr>
								<td>형사처벌 받은 경력</td>
								<td><label class="radio-inline"> <input type="radio" name="helper_hyungsa" value="yes"> 예
								</label> <label class="radio-inline"> <input type="radio" name="helper_hyungsa" value="no"> 아니오
								</label></td>
								<td><textarea name="helper_hyungsa_content" id="helper_hyungsa_content" maxlength="40" rows="1" style="resize: none;" class="form-control"></textarea></td>
							</tr>
						</tbody>
					</table>

				</div>







				<br> <br>
				<div class="submit_btn_div text-center" style="margin: 30px;">
					<button class="btn btn-lg  btn-default submit_btn" type="button">다음</button>
				</div>

			</form>
			<!-- 서버로 전송 끝-->


		</div>
		<!-- 중앙 공간 끝-->

		<!--오른쪽 aside 공간-->
		<div class="col-md-2"></div>

	</div>
	<!-- div class=row 끝-->


</div>
<!-- div class=container-fluid 끝-->




<footer class="footer-bs">
	<div class="row">
		<div class="col-md-3 footer-brand animated fadeInLeft">
			<h2>온라인감정신청</h2>
			<p>Suspendisse hendrerit tellus laoreet luctus pharetra. Aliquam porttitor vitae orci nec ultricies. Curabitur vehicula, libero eget faucibus faucibus, purus erat eleifend enim, porta pellentesque ex mi ut sem.</p>
			<p>© All Rights Reserved</p>
		</div>
		<div class="col-md-4 footer-nav animated fadeInUp">
			<h4>안내</h4>
			<div class="col-md-6">
				<ul class="pages">
					<li><a href="#">주소</a></li>
					<li><a href="#"></a></li>
					<li><a href="#">서울시 강남구 강남대로</a></li>
					<li><a href="#">강남아파트</a></li>
					<li><a href="#">강남빌딩 7층 비트코인사무실</a></li>
				</ul>
			</div>
			<div class="col-md-6">
				<ul class="list">
					<li><a href="#">담당자 번호</a></li>
					<li><a href="#">02-747-1234</a></li>
					<li><a href="#"></a></li>
					<li><a href="#">팩스 번호</a></li>
					<li><a href="#">777-1111-2222</a></li>
				</ul>
			</div>
		</div>
		<div class="col-md-3 footer-social animated fadeInDown text-center">
			<h4>BitCoin</h4>
			<ul>
				<li><a href="#">나경민</a></li>
				<li><a href="#">성민호</a></li>
				<li><a href="#">최필규</a></li>
				<li><a href="#">정승구</a></li>
				<li><a href="#">천용혁</a></li>
				<li><a href="#">황교욱</a></li>
			</ul>
		</div>
		<div class="col-md-2 footer-ns animated fadeInRight">
			<h4>Newsletter</h4>
			<p>A rover wearing a fuzzy suit doesn’t alarm the real penguins</p>
			<p></p>
		</div>
	</div>
</footer>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

//주소 찾기 API 사용
function goPopup(){
	//주소 찾기 버튼을 누르면 절대경로로 팝업창을 오픈
	var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

};


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	//콜백 방식으로 받아온 데이터를 가입 폼에 자동 완성.
	document.getElementById('helper_address1').value=roadAddrPart1;
	document.getElementById('helper_address2').value=addrDetail;
	document.getElementById('helper_zipcode').value=zipNo;
		
};
function goPopup2(){
	//주소 찾기 버튼을 누르면 절대경로로 팝업창을 오픈
	var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup2.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

};


function jusoCallBack2(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	document.getElementById('helper_office_address1').value=roadAddrPart1;
	document.getElementById('helper_office_address2').value=addrDetail;
	document.getElementById('helper_office_zipcode').value=zipNo;	
};



$(function() {

	// 입력값 검사용 정규식 나열
	const getHelperNameCheck = RegExp(/^[가-힣]+$/);
	const getPhoneNumCheck = RegExp(/\d{3}-\d{4}-\d{4}/);
	//0901 - 전화번호
	const getTeclNumCheck = RegExp(/\d{2}-\d{4}-\d{4}/);
	const getHelperSsnCheck = RegExp(/\d{6}-\d{7}/);
	const getHelperEmailCheck = RegExp(/\S+@\S+\.\S+/);
	const getHelperBusinessRegCheck = RegExp(/\d{3}-\d{2}-\d{5}/);
	const getHelperOfficeTelCheck = RegExp(/\d{4}-\d{4}/);
	const getHelperOfficeFaxCheck = RegExp(/\d{3}-\d{4}-\d{4}/);

	// 각 항목 입력값 체크
	let chk1 = false,
		chk2 = false,
		chk3 = false,
		chk4 = false,
		chk5 = false,
		chk6 = false,
		chk8 = false,
		chk9 = false,
		chk10 = false,
		chk11 = false,
		//0901전화번호
		chk12=false;
	

	/* $('#helper_name').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk1 = false;
		} else if (!getHelperNameCheck.test($(this).val())) {
			$(this).css('background', 'pink');
			chk1 = false;
		} else {
			$(this).css('background', '');
			chk1 = true;
		}
	});

	$('#helper_ssn_number').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk2 = false;
		} else if (!getHelperSsnCheck.test($(this).val())) {
			$(this).css('background', 'pink');
			chk2 = false;
		} else {
			$(this).css('background', '');
			chk2 = true;
		}
	});

	$('#helper_phone_tel').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk3 = false;
		} else if (!getPhoneNumCheck.test($(this).val())) {
			$(this).css('background', 'pink');
			chk3 = false;
		} else {
			$(this).css('background', '');
			chk3 = true;
		}
	});

	// 일반 전화번호는 지역번호 크기가 2~3자이므로 적용방법 알아올 것
	$('#helper_home_tel').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk4 = false;
		} else {
			$(this).css('background', '');
			chk4 = true;
		}
	});

	$('#helper_email_address').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk5 = false;
		} else if (!getHelperEmailCheck.test($(this).val())) {
			$(this).css('background', 'pink');
			chk5 = false;
		} else {
			$(this).css('background', '');
			chk5 = true;
		}
	});

	$('#helper_job').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk6 = false;
		} else {
			$(this).css('background', '');
			chk6 = true;
		}
	});



	$('#helper_office_name').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk8 = false;
		} else {
			$(this).css('background', '');
			chk8 = true;
		}
	});

	$('#helper_bussiness_reg_num').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk9 = false;
		} else if (!getHelperBusinessRegCheck.test($(this).val())) {
			$(this).css('background', 'pink');
			chk9 = false;
		} else {
			$(this).css('background', '');
			chk9 = true;
		}
	});

	$('#helper_offic_tel').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk10 = false;
		} else if (!getHelperOfficeTelCheck.test($(this).val())) {
			$(this).css('background', 'pink');
			chk10 = false;
		} else {
			$(this).css('background', '');
			chk10 = true;
		}
	});

	$('#helper_offic_fax_tel').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk11 = false;
		} else if (!getHelperOfficeFaxCheck.test($(this).val())) {
			$(this).css('background', 'pink');
			chk11 = false;
		} else {
			$(this).css('background', '');
			chk11 = true;
		}
	});
	$('#helper_home_tel').keyup(function() {
		if ($(this).val() === '') {
			$(this).css('background', 'pink');
			chk12 = false;
		} else if (!getTeclNumCheck.test($(this).val())) {
			$(this).css('background', 'pink');
			chk12 = false;
		} else {
			$(this).css('background', '');
			chk12 = true;
		}
	}); */




 	$('.submit_btn').click(function() {
 		

	/* 	if ($('#mid').val() !== 'sel' && $('#small').val() === 'sel') {
			alert('조력자 소분야를 다시 설정하세요');
			return
		} */
		
		
		//정규 표현식 테스트 
/*  	 	console.log(chk1);
		console.log(chk2);
		console.log(chk3);
		console.log(chk4);
		console.log(chk5);
		console.log(chk6);

		console.log(chk8);
		console.log(chk9);
		console.log(chk10);
		console.log(chk11);
		console.log(chk12);
		if (chk1 && chk2 && chk3 && chk4 && chk5 && chk6&& chk8 &&
			chk9 && chk10 && chk11&&chk12) {
		

			$('form').submit();
		} else {
			alert('모든 양식을 정확하게 입력하였는지 확인해 주십시오.');
		} */
		
		
		
		
		$('form').submit();

});
});

	$(document).ready(function(){
		
		/* 감정 분야 중 분류 선택에 따른  소 분류 선택*/
		$('#mid').change(function(){
		
			
			if($('#mid').val()==='general'){
	    		$('#small').html("<option >선택</option><option>측량</option><option>문서</option>");
	    	}else if($('#mid').val()==='inter'){
	    		$('#small').html("<option >선택</option><option >통역인</option><option >번역인</option>");
	    	}else{
	    		$('#small').html("<option >선택</option><option >의사</option><option >회계사</option>");
	    	}
		});
		
		
		/*접수 신청 버튼 클릭시 */
		$('.submit_btn').click(function(){
			
			if($('#mid').val()==='sel'){
				if($('#small').val()==='sel'){
					alert('조력자 분야를 다시 설정하세요');
					return
				}
			}
			
			if($('#mid').val()!=='sel' && $('#small').val()==='sel'){
				alert('조력자 소분야를 다시 설정하세요');
				return
			}
		});
		
		/*희망 법원 선택*/
		var wovks={0:"대법원",1:"서울고등법원",2:"서울고등법원(춘천)",3:"대구고등법원",4:"부산고등법원",5:"인천고등법원",6:"광주고등법원",7:"대전고등법원"}

		var arr=[];
		var arr2=[];
		
		$('#btn_add').click(function(){
			var select = document.getElementById('law');
			var selected_value = [...select.selectedOptions].map(option => option.value);
			var selected_text = [...select.selectedOptions].map(option => option.text);
		 	
		 	var code=$('#law2').html().trim();   
		 	var selected_list=[];
		 	for(var n=0;n<selected_value.length;n++){
				code=code+"<option selected='selected'>"+selected_text[n]+"</option>"
				selected_list="<option>"+selected_text[n]+"</option>"
				
				if(arr.includes(selected_text[n])){
					alert('중복된 희망 법원입니다');
					return
				}
				//중복되지 않았을 시에 배열에 저장 됨
				arr.push(selected_text[n]); //법원 이름만 저장됨
				$('#law3').attr('value',arr);
				arr2.push(selected_list);  
		}
			$('#law2').html(code); 
	})
	
		//희망 법원 빼기 
		$('#btn_minus').click(function(){
			var select = document.getElementById('law2');
			var selected_value = [...select.selectedOptions].map(option => option.value);
			var selected_text = [...select.selectedOptions].map(option => option.text);		
			var code=$('#law2').html();  
			
			for(var aabb=0;aabb<selected_text.length;aabb++){
				if(arr.includes(selected_text[aabb])){
					 arr2.splice(arr.indexOf(selected_text[aabb]),1);  //<option></option>의 형태로 저장되어 있는 배열에서 삭제함
                    arr.splice(arr.indexOf(selected_text[aabb]),1);  //법원 이름만 적혀있는 배열에서 삭제함
				}
			}
			$('#law2').html(arr2); 
			if(selected_text.length ===0){
				alert('희망 법원이 아닌 것을 선택하세요.')
			}
		})

		
		
		
		$('#helper_add_btn').click(function(){
			goPopup();
		})
		
		
		
		$('#helper_office_add_btn').click(function(){
			goPopup2();
		})
		
		
		
		
	
		
	    }); //JQuery 종료
	    


</script>