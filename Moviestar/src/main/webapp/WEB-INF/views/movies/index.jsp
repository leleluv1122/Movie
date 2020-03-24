<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/res/js/jquery.js"></script>
<script src="/res/js/jquery.cookie.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
<script>
	$(function() {
		if ($.cookie("popup") == "none") {
			$("#notice_wrap").hide();
		}

		var $expChk = $("#expiresChk");
		$(".closeBtn").on("click", closePop);

		function closePop() {
			if ($expChk.is(":checked")) {
				$.cookie("popup", "none", {
					expires : 3,
					path : "/"
				});
			}
			$("#notice_wrap").fadeOut("fast");
		}
	});
</script>
<title>MovieStar</title>
<style>
body {
	font-family: 'Poor Story', cursive;
}

.notice_wrap {
	margin-left: 50px;
	position: absolute;
}

.slide {
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	margin-bottom: 60px;
	display: block;
	width: 1000px;
	height: 400px;
	overflow: hidden;
	border-radius: 8px;
	display: block;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<div id="notice_wrap" class="notice_wrap">
		<img src="/images/popupimage1.jpg" alt="공지사항">
		<p class="closeWrap">
			<input type="checkbox" name="expiresChk" id="expiresChk"> <label
				for="expiresChk">3일 동안 이 창 열지않기</label>
			<button class="closeBtn">닫기</button>
		</p>
	</div>
	<div class="container">
		<div>
			<img src="/images/whatfavorite.jpg" class="slide">
			<sec:authorize access="authenticated">
				<sec:authentication property="user.name" var="currentname" />
				<span style="font-size:1.5em;position: absolute; top: 360px;; left: 33.5%;"> <strong>${currentname}님</strong><br>
				<span>이번 주에는 어떤 영화?</span><br><span>제 추천 받아보시겠어요?</span>
				</span>
			</sec:authorize>
		</div>
	</div>
	<%-- <%@ include file="../include/bottom.jsp"%> --%>
</body>
</html>