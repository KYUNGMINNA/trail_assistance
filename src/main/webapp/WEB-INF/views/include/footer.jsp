<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
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
