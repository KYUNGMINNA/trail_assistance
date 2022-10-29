<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ include file="/WEB-INF/views/include/header.jsp"%>

<style>
/* main carousel1 */
.main-carousel {
	height: 628px;
	/* overflow: hidden; */
}

.main-carousel>.item>a>img {
	width: 100%;
	height: 628px;
}

#wrapper {
	height: auto;
	min-height: 100%;
	padding-bottom: 100px;
}

.footer {
	height: 400px;
	position: relative;
	transform: translateY(-100%);
	margin-bottom: 0;
}

html, body {
	height: 100%
}

footer li a {
	font-size: 15px;
}

/* main carousel end */

/* ------------------------------------------------------------------------------------------- */

/* main carousel2 */

/* 공지사항, 공고사항 가로 배치 */
.notice-wrap1 {
	display: inline-block;
	height: 400px;
}

.notice-wrap2 {
	display: inline-block;
	height: 400px;
	margin-left: 100px;
}

/* 서브케러셀 화살표 배경 없애기 */
.carousel-control.right {
	background: none;
}

.carousel-control.left {
	background: none;
}

/* 서브캐러셀 텍스트 위치 조정 */
.sub-carousel>.item .carousel-caption {
	margin-top: 200px;
}

/* 메인 케러셀과 위치 조정 */
.sub-main-wrap {
	margin-top: 100px;
}

/* ul의 li들 간격 조정 */
.sub-notice-wrap ul li {
	margin-bottom: 10px;
}

/* 더보기 버튼 위치 조정 */
.notice-title {
	width: 300px;
}

/* 공고 글자 크기 조절 */
.item h3 {
	font-size: 40px;
	font-weight: bold;
}

.item p {
	font-size: 24px;
}

.sub-notice-wrap h3 {
	font-size: 40px;
	font-weight: bold;
}

.sub-notice-wrap ul li a {
	font-size: 24px;
}

ol {
	display: none;
}

/* footer */
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

/* main carousel2 end */
</style>
<div id="wrapper">
	<div class="container-fluid">
		<div class="row">
			<!-- <div class="col-md-1"></div> -->
			<div class="col-md-12">
				<div id="carousel-example-generic" class="carousel slide main-carousel" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner main-carousel" role="listbox">
						<div class="item active">
							<a href=""><img src="resources/img/mainslide1.jpg" alt="img"></a>
						</div>

						<div class="item">
							<a href=""><img src="resources/img/mainslide2.jpg" alt="img"></a>
						</div>

						<div class="item">
							<a href=""><img src="resources/img/mainslide3.jpg" alt="img"></a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 공고 리스트 케러셀 -->
	<div class="container-fluid sub-main-wrap">
		<div class="row">
			<div class="col-md-1"></div>

			<div class="col-md-4">
				<div id="carousel-example-generic2" class="carousel slide sub-slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic2" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic2" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic2" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner sub-carousel" role="listbox">
						<div class="item active">
							<div class="carousel-img-wrap text-center">
								<a href="<c:url value='/assistant/category_select' />"> <img src="resources/img/6217271_doctor_job_man_medical_people_icon.svg" alt="...">
								</a>
							</div>
							<div class="text-center">
								<h3>의사 조력자 공고</h3>
								<p>의사 조력자를 모집 중입니다.</p>
							</div>
						</div>
						<div class="item">
							<div class="carousel-img-wrap text-center">
								<a href="<c:url value='/assistant/category_select' />"> <img src="resources/img/7114151_language change_language_translator_subtitle_dictionary_icon.svg" alt="...">
								</a>
							</div>
							<div class="text-center">
								<h3>번역가 조력자 공고</h3>
								<p>번역가 조력자를 모집 중입니다.</p>
							</div>
						</div>
						<div class="item">
							<div class="carousel-img-wrap text-center">
								<a href="<c:url value='/assistant/category_select' />"> <img src="resources/img/9151171_constitution_law_jurisprudence_book_justice_icon.svg" alt="...">
								</a>
							</div>
							<div class="text-center">
								<h3>변호사 조력자 공고</h3>
								<p>변호사 조력자를 모집 중입니다.</p>
							</div>
						</div>
					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic2" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic2" role="button" data-slide="next">
					 	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
					</a>
				</div>
			</div>

			<div class="col-md-1"></div>

			<!-- 공지사항 -->
			<div class="sub-notice-wrap">
				<div class="col-md-2 text-center">
					<div class="notice-wrap1 list">
						<ul class="list-group">
							<div class="notice-title">
								<h3>공지 사항</h3>
								<div class="text-right">
									<a href="<c:url value='/noticeboard/list' />"> <span class="badge">더보기</span>
									</a>
								</div>
							</div>
							<c:forEach var="noticeList" items="${noticeList}">
								<li class="text-left" style="margin-left: 80px"><a href="<c:url value='/noticeboard/view/${noticeList.notice_id}' />">${noticeList.notice_title}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>

				<!-- <div class="col-md-1"></div> -->

				<div class="col-md-2 text-center">
					<div class="notice-wrap2 list">
						<ul class="list-group">
							<div class="notice-title">
								<h3>조력자 공고</h3>
								<div class="text-right">
									<a href="<c:url value='/articleboard/list' />"> <span class="badge">더보기</span>
									</a>
								</div>
							</div>
							<c:forEach var="articleList" items="${articleList}">
								<li class="text-left" style="margin-left: 80px"><a href="<c:url value='/articleboard/view/${articleList.article_id}' />">${articleList.article_title}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-1"></div>

		</div>
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
   const msg = '${msg}';
   if (msg === 'pwChangeSuccess') {
      alert('비밀번호가 성공적으로 변경되었습니다.');
   } else if (msg === 'pwChangeFailed') {
      alert('비밀번호 변경에 실패했습니다.');
   } else if(msg === '현재 모집중인 개인 조력자 공고가 없습니다!') {
      alert('현재 모집중인 개인 조력자 공고가 없습니다!');
   } else if(msg === '현재 모집중인 기관 조력자 공고가 없습니다!') {
      alert('현재 모집중인 기관 조력자 공고가 없습니다!');
   }
</script>
