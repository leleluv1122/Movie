<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/res/css/faq.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/minty/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">

<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="/res/js/jqueryfaq.js"></script>
<title>${notice.title}</title>
<style>
li {
	list-style: none;
}

body {
	font-family: 'Do Hyeon', sans-serif;
}

h1 {
	margin-left: 50px;
	font-size: 2em;
	margin-bottom: 50px;
}

div .detail {
	font-size: 15px;
	width: 500px;
	height: 100%;
}
</style>
</head>
<%@ include file="../../include/nav.jsp"%>
<body>



	<div class="faq container">

		<div>
			<nav class="navbar navbar-expand-lg navbar-light">
				<ul class="navbar-nav sideways">
					<li class="nav-item"><a class="nav-link" href="/support"
						title="고객센터 홈" style="font-size: 1.6em;">고객센터 홈</a></li>
					<li class="nav-item"><a class="nav-link" href="/support/faq"
						title="자주 묻는 질문" style="font-size: 1.6em; margin-left: 10px;">자주
							묻는 질문</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/support/notice" title="공지사항"
						style="font-size: 2em; margin-left: 10px;"><b>공지사항</b></a></li>
					<li class="nav-item"><a class="nav-link"
						href="/support/inquiry" title="1:1문의"
						style="font-size: 1.6em; margin-left: 10px;">1:1문의</a></li>
				</ul>
			</nav>
		</div>

		<div class="detail">
			<label>${notice.title}</label><br> <label>구분 :</label><span>
				${notice.sort}</span> <label>등록일 :</label><span><fmt:formatDate
					value="${notice.writetime}" pattern="yyyy.MM.dd" /></span> <br>
			<hr>
			<span>${notice.detail }</span>
		</div>
		<br> <br>

		<div class="pn">
			<div class="next">
				<label style="font-size:15px;">다음</label>
				<c:if test="${next!=null}">
					<a href="/support/notice/detail/${next.id}" style="color:gray;font-size:15px;">${next.title}</a>
				</c:if>
				<c:if test="${next==null}">
					<span style="font-size:15px;">다음 게시물이 없습니다.</span>
				</c:if>
			</div>
			<br>
			<div class="prev">
				<label style="font-size:15px;">이전</label>
				<c:if test="${prev!=null}">
					<a href="/support/notice/detail/${prev.id}" style="color:gray;font-size:15px;">${prev.title}</a>
				</c:if>
				<c:if test="${prev==null}">
					<span style="font-size:15px;">이전 게시물이 없습니다.</span>
				</c:if>
			</div>
		</div>
	</div>




</body>
<%@ include file="../../include/bottom.jsp"%>
</html>