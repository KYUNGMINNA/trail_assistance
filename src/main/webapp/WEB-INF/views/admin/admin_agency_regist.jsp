<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ include file="/WEB-INF/views/include/header.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/choiCss.css" rel="stylesheet">


<div class="container-fluid" id="wrapper">
	<div class="row">
		<div class="col-md-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">조력자 신청 관리</h3>
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="<c:url value='#' />">조력자 신청기관 관리</a></li>
					<li class="list-group-item"><a href="<c:url value='#' />">조력자 신청자 조회</a></li>
					<li class="list-group-item"><a href="<c:url value='#' />">조력자 신청자 승인 관리</a></li>
					<li class="list-group-item"><a href="<c:url value='#' />">조력자 현황 조회</a></li>
				</ul>
			</div>
		</div>

		<div class="col-xs-8 col-md-8 col-lg-8 content-wrap">
			<div class="com-admin-titlebox">
				<p>기관 등록</p>
			</div>
			<form action="<c:url value='/admin/comRegist' />" id="comRegistForm" method="post">
				<table class="table">
					<tbody class="t-control">
						<tr>
							<td class="t-title">기관명</td>
							<td><input class="form-control input-sm" id="comName" name="comName">
								<div class="text-right">
									<span id="msgName">*중복확인을 진행하세요.</span>
									<!--자바스크립트에서 추가-->
									<button type="button" class="btn btn-primary" id="nameCheckBtn">이름중복체크</button>
								</div></td>
						</tr>
						<tr>
							<td class="t-title">전화번호</td>
							<td><input class="form-control input-sm" name="comPhone"></td>
						</tr>
						<tr>
							<td class="t-title">주소</td>
							<td><input class="form-control input-sm" type="text" id="comAddress" name="comAddress" placeholder="주소">
								<div class="text-right">
									<input type="button" class="btn btn-primary" onclick="kakaoMap()" value="주소 검색"> <br>
								</div>
								<div id="map" style="width: 100%; height: 300px; margin-top: 10px;"></div></td>
						</tr>
					</tbody>
				</table>

			</form>


			<div class="com-regist-btn-wrap text-right">
				<button class="btn btn-primary" id="comRegistBtn">등록</button>
				<button class="btn" id="comListBtn">목록</button>
			</div>
		</div>
	</div>
	<input type="hidden" id="account_type" value="${login.type}">
</div>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<!-- 카카오 주소, 지도 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f27612d7a2e107af3f92b69aff8eb8af&libraries=services"></script>

<script>

	//2022-08-24 성민호 추가 , 25일 추가 (백에서 처리해야하지만 잠깐 이렇게 처리하겠습니다.)
	const isAdmin = $('#account_type').val();
	if (isAdmin != 1) {
		alert('관리자 권한이 필요한 페이지입니다.');
		location.href='<c:url value="/"/>';
	}

	$(function() {

		//등록 버튼 처리
		$('#comRegistBtn').click(function() {
			if ($('input[name=comName]').val() === '') {
				alert('기관명은 필수 항목입니다.');
				$('input[name=comName]').focus();
				return;
			} else if ($('input[name=comPhone]').val() === '') {
				alert('번호는 필수 항목입니다.');
				$('input[name=comPhone]').focus();
				return;
			} else if ($('input[name=comAddress]').val() === '') {
				alert('주소는 필수 항목입니다.');
				$('input[name=comAddress]').focus();
			} else if($('#comName').is('[readonly]') == false) {
				alert('이름 중복 확인을 진행해주세요.');
				$('input[name=comName]').focus();
				return;
			} else {
				$('#comRegistForm').submit();
			}
		});
 
		//목록 화면 이동처리
		$('#comListBtn').click(function() {
			if (confirm('목록으로 돌아가시겠습니까?')) {
				location.href = '<c:url value="/admin/admin_agency_list" />'
			} else
				return;
		});
		
		
		//기관 이름 중복 체크
		$('#nameCheckBtn').click(function() {
			
			const comNameChk = $('#comName').val();
			console.log(comNameChk);
			
			if(comNameChk === '') {
				alert('아이디는 필수값입니다.');
				return;
			}
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/admin/comNameCheck" />',
				data: comNameChk,
				contentType: 'application/json',
				success: function(data) {
					if(data === 'ok') {
						$('#comName').attr('readonly', true);
						$('#msgName').html('사용 가능한 이름입니다.');
					} else {
						$('#msgName').html('중복된 아이디입니다.');
					}
				},
				error: function() {
					alert('서버 에러입니다. 관리자에게 문의하세요.');
				}
			}); //중복확인 비동기 통신 끝.
			
			
		}); //아이디 중복 체크 끝.

		
	}); //end jquery
	
	//카카오 주소, 지도 api 처리
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	};

	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.537187, 127.005476),
		map : map
	});

	//카카오 주소, 지도 api
	function kakaoMap() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address; // 최종 주소 변수
				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("comAddress").value = addr;
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(data.address, function(results,
						status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {

						var result = results[0]; //첫번째 결과의 값을 활용

						// 해당 주소에 대한 좌표를 받아서
						var coords = new daum.maps.LatLng(result.y,
								result.x);
						// 지도를 보여준다.
						mapContainer.style.display = "block";
						map.relayout();
						// 지도 중심을 변경한다.
						map.setCenter(coords);
						// 마커를 결과값으로 받은 위치로 옮긴다.
						marker.setPosition(coords)
						
						
					}
				});
			}
		}).open();
	} //카카오 주소, 지도 api 처리 끝
</script>














