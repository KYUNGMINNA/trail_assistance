<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<style>
.modal-backdrop {
	z-index: 0;
	background-color: #fff;
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
<div class="container-fluid" id="wrapper">
	<div class="row">
		<div class="col-md-2"></div>
		<!--왼쪽 aside공간 -->


		<div class="col-md-8">
			<!-- 중앙 공간-->
			<h2>조력자 신청</h2>

			<form action="<c:url value='/assistant/update'/>" method="post" name="helper_assistant">
				<div>
					<h3>학력 사항</h3>
					<div class="text-right">
						<button type="button" class="insert_edu">학력 사항 입력</button>
						<!--data-toggle="modal" data-target="#myModal"-->
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td>학교명</td>
								<td>학과전공</td>
								<td>학위</td>
								<td>입학일</td>
								<td>졸업일</td>
								<td>최종학력</td>
								<td>관리</td>
							</tr>
						</thead>
						<tbody class="info_insert">
						</tbody>
					</table>


					<br>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>증명 파일</td>
								<td><input type="file" name="hepler_edu_file" id="hepler_edu_file">
									<button type="button" class="btn-sm" id="helper_edu_fileUpload">등록하기</button></td>
							</tr>
						</tbody>
					</table>
				</div>

				<br> <br>


				<div>
					<h3>근무 경력 사항</h3>
					<div class="text-right">
						<button type="button" class="career_info">근무 경력 사항 입력</button>
						<!--data-toggle="modal" data-target="#myModal"-->
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td>회사명</td>
								<td>기간</td>
								<td>수행업무</td>
								<td>부서</td>
								<td>직책</td>
								<td>관리</td>
							</tr>
						</thead>
						<tbody class="career_insert">
						</tbody>
					</table>

					<br>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>증명 파일</td>
								<td><input type="file" name="hepler_career_file" id="hepler_career_file">
									<button type="button" class="btn-sm" id="hepler_career_fileUpload">등록하기</button></td>
							</tr>
						</tbody>
					</table>
				</div>


				<br> <br>

				<!--자격 및 면허 사항-->
				<div>
					<h3>자격 면허사항</h3>
					<div class="text-right">
						<button type="button" class="license_info">자격 및 면허사항 입력</button>
						<!--data-toggle="modal" data-target="#myModal"-->
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td>자격/면허명</td>
								<td>발급기관</td>
								<td>자격번호</td>
								<td>발급일</td>
								<td>관리</td>
							</tr>
						</thead>
						<tbody class="license_insert">
						</tbody>
					</table>

					<br>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>증명 파일</td>
								<td><input type="file" name="hepler_license_file" id="hepler_license_file">
									<button type="button" class="btn-sm" id="hepler_license_fileUpload">등록하기</button></td>
							</tr>
						</tbody>

					</table>
				</div>


				<div class="submit_btn_div text-center" style="margin: 20px;">
					<button class="btn btn-lg btn-default submit_btn">신청</button>
				</div>

			</form>
		</div>






		<!-- 학력 사항 모달  -->
		<!-- Modal -->


		<div class="modal fade" id="edu_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4>학력사항 입력</h4>
					</div>


					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>학교명</td>
									<td colspan="3"><input type="text" class="form-control" name="helper_school_name" id="helper_school_name" maxlength="10">
										<div id="helper_school_name_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>학과(전공)</td>
									<td><input type="text" class="form-control" maxlength="20" name="helper_school_major" id="helper_school_major">
										<div id="helper_school_major_chk" class="text-center"></div></td>
									<td>학위</td>
									<td><select class="form-control" name="helper_education" id="helper_education">
											<option value="" selected>최종 학위</option>
											<option value="">대학교 수료</option>
											<option value="">대학원 졸업</option>
											<option value="">석사 수료</option>
											<option value="">석사 졸업</option>
											<option value="">박사 수료</option>
											<option value="">박사 졸업</option>
									</select></td>
								</tr>
								<tr>
									<td>입학 년월</td>
									<td><input type="text" class="form-control" name="helper_school_admission" id="helper_school_admission" placeholder="2010-03">
										<div id="helper_school_admission_chk" class="text-center"></div></td>
									<td>졸업 년월</td>
									<td><input type="text" class="form-control" name="helper_school_graduate" id="helper_school_graduate" placeholder="2020-03">
										<div id="helper_school_graduate_chk" class="text-center"></div></td>
								</tr>


							</tbody>
						</table>
						<div class="text-center">
							<button type="button" class="edu_btn">입력</button>
						</div>
					</div>

				</div>
			</div>
		</div>



		<!--수정용 모달 -->

		<div class="modal fade" id="edu_modify_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4>수정모달 입력</h4>
					</div>



					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>학교명</td>
									<td colspan="3"><input type="text" class="form-control" maxlength="10" name="modi_helper_school_name" id="modi_helper_school_name">
										<div id="modi_helper_school_name_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>학과(전공)</td>
									<td><input type="text" class="form-control" maxlength="20" name="modi_helper_school_major" id="modi_helper_school_major">
										<div id="modi_helper_school_major_chk" class="text-center"></div></td>
									<td>학위</td>
									<td><select class="form-control" name="modi_helper_education" id="modi_helper_education">
											<option value="">최종 학위</option>
											<option value="">대학교 수료</option>
											<option value="">대학원 졸업</option>
											<option value="">석사 수료</option>
											<option value="">석사 졸업</option>
											<option value="">박사 수료</option>
											<option value="">박사 졸업</option>
									</select></td>
								</tr>
								<tr>


									<td>입학 년월</td>
									<td><input type="text" class="form-control" name="modi_helper_school_admission" id="modi_helper_school_admission">
										<div id="modi_helper_school_admission_chk" calss="text-center"></div></td>
									<td>졸업 년월</td>
									<td><input type="text" class="form-control" name="modi_helper_school_graduate" id="modi_helper_school_graduate">
										<div id="modi_helper_school_admission_chk" calss="text-center"></div></td>

								</tr>

							</tbody>
						</table>
						<div class="text-center">
							<button type="button" class="modi_edu_btn">입력</button>
						</div>
					</div>



				</div>
			</div>
		</div>
		<!-- 학력 사항 모달   끝-->




		<!-- 경력  사항 모달  -->
		<div class="modal fade" id="career_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4>경력사항 입력</h4>
					</div>


					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>회사명/활동기관명</td>
									<td colspan="3"><input type="text" maxlength="20" name="helper_career_name" id="helper_career_name">
										<div id="helper_career_name_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>기간</td>
									<td><input type="text" name="helper_career_period" id="helper_career_period">
										<div id="helper_career_period_chk" class="text-center"></div></td>
									<td>수행업무</td>
									<td><input type="text" name="helper_career_wrok" maxlength="20" id="helper_career_wrok">
										<div id="helper_career_wrok_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>부서</td>
									<td><input type="text" name="helper_career_department" maxlength="20" id="helper_career_department">
										<div id="helper_career_department_chk" class="text-center"></div></td>
									<td>직책</td>
									<td><input type="text" name="helper_career_position" maxlength="10" id="helper_career_position">
										<div id="helper_career_position_chk" class="text-center"></div></td>
								</tr>

							</tbody>
						</table>
						<div class="text-center">
							<button type="button" class="career_btn">입력</button>
						</div>
					</div>


				</div>
			</div>
		</div>

		<!-- 경력사항 수정용 모달 -->

		<div class="modal fade" id="modi_career_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4>경력사항 수정</h4>
					</div>

					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>회사명/활동기관명</td>
									<td colspan="3"><input type="text" maxlength="20" name="modi_helper_career_name" id="modi_helper_career_name">
										<div id="modi_helper_career_name_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>기간</td>
									<td><input type="text" name="modi_helper_career_period" id="modi_helper_career_period">
										<div id="modi_helper_career_period_chk" class="text-center"></div></td>
									<td>수행업무</td>
									<td><input type="text" name="modi_helper_career_wrok" maxlength="20" id="modi_helper_career_wrok">
										<div id="modi_helper_career_wrok_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>부서</td>
									<td><input type="text" maxlength="20" name="modi_helper_career_department" id="modi_helper_career_department">
										<div id="modi_helper_career_department_chk" class="text-center"></div></td>
									<td>직책</td>
									<td><input type="text" name="modi_helper_career_position" maxlength="20" id="modi_helper_career_position">
										<div id="modi_helper_career_position_chk" class="text-center"></div></td>

								</tr>

							</tbody>
						</table>
						<div class="text-center">
							<button type="button" class="modi_career_btn">수정</button>
						</div>
					</div>


				</div>
			</div>
		</div>
		<!-- 경력  사항 모달 끝  -->



		<!--자격 및 면허 사항 모달-->

		<div class="modal fade" id="license_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4>면허사항 입력</h4>
					</div>



					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>종목/등급 명</td>
									<td><input type="text" maxlength="20" class="form-control" name="helper_license_name" id="helper_license_name">
										<div id="helper_license_name_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>발급기관</td>
									<td><input type="text" class="form-control" maxlength="20" name="helper_license_agency" id="helper_license_agency">
										<div id="helper_license_agency_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>자격/면허 번호</td>
									<td><input type="text" class="form-control" maxlength="20" name="helper_license_num" id="helper_license_num">
										<div id="helper_license_num_chk" class="text-center"></div></td>


								</tr>
								<tr>
									<td>발급일</td>
									<td><input type="text" class="form-control" name="helper_license_date" id="helper_license_date" placeholder="2022-03-02">
										<div id="helper_license_date_chk" class="text-center"></div></td>

								</tr>

							</tbody>
						</table>
						<div class="text-center">
							<button type="button" class="license_btn">입력</button>
						</div>
					</div>



				</div>
			</div>
		</div>

		<!-- 경력사항 수정용 모달 -->

		<div class="modal fade" id="modi_license_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4>면허사항 수정</h4>
					</div>


					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>종목/등급 명</td>
									<td><input type="text" class="form-control" maxlength="20" name="modi_helper_license_name" id="modi_helper_license_name">
										<div id="modi_helper_license_name_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>발급기관</td>
									<td><input type="text" maxlength="20" class="form-control" name="modi_helper_license_agency" id="modi_helper_license_agency">
										<div id="modi_helper_license_agency_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>자격/면허 번호</td>
									<td><input type="text" maxlength="20" class="form-control" name="modi_helper_license_num" id="modi_helper_license_num">
										<div id="modi_helper_license_num_chk" class="text-center"></div></td>
								</tr>
								<tr>
									<td>발급일</td>
									<td><input type="text" class="form-control" name="modi_helper_license_date" id="modi_helper_license_date" placeholder="2022-03-02">
										<div id="modi_helper_license_date_chk" class="text-center"></div></td>
								</tr>

							</tbody>
						</table>
						<div class="text-center">
							<button type="button" class="modi_license_btn">수정</button>
						</div>
					</div>


				</div>
			</div>
		</div>

		<!--자격 및 면허사항 모달 끝-->




		<div class="col-md-2"></div>
	</div>
</div>


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





<script>
//학력사항 입력 , 항력사항 수정 하기위한 정규표현식과 변수 시작 
var regex = RegExp(/^\d{4}-(0[1-9]|1[012])$/);
var helper_school_chk=false;
var helper_major_chk=false;
var helper_admission_chk=false;
var helper_graduate_chk=false;

var modi_helper_school_chk=false;
var modi_helper_major_chk=false;
var modi_helper_admission_chk=false;
var modi_helper_graduate_chk=false;
//학력사항 입력 , 항력사항 수정 하기위한 정규표현식과 변수 시작  끝

//경력사항 입력, 수정을 하기위한 정규표현식과 변수
const careerPeriodChk = RegExp(/(^\d{4})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])~(\d{4})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/);
let helper_career_period_chk = false, 
	helper_career_name_chk = false, 
	helper_career_wrok_chk = false, 
	helper_career_department_chk = false, 
	helper_career_position_chk = false,
	modi_helper_career_period_chk = false, 
	modi_helper_career_name_chk = false, 
	modi_helper_career_wrok_chk = false, 
	modi_helper_career_department_chk = false, 
	modi_helper_career_position_chk = false
//경력사항 입력, 수정을 하기위한 정규표현식과 변수 끝



//면허 사항 입력 ,수정을 하기위한 정규표현식과 변수 시작
var license_reg = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);

var helper_license_name_chk=false;
var helper_license_agency_chk=false;
var helper_license_num_chk=false;
var helper_license_date_chk=false;

var modi_helper_license_name_chk=false;
var modi_helper_license_agency_chk=false;
var modi_helper_license_num_chk=false;
var modi_helper_license_date_chk=false;

//면허 사항 입력 ,수정을 하기위한 정규표현식과 변수 끝




    //jquery 시작
    $(document).ready(function(){

    	//정규 표현식 테스트
     	
    	///학력사향 입력 시 공백 체크 및 정규표현식 체크 시작
    	
    	  //학교명 공백 체크 
        $('#helper_school_name').keyup(function(){
            if($(this).val()===''){
                $(this).css('background', 'pink');
                $('#helper_school_name_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                helper_school_chk=false;
            }else{
            	 $(this).css('background', 'white');
                 $('#helper_school_name_chk').html('');
                 
                helper_school_chk=true;
            }

        });

        //전공 공백 체크 
        $('#helper_school_major').keyup(function(){
            if($(this).val()===''){
                $(this).css('background', 'pink');
                $('#helper_school_major_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                helper_major_chk=false;
            }else{
            	 $(this).css('background', 'white');
                 $('#helper_school_major_chk').html('');
                
                helper_major_chk=true;
            }

        });


        //학력사항 입력 - 입학년월
        $('#helper_school_admission').keyup(function() {
        if($(this).val()==''){
            $(this).css('background', 'pink');
            $('#helper_school_admission_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
            helper_admission_chk=false;
            return;
            }else if(!regex.test($('#helper_school_admission').val())){
                $(this).css('background', 'pink');
                $('#helper_school_admission_chk').html('<b style="font-size: 14px; color: red">[2010-03 입력 양식입니다]</b>');
                helper_admission_chk=false;
                    return;
                }else{
                $(this).css('background', 'white');
				$('#helper_school_admission_chk').html('<b  style="font-size: 14px; color: green">[일치 합니다]</b>');
				helper_admission_chk = true;
                }

            })

        //학년 사항 입력 -졸업 년월 
        $('#helper_school_graduate').keyup(function() {
        if($(this).val()==''){
            $(this).css('background', 'pink');
            $('helper_school_graduate_chk').html('<b style="font-size: 14px; color: red">[필수값]</b>');
            helper_graduate_chk=false;
            return;
            }else if(!regex.test($('#helper_school_graduate').val())){
                $(this).css('background', 'pink');
                $('#helper_school_graduate_chk').html('<b style="font-size: 14px; color: red">[2020-03 입력 양식]</b>');
                helper_graduate_chk=false;
                    return;
                }else{
                $(this).css('background', 'white');
				$('#helper_school_graduate_chk').html('<b style="font-size: 14px; color: green">[일치]</b>');
				helper_graduate_chk = true;
                }

            })
			///학력사향 입력 시 공백 체크 및 정규표현식 체크 끝

			
	//////////////////////////////////////////////////////////////////////////////////////////		
			
			
		///학력사향 수정 시 공백 체크 및 정규표현식 체크 시작	
        //학교명 수정 공백 체크 
        $('#modi_helper_school_name').keyup(function(){
            if($(this).val()===''){
                $(this).css('background', 'pink');
                $('#modi_helper_school_name_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                modi_helper_school_chk=false;
            }else{
            	 $(this).css('background', 'white');
                 $('#modi_helper_school_name_chk').html('');
                
                modi_helper_school_chk=true;
            }

        });

        //전공 공백 수정 체크 
        $('#modi_helper_school_major').keyup(function(){
            if($(this).val()===''){
                $(this).css('background', 'pink');
                $('#modi_helper_school_major_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                modi_helper_major_chk=false;
            }else{
            	 $(this).css('background', 'pink');
                 $('#modi_helper_school_major_chk').html('');
                
                modi_helper_major_chk=true;
            }

        });


        //학력사항 수정 - 입학년월
        $('#modi_helper_school_admission').keyup(function() {
        if($(this).val()==''){
            $(this).css('background', 'pink');
            $('#modi_helper_school_admission_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
            modi_helper_admission_chk=false;
            return;
            }else if(!regex.test($('#modi_helper_school_admission').val())){
                $(this).css('background', 'pink');
                $('#modi_helper_school_admission_chk').html('<b style="font-size: 14px; color: red">[2010-03 입력 양식입니다]</b>');
                modi_helper_admission_chk=false;
                    return;
                }else{
                $(this).css('background', 'white');
				$('#modi_helper_school_admission_chk').html('<b  style="font-size: 14px; color: green">[일치 합니다]</b>');
				modi_helper_admission_chk = true;
                }

            })

        //학년 사항 수정 -졸업 년월 
        $('#modi_helper_school_graduate').keyup(function() {
        if($(this).val()==''){
            $(this).css('background', 'pink');
            $('#modi_helper_school_graduate_chk').html('<b style="font-size: 14px; color: red">[필수값입니다]</b>');
            modi_helper_graduate_chk=false;
            return;
            }else if(!regex.test($('#modi_helper_school_graduate').val())){
                $(this).css('background', 'pink');
                $('#modi_helper_school_graduate_chk').html('<b style="font-size: 14px; color: red">[2020-03 입력 양식입니다]</b>');
                modi_helper_graduate_chk=false;
                    return;
                }else{
                $(this).css('background', 'white');
				$('#modi_helper_school_graduate_chk').html('<b style="font-size: 14px; color: green">[일치 합니다]</b>');
				modi_helper_graduate_chk = true;
                }

            })
		///학력사향 수정 시 공백 체크 및 정규표현식 체크 끝   
            
		//////////////////////////////////////////////////////////////////
		//경력사항 체크 및 정규표현식 시작
			///////////////////////////////////////
	//경력사항 입력 모달창 정규표현식 체크
	//경력사항 기간 체크
	$('#helper_career_period').keyup(function() {
		if($(this).val() === '') {
			$(this).css('background', 'pink');
			$('#helper_career_period_chk').html('<b style="font-size: 10px; color: red">[필수값입니다!]</b>');
			helper_career_period_chk = false;
		}

		//정규표현식에 어긋난 값이면 false, 올바른 값이면 true.
		else if(!careerPeriodChk.test($(this).val())) {
			$(this).css('background', 'pink');
			$('#helper_career_period_chk').html('<b style="font-size: 10px; color: red">[2020-03-02~2022-03-01 입력 양식입니다]</b>');
			helper_career_period_chk = false;
		}
		else
		{
			$(this).css('background', 'white');
			$('#helper_career_period_chk').html('<b style="font-size: 10px; color: green">[일치 합니다]</b>');
			helper_career_period_chk = true;
		}
	});
	
	//경력사항 회사명/활동기간명 공백 체크
	$('#helper_career_name').keyup(function() {
		if($(this).val() === '') {
			$(this).css('background', 'pink');
			$('#helper_career_name_chk').html('<b style="font-size: 10px; color: red">[필수값입니다]</b>');
			helper_career_name_chk = false;
		} else {
			$(this).css('background', 'white');
			$('#helper_career_name_chk').html('<b style="font-size: 10px; color: green">[일치]</b>');
			helper_career_name_chk = true;
		}
	});
	
	//경력사항 수행업무 공백 체크
	$('#helper_career_wrok').keyup(function() {
		if($(this).val() === '') {
			$(this).css('background', 'pink');
			$('#helper_career_wrok_chk').html('<b style="font-size: 10px; color: red">[필수값입니다]</b>');
			helper_career_wrok_chk = false;
		} else {
			$(this).css('background', 'white');
			$('#helper_career_wrok_chk').html('<b style="font-size: 10px; color: green">[일치합니다]</b>');
			helper_career_wrok_chk = true;
		}
	});
	
	//경력사항 부서 공백 체크
	$('#helper_career_department').keyup(function() {
		if($(this).val() === '') {
			$(this).css('background', 'pink');
			$('#helper_career_department_chk').html('<b style="font-size: 10px; color: red">[필수값입니다]</b>');
			helper_career_department_chk = false;
		} else {
			$(this).css('background', 'white');
			$('#helper_career_department_chk').html('<b style="font-size: 10px; color: green">[일치합니다]</b>');
			helper_career_department_chk = true;
		}
	});
	
	//경력사항 직책 공백 체크
	$('#helper_career_position').keyup(function() {
		if($(this).val() === '') {
			$(this).css('background', 'pink');
			$('#helper_career_position_chk').html('<b style="font-size: 10px; color: red">[필수값입니다]</b>');
			helper_career_position_chk = false;
		} else {
			$(this).css('background', 'white');
			$('#helper_career_position_chk').html('<b style="font-size: 10px; color: green">[일치합니다]</b>');
			helper_career_position_chk = true;
		}
	});
	
	
	/////////////////////////////////////////////////
	//경력사항 수정 모달창 체크
	//경력사항 기간 체크
	$('#modi_helper_career_period').keyup(function() {
		if($(this).val() === '') {
			$(this).css('background', 'pink');
			$('#modi_helper_career_period_chk').html('<b style="font-size: 10px; color: red">[필수값입니다]</b>');
			modi_helper_career_period_chk = false;
		}

		//정규표현식에 어긋난 값이면 false, 올바른 값이면 true.
		else if(!careerPeriodChk.test($(this).val())) {
			$(this).css('background', 'pink');
			$('#modi_helper_career_period_chk').html('<b style="font-size: 10px; color: red">[2020-03-02~2021-03-31 입력 양식입니다]</b>');
			modi_helper_career_period_chk = false;
		}
		else
		{
			$(this).css('background', 'white');
			$('#modi_helper_career_period_chk').html('<b style="font-size: 10px; color: green">[일치합니다]</b>');
			modi_helper_career_period_chk = true;
		}
	});
	
	//경력사항 회사명/활동기간명 공백 체크
	$('#modi_helper_career_name').keyup(function() {
		if($(this).val() === '') {
			$(this).css('background', 'pink');
			$('#modi_helper_career_name_chk').html('<b style="font-size: 10px; color: red">[필수값입니다]</b>');
			modi_helper_career_name_chk = false;
		} else {
			$(this).css('background', 'white');
			$('#modi_helper_career_name_chk').html('<b style="font-size: 10px; color: green">[일치합니다]</b>');
			modi_helper_career_name_chk = true;
		}
	});
	
	//경력사항 수행업무 공백 체크
	$('#modi_helper_career_wrok').keyup(function() {
		if($(this).val() === '') {
			$(this).css('background', 'pink');
			$('#modi_helper_career_wrok_chk').html('<b style="font-size: 10px; color: red">[필수값입니다]</b>');
			modi_helper_career_wrok_chk = false;
		} else {
			$(this).css('background', 'white');
			$('#modi_helper_career_wrok_chk').html('<b style="font-size: 10px; color: green">[일치합니다]</b>');
			modi_helper_career_wrok_chk = true;
		}
	});
	
	//경력사항 부서 공백 체크
	$('#modi_helper_career_department').keyup(function() {
		if($(this).val() === '') {
			$(this).css('background', 'pink');
			$('#modi_helper_career_department_chk').html('<b style="font-size: 10px; color: red">[필수값입니다]</b>');
			modi_helper_career_department_chk = false;
		} else {
			$(this).css('background', 'white');
			$('#modi_helper_career_department_chk').html('<b style="font-size: 10px; color: green">[일치합니다]</b>');
			modi_helper_career_department_chk = true;
		}
	});
	
	//경력사항 직책 공백 체크
	$('#modi_helper_career_position').keyup(function() {
		if($(this).val() === '') {
			$(this).css('background', 'pink');
			$('#modi_helper_career_position_chk').html('<b style="font-size: 10px; color: red">[필수값입니다]</b>');
			modi_helper_career_position_chk = false;
		} else {
			$(this).css('background', 'white');
			$('#modi_helper_career_position_chk').html('<b style="font-size: 10px; color: green">[일치합니다]</b>');
			modi_helper_career_position_chk = true;
		}
	});
	
	/////////////////////////////////////////////////
	//경력사항 체크 끝
            
         
/////////////////////////////////////////////////////////////////////////////////////////////////		
	
	
	//면허사항 정규표현식 시작
//면허 명 
  $('#helper_license_name').keyup(function(){
            if($(this).val()===''){
                $(this).css('background', 'pink');
                $('#helper_license_name_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                helper_license_name_chk=false;
                return;
            }else{
            	 $(this).css('background', 'white');
            	 $('#helper_license_name_chk').html('');
                 
               
                helper_license_name_chk=true;
            }

        });
//면허 발급기관
        $('#helper_license_agency').keyup(function(){
            console.log('찍힘')
            if($(this).val()===''){
                $(this).css('background', 'pink');
                $('#helper_license_agency_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                helper_license_agency_chk=false;
                return;
            }else{
            	$(this).css('background', 'white');
           	 $('#helper_license_agency_chk').html('');
                
                helper_license_agency_chk=true;
            }

        });


        //면허 번호
        $('#helper_license_num').keyup(function() {
        if($(this).val()==''){
            $(this).css('background', 'pink');
            $('#helper_license_num_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
            helper_license_num_chk=false;
            return;
            }else{
            	$(this).css('background', 'white');
              	 $('#helper_license_num_chk').html('');
               
				helper_license_num_chk = true;
                }

            })

        //면호 발급일
        $('#helper_license_date').keyup(function() {
        if($(this).val()==''){
            $(this).css('background', 'pink');
            $('#helper_license_date_chk').html('<b style="font-size: 14px; color: red">[필수값]</b>');
            helper_license_date_chk=false;
            return;
            }else if(!license_reg.test($('#helper_license_date').val())){
                $(this).css('background', 'pink');
                $('#helper_license_date_chk').html('<b style="font-size: 14px; color: red">[2020-03-02 입력 양식]</b>');
                helper_license_date_chk=false;
                    return;
                }else{
                $(this).css('background', 'white');
				$('#helper_license_date_chk').html('<b style="font-size: 14px; color: green">[일치]</b>');
				helper_license_date_chk = true;
                }

            })
      
            ////////////////////////////////////////////////////////////////

//면허 명 
$('#modi_helper_license_name').keyup(function(){
            if($(this).val()===''){
                $(this).css('background', 'pink');
                $('#modi_helper_license_name_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                modi_helper_license_name_chk=false;
                return;
            }else{
            	 $(this).css('background', 'white');
                 $('#modi_helper_license_name_chk').html('');
               
                modi_helper_license_name_chk=true;
            }

        });
//면허 발급기관
        $('#modi_helper_license_agency').keyup(function(){
            if($(this).val()===''){
                $(this).css('background', 'pink');
                $('#modi_helper_license_agency_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                modi_helper_license_agency_chk=false;
                return;
            }else{
            	  $(this).css('background', 'white');
                  $('#modi_helper_license_agency_chk').html('');
                
                modi_helper_license_agency_chk=true;
            }

        });


        //면허 번호
        $('#modi_helper_license_num').keyup(function() {
        if($(this).val()==''){
            $(this).css('background', 'pink');
            $('#modi_helper_license_num_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
            modi_helper_license_num_chk=false;
            return;
            }else{
            	 $(this).css('background', 'white');
                 $('#modi_helper_license_num_chk').html('');
               
				modi_helper_license_num_chk = true;
                }

            })

        //면호 발급일
        $('#modi_helper_license_date').keyup(function() {
        if($(this).val()==''){
            $(this).css('background', 'pink');
            $('#modi_helper_license_date_chk').html('<b style="font-size: 14px; color: red">[필수값입니다]</b>');
            modi_helper_license_date_chk=false;
            return;
            }else if(!license_reg.test($('#modi_helper_license_date').val())){
                $(this).css('background', 'pink');
                $('#modi_helper_license_date_chk').html('<b style="font-size: 14px; color: red">[2020-03-02 입력 양식]</b>');
                modi_helper_license_date_chk=false;
                    return;
                }else{
                $(this).css('background', 'white');
				$('#modi_helper_license_date_chk').html('<b style="font-size: 14px; color: green">[일치합니다]</b>');
				modi_helper_license_date_chk = true;
                }

            })

	
	 
	
	//면허사항 정규 표현식 끝 
	
	
	
	
	
		

        // 학력 사항 입력할 때 동적으로 여러개 입력 할 수 있게 하였음 
        $('.insert_edu').click(function(){
        
            var code=$('.info_insert').html().trim();
            
            $('#edu_info').modal('show'); 

            $('.edu_btn').click(function(){
             
            	//학교명 공백일때 한 번 더 체크 () : 왜냐면 keyup이라 아예 클릭이나 키보드를 안쓰고 작성 할 때 방지
            	if($('#helper_school_name').val()===''){
            		$('#helper_school_name').css('background', 'pink');
                    $('#helper_school_name_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
            	//  전공 공백일때 한 번 더 체크 () : 왜냐면 keyup이라 아예 클릭이나 키보드를 안쓰고 작성 할 때 방지
            	if($('#helper_school_major').val()===''){
            		$('#helper_school_major').css('background', 'pink');
                    $('#helper_school_major_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
            	
            	
            	if(helper_admission_chk && helper_graduate_chk &&helper_school_chk&&helper_major_chk){
            	
               
                var select = document.getElementById('helper_education');
                var selected_text = [...select.selectedOptions].map(option => option.text);
                console.log(selected_text)
                //code=code+"<tr><td>"+$('#helper_school_name').val()+"</td><td>"+$('#helper_school_major').val()+"</td><td>"+selected_text+"</td><td>"+$('#helper_school_admission').val()+"</td><td>"+$('#helper_school_graduate').val()+"</td><td><input type='radio' name='final_edu'></td><td><button type='button' class='edu_modi'>수정</button><button type='button' class='edu_del'>삭제</button></td></tr>";
                code=code+"<tr><td><input type='text'  id='helper_school_name' name='helper_school_name' readonly style='border :none;' value='"+$('#helper_school_name').val()+"'></td><td><input type='text' id='helper_school_major' name='helper_school_major' readonly style='border :none;' value='"+$('#helper_school_major').val()+"'></td><td><input type='text' id='helper_education' name='helper_education' readonly style='border :none;' value='"+selected_text+"'></td><td><input type='text' id='helper_school_admission' name='helper_school_admission' readonly style='border :none;' value='"+$('#helper_school_admission').val()+"'></td><td><input type='text' id='helper_school_graduate' name='helper_school_graduate' readonly style='border :none;' value='"+$('#helper_school_graduate').val()+"'></td><td><input type='radio' id='final_edu' name='final_edu'></td><td><button type='button' class='edu_modi'>수정</button><button type='button' class='edu_del'>삭제</button></td></tr>";
				 
                //화면에 컬럼 추가  
 
                $('.info_insert').html(code);
                 
             
              //모달 숨기기
              $('#edu_info').modal('hide');
            

            	 }else{
            		 alert('학력 사항을 확인해 주세요')
            	 }
              
              
            });
            
            
            
            
            
             //모달 값 초기화
             $('#helper_school_name').val(''); 
              $('#helper_school_major').val(''); 
              $('#helper_education').val('');
              $('#helper_school_admission').val('');
              $('#helper_school_graduate').val('');

            
        });




        //////////////////////////////////////////////////////////////
        //직업 경력 입력 사항
        $('.career_info').click(function(){
        
        var code=$('.career_insert').html().trim();
        
        $('#career_info').modal('show'); 

        $('.career_btn').click(function(){
        
/////////////////여기여기/////////////////////////////////////////////
        	//입력값 공백 한번 더 체크
        	if($('#helper_career_period').val()===''){
        		$('#helper_career_period').css('background', 'pink');
                $('#helper_career_period_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
               	return;
        	}
        	if($('#helper_career_name').val()===''){
        		$('#helper_career_name').css('background', 'pink');
                $('#helper_career_name_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
               	return;
        	}
        	if($('#helper_career_wrok').val()===''){
        		$('#helper_career_wrok').css('background', 'pink');
                $('#helper_career_wrok_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
               	return;
        	}
        	if($('#helper_career_department').val()===''){
        		$('#helper_career_department').css('background', 'pink');
                $('#helper_career_department_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
               	return;
        	}
        	if($('#helper_career_position').val()===''){
        		$('#helper_career_position').css('background', 'pink');
                $('#helper_career_position_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
               	return;
        	}
        	
        	if(helper_career_period_chk && helper_career_name_chk && helper_career_wrok_chk && helper_career_department_chk && helper_career_position_chk) {
        		
                code=code+"<tr><td><input type='text' name='helper_career_name' readonly style='border :none;' value='"+$('#helper_career_name').val()+"'></td><td><input type='text' name='helper_career_period' readonly style='border :none;' value='"+$('#helper_career_period').val()+"'></td><td><input type='text' name='helper_career_wrok' readonly style='border :none;' value='"+$('#helper_career_wrok').val()+"'></td><td><input type='text' name='helper_career_department' readonly style='border :none;' value='"+$('#helper_career_department').val()+"'></td><td><input type='text' name='helper_career_position' readonly style='border :none;' value='"+$('#helper_career_position').val()+"'></td><td><button  type='button' class='career_modi'>수정</button><button type='button' class='career_del'>삭제</button></td></tr>";

                //화면에 컬럼 추가  

                $('.career_insert').html(code);
                 
             
              //모달 숨기기
              $('#career_info').modal('hide');
        	} else {
        		 alert('입력값을 확인하세요!')
        	}


          ///////////////////여기가 마지막 /////////////////////
        });
         //모달 값 초기화
         $('#helper_carrer_name').val(''); 
          $('#helper_career_period').val(''); 
          $('#helper_career_wrok').val('');
          $('#helper_career_department').val('');
          $('#helper_career_position').val('');

        
    });

    ///////////////////////////////////////////////////
      //자격 면허사항 입력사항
        $('.license_info').click(function(){
            
            var code=$('.license_insert').html().trim();
            
            $('#license_info').modal('show'); 






            $('.license_btn').click(function(){
               	if($('#helper_license_name').val()===''){
            		$('#helper_license_name').css('background', 'pink');
                    $('#helper_license_name_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
            	//  전공 공백일때 한 번 더 체크 () : 왜냐면 keyup이라 아예 클릭이나 키보드를 안쓰고 작성 할 때 방지
            	if($('#helper_license_agency').val()===''){
            		$('#helper_license_agency').css('background', 'pink');
                    $('#helper_license_agency_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
                if($('#helper_license_num').val()===''){
            		$('#helper_license_num').css('background', 'pink');
                    $('#helper_license_num_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
                	
                if(helper_license_name_chk && helper_license_agency_chk &&helper_license_num_chk&&helper_license_date_chk){

                
                code=code+"<tr><td>"+$('#helper_license_name').val()+"</td><td>"+$('#helper_license_agency').val()+"</td><td>"+$('#helper_license_num').val()+"</td><td>"+$('#helper_license_date').val()+"</td><td><button  type='button' class='license_modi'>수정</button><button type='button' class='license_del'>삭제</button></td></tr>";

                //화면에 컬럼 추가  

                $('.license_insert').html(code);
                 
             
              //모달 숨기기
              $('#license_info').modal('hide');
            


                    }else{
                        alert('자격 면허사항 입력란을 확인 하세요');
                    }

            });









             //모달 값 초기화
             $('#helper_license_name').val(''); 
              $('#helper_license_agency').val(''); 
              $('#helper_license_num').val('');
              $('#helper_license_date').val('');


            
        });

		////////////////////////////////////////////////////////////////
		
		//파일 업로드
		
		//helper_edu_file 업로드
		$('#helper_edu_fileUpload').click(function() {
			upload1();
		});
		
		//hepler_career_file 업로드
		$('#hepler_career_fileUpload').click(function() {
			upload2();
		});
		
		//hepler_license_file 업로드
		$('#hepler_license_fileUpload').click(function() {
			upload3();
		});

		//helper_edu_file 파일 등록 함수
		function upload1() {
			//자바스크립트의 파일 확장자 체크 검색.
			let file = $('#hepler_edu_file').val();
			
			console.log(file);
			//.을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경
			file = file.slice(file.indexOf('.') + 1).toLowerCase();
			console.log(file);
			
			//ajax 폼 전송의 핵심 FormData 객체.
			const formData = new FormData();
			const data = $('#hepler_edu_file');
			
			console.log('폼 데이터: ' + formData);
			console.log('data: ' + data);
			console.log(data[0]); //input type="file" 요소를 지목할 때 사용.
			console.log(data[0].files); //파일 태그에 담긴 파일 정보를 확인하는 키값.
			console.log(data[0].files[0]); //사용자가 등록한 최종 파일 정보
			
			/*
			data[index] -> 파일 업로드 버튼이 여러 개 존재할 경우 요소의 인덱스를 지목해서 가져오는 법.
			우리는 요소를 id로 취득했기 때문에 하나만 찍히지만, class이름 같은 걸로 지목하면 여러 개가 취득되겠죠?
			files[index] -> 파일이 여러 개 전송되는 경우, 몇 번째 파일인지를 지목.
			우리는 multiple 속성을 주지 않았기 때문에 0번 인덱스 밖에 없는 겁니다.
			*/
			
			//FormData 객체에 사용자가 업로드한 파일의 정보가 들어있는 객체를 전달.
			formData.append('file', data[0].files[0]);
			
			//비동기 방식으로 파일 업로드 및 게시글 등록을 진행.
			$.ajax({
				url: '<c:url value="/assistant/upload1" />',
				type: 'post',
				data: formData, //폼 데이터 객체를 넘깁니다.
				contentType: false, //ajax 방식에서 파일을 넘길 때는 반드시 false로 처리 -> "multipart/form-data"로 선언됨.
				processData: false, //폼 데이터를 &변수=값&변수=값... 형식으로 변경되는 것을  막는 요소.
				success: function(result) {
					if(result === 'success') {
						alert('학력 파일 등록 완료!');
					} else {
						alert('업로드에 실패했습니다. 관리자에게 문의 해 주세요.');
					}
				},
				error: function(request, status, error) {
					console.log('code: ' + request + '\n message: ' + request.responseText + "\n" + 'error: ' + error);
					alert('업로드에 실패했습니다. 관리자에게 문의 해 주세요.');
				}
				
			}); //end ajax
        	
		} //upload1 end
		

		//hepler_career_file 파일 등록 함수
		function upload2() {
			//자바스크립트의 파일 확장자 체크 검색.
			let file = $('#hepler_career_file').val();
			
			console.log(file);
			//.을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경
			file = file.slice(file.indexOf('.') + 1).toLowerCase();
			console.log(file);
			
			//ajax 폼 전송의 핵심 FormData 객체.
			const formData = new FormData();
			const data = $('#hepler_career_file');
			
			console.log('폼 데이터: ' + formData);
			console.log('data: ' + data);
			console.log(data[0]); //input type="file" 요소를 지목할 때 사용.
			console.log(data[0].files); //파일 태그에 담긴 파일 정보를 확인하는 키값.
			console.log(data[0].files[0]); //사용자가 등록한 최종 파일 정보
			
			/*
			data[index] -> 파일 업로드 버튼이 여러 개 존재할 경우 요소의 인덱스를 지목해서 가져오는 법.
			우리는 요소를 id로 취득했기 때문에 하나만 찍히지만, class이름 같은 걸로 지목하면 여러 개가 취득되겠죠?
			files[index] -> 파일이 여러 개 전송되는 경우, 몇 번째 파일인지를 지목.
			우리는 multiple 속성을 주지 않았기 때문에 0번 인덱스 밖에 없는 겁니다.
			*/
			
			//FormData 객체에 사용자가 업로드한 파일의 정보가 들어있는 객체를 전달.
			formData.append('file', data[0].files[0]);
			
			//비동기 방식으로 파일 업로드 및 게시글 등록을 진행.
			$.ajax({
				url: '<c:url value="/assistant/upload2" />',
				type: 'post',
				data: formData, //폼 데이터 객체를 넘깁니다.
				contentType: false, //ajax 방식에서 파일을 넘길 때는 반드시 false로 처리 -> "multipart/form-data"로 선언됨.
				processData: false, //폼 데이터를 &변수=값&변수=값... 형식으로 변경되는 것을  막는 요소.
				success: function(result) {
					if(result === 'success') {
						alert('경력 파일 등록 완료!');
					} else {
						alert('업로드에 실패했습니다. 관리자에게 문의 해 주세요.');
					}
				},
				error: function(request, status, error) {
					console.log('code: ' + request + '\n message: ' + request.responseText + "\n" + 'error: ' + error);
					alert('업로드에 실패했습니다. 관리자에게 문의 해 주세요.');
				}
				
			}); //end ajax
        	
		} //upload2 end
		
		//hepler_license_file 파일 등록 함수
		function upload3() {
			//자바스크립트의 파일 확장자 체크 검색.
			let file = $('#hepler_license_file').val();
			
			console.log(file);
			//.을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경
			file = file.slice(file.indexOf('.') + 1).toLowerCase();
			console.log(file);
			
			//ajax 폼 전송의 핵심 FormData 객체.
			const formData = new FormData();
			const data = $('#hepler_license_file');
			
			console.log('폼 데이터: ' + formData);
			console.log('data: ' + data);
			console.log(data[0]); //input type="file" 요소를 지목할 때 사용.
			console.log(data[0].files); //파일 태그에 담긴 파일 정보를 확인하는 키값.
			console.log(data[0].files[0]); //사용자가 등록한 최종 파일 정보
			
			/*
			data[index] -> 파일 업로드 버튼이 여러 개 존재할 경우 요소의 인덱스를 지목해서 가져오는 법.
			우리는 요소를 id로 취득했기 때문에 하나만 찍히지만, class이름 같은 걸로 지목하면 여러 개가 취득되겠죠?
			files[index] -> 파일이 여러 개 전송되는 경우, 몇 번째 파일인지를 지목.
			우리는 multiple 속성을 주지 않았기 때문에 0번 인덱스 밖에 없는 겁니다.
			*/
			
			//FormData 객체에 사용자가 업로드한 파일의 정보가 들어있는 객체를 전달.
			formData.append('file', data[0].files[0]);
			
			//비동기 방식으로 파일 업로드 및 게시글 등록을 진행.
			$.ajax({
				url: '<c:url value="/assistant/upload3" />',
				type: 'post',
				data: formData, //폼 데이터 객체를 넘깁니다.
				contentType: false, //ajax 방식에서 파일을 넘길 때는 반드시 false로 처리 -> "multipart/form-data"로 선언됨.
				processData: false, //폼 데이터를 &변수=값&변수=값... 형식으로 변경되는 것을  막는 요소.
				success: function(result) {
					if(result === 'success') {
						alert('자격 면허 파일 등록 완료!');
					} else {
						alert('업로드에 실패했습니다. 관리자에게 문의 해 주세요.');
					}
				},
				error: function(request, status, error) {
					console.log('code: ' + request + '\n message: ' + request.responseText + "\n" + 'error: ' + error);
					alert('업로드에 실패했습니다. 관리자에게 문의 해 주세요.');
				}
				
			}); //end ajax
        	
		} //upload3 end



    });//jquery 끝








       //학력 수정 버튼 클릭시
       $(document).on('click','.edu_modi',function(e){
        
       	e.preventDefault();

// 			console.log($(this).closest('tr')[0].children[0].children[0].value);


            
            //수정 모달 열기
              $('#edu_modify_modal').modal('show');
            
            //처음 학력 사항 입력했을때의 값을 수정 모달로 가져오기
              $('#modi_helper_school_name').val($(this).closest('tr')[0].children[0].children[0].value); 
              $('#modi_helper_school_major').val($(this).closest('tr')[0].children[1].children[0].value); 
              $('#modi_helper_education').val($(this).closest('tr')[0].children[2].textContent.select); 
              $('#modi_helper_school_admission').val($(this).closest('tr')[0].children[3].children[0].value); 
              $('#modi_helper_school_graduate').val($(this).closest('tr')[0].children[4].children[0].value); 
           
				console.log($(this).closest('tr')[0].children[0].textContent);
            //변수에 테이블에 저장되어 있는 컬럼 위치 지정 
            // console.log($(this).closest('tr')[0].children[0].textContent);
            let a0=$(this).closest('tr')[0].children[0];
            let a1=$(this).closest('tr')[0].children[0];
            let a2=$(this).closest('tr')[0].children[1];
            let a3=$(this).closest('tr')[0].children[2];
            let a4=$(this).closest('tr')[0].children[3];
            let a5=$(this).closest('tr')[0].children[4];


         

            //수정 모달의 수정 버튼 클릭시 테이블 값 변경
            $('.modi_edu_btn').on('click',function(){
            	
            	
            	//학교명 공백일때 한 번 더 체크 () : 왜냐면 keyup이라 아예 클릭이나 키보드를 안쓰고 작성 할 때 방지
            	if($('#modi_helper_school_name').val()===''){
            		$('#modi_helper_school_name').css('background', 'pink');
                    $('#modi_helper_school_name_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
            	//  전공 공백일때 한 번 더 체크 () : 왜냐면 keyup이라 아예 클릭이나 키보드를 안쓰고 작성 할 때 방지
            	if($('#modi_helper_school_major').val()===''){
            		$('#modi_helper_school_major').css('background', 'pink');
                    $('#modi_helper_school_major_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
            	
            	
            	
            	
            	
            	
            	
            	
            	
            	if(modi_helper_admission_chk && modi_helper_graduate_chk &&modi_helper_school_chk&&modi_helper_major_chk){
                      
            	
            	
                var  select= document.getElementById('modi_helper_education');
                var modi_selected_text = [...select.selectedOptions].map(option => option.text);

                a1.textContent=$('#modi_helper_school_name').val();
                a2.textContent=$('#modi_helper_school_major').val();
                a3.textContent=modi_selected_text[0];
                a4.textContent=$('#modi_helper_school_admission').val();
                a5.textContent=$('#modi_helper_school_graduate').val();
              
                //수정 모달 닫기
                $('#edu_modify_modal').modal('hide');
                
                
                
                
            	}else{
            		alert('학력 수정 사항을 확인해 주세요')
                }
                
                
            });

            
            
            
            
            
            
        });
            




        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        //경력 사항 수정 버튼 클릭시
        $(document).on('click','.career_modi',function(e){
 

       	e.preventDefault();

            
            //수정 모달 열기
              $('#modi_career_info').modal('show');
            
            //처음 학력 사항 입력했을때의 값을 수정 모달로 가져오기
              $('#modi_helper_career_name').val($(this).closest('tr')[0].children[0].children[0].value); 
              $('#modi_helper_career_period').val($(this).closest('tr')[0].children[1].children[0].value); 
              $('#modi_helper_career_wrok').val($(this).closest('tr')[0].children[2].children[0].value); 
              $('#modi_helper_career_department').val($(this).closest('tr')[0].children[3].children[0].value); 
              $('#modi_helper_career_position').val($(this).closest('tr')[0].children[4].children[0].value); 


            //변수에 테이블에 저장되어 있는 컬럼 위치 지정 
            // console.log($(this).closest('tr')[0].children[0].textContent);

            let a1=$(this).closest('tr')[0].children[0];
            let a2=$(this).closest('tr')[0].children[1];
            let a3=$(this).closest('tr')[0].children[2];
            let a4=$(this).closest('tr')[0].children[3];
            let a5=$(this).closest('tr')[0].children[4];



         

          //수정 모달의 수정(입력) 버튼 클릭시 테이블 값 변경
            $('.modi_career_btn').on('click',function(){
            	/////////////////////여기 ///////////////////////////
            	if($('#modi_helper_career_period').val()===''){
            		$('#modi_helper_career_period').css('background', 'pink');
                    $('#modi_helper_career_period_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
            	if($('#modi_helper_career_name').val()===''){
            		$('#modi_helper_career_name').css('background', 'pink');
                    $('#modi_helper_career_name_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
            	if($('#modi_helper_career_wrok').val()===''){
            		$('#modi_helper_career_wrok').css('background', 'pink');
                    $('#modi_helper_career_wrok_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
            	if($('#modi_helper_career_department').val()===''){
            		$('#modi_helper_career_department').css('background', 'pink');
                    $('#modi_helper_career_department_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
            	if($('#modi_helper_career_position').val()===''){
            		$('#modi_helper_career_position').css('background', 'pink');
                    $('#modi_helper_career_position_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                   	return;
            	}
            	
            	if(modi_helper_career_period_chk && modi_helper_career_name_chk && modi_helper_career_wrok_chk && modi_helper_career_department_chk && modi_helper_career_position_chk) {
            		  a1.textContent=$('#modi_helper_career_name').val();
                      a2.textContent=$('#modi_helper_career_period').val();
                      a3.textContent=$('#modi_helper_career_wrok').val();
                      a4.textContent=$('#modi_helper_career_department').val();
                      a5.textContent=$('#modi_helper_career_position').val();
                    
                      //수정 모달 닫기
                      $('#modi_career_info').modal('hide');
            	} else {
            		alert('경력 수정 사항을 확인해 주세요')
            	}
                //////////////////////여기 끝 
            });

        });



        ///////////////////////////////////////////////////////////////////////
     //자격 민 면허사항 수정 버튼 클릭시
        $(document).on('click','.license_modi',function(e){

 

            
            //수정 모달 열기
              $('#modi_license_info').modal('show');
            
            //처음 학력 사항 입력했을때의 값을 수정 모달로 가져오기
              $('#modi_helper_license_name').val($(this).closest('tr')[0].children[0].textContent); 
              $('#modi_helper_license_agency').val($(this).closest('tr')[0].children[1].textContent); 
              $('#modi_helper_license_num').val($(this).closest('tr')[0].children[2].textContent); 
              $('#modi_helper_license_date').val($(this).closest('tr')[0].children[3].textContent); 


            //변수에 테이블에 저장되어 있는 컬럼 위치 지정 
            // console.log($(this).closest('tr')[0].children[0].textContent);
          
            let a1=$(this).closest('tr')[0].children[0];
            let a2=$(this).closest('tr')[0].children[1];
            let a3=$(this).closest('tr')[0].children[2];
            let a4=$(this).closest('tr')[0].children[3];




         

            //수정 모달의 수정(입력) 버튼 클릭시 테이블 값 변경
            $('.modi_license_btn').on('click',function(){
            	
            	
            	  if($('#modi_helper_license_name').val()===''){
              		$('#helper_license_name').css('background', 'pink');
                      $('#helper_license_name_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                     	return;
              	}
              	//  전공 공백일때 한 번 더 체크 () : 왜냐면 keyup이라 아예 클릭이나 키보드를 안쓰고 작성 할 때 방지
              	if($('#modi_helper_lincese_agency').val()===''){
              		$('#helper_lincese_agency').css('background', 'pink');
                      $('#helper_lincese_agency_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                     	return;
              	}
                  if($('#modi_helper_license_num').val()===''){
              		$('#helper_license_num').css('background', 'pink');
                      $('#helper_license_num_chk').html('<b  style="font-size: 14px; color: red; display:inline-block;">[필수값입니다]</b>');
                     	return;
              	}
                a1.textContent=$('#modi_helper_license_name').val();
                a2.textContent=$('#modi_helper_license_agency').val();
                a3.textContent=$('#modi_helper_license_num').val();
                a4.textContent=$('#modi_helper_license_date').val();
              

                if(helper_lincese_name_chk && helper_lincese_agency_chk &&helper_license_num_chk&&helper_license_date_chk){


                 //수정 모달 닫기
                 $('#modi_license_info').modal('hide');


                }else{
                    alert('면허사항 수정 사항을 확인해 주세요');
                    return;
                }









            });






        });




        //학력 삭제

        //학력 삭제 버튼 클릭시
        $(document).on('click','.edu_del',function(e){
         
          $(this).closest('tr')[0].textContent='';
        });


        //경력 삭제

        //학력 삭제 버튼 클릭시
        $(document).on('click','.career_del',function(e){
         
         $(this).closest('tr')[0].textContent='';
       });

       //자격 및 면허사항 삭제
       $(document).on('click','.license_del',function(e){
         
         $(this).closest('tr')[0].textContent='';
       });




       ///////////////////////////////////////////////////////////


       //이전 버튼 클릭
       $(document).on('click','.submit_before',function(e){
                
        history.back();
            });


        //신청 버튼 클릭
        $(document).on('click','.submit_btn',function(e){
        	
        	e.preventDefault();
        	
        	
             if($('.info_insert').children().length===0){
                alert('학력 사항을 입력하세요');
                return
            }else if($('.career_insert').children().length===0){
                alert('근무 경력 사항을 입력하세요');
                return
            }else if($('.license_insert').children().length===0){
                alert('자격 / 면허 사항을 입력하세요');
                return
            }else{
                $('form').submit();
            }
          
            
            

              
            });
		






</script>









