<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="res/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/res/css/font.css">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<title>내 티켓 보기</title>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}

.re {
	font-size: 15px;
	margin-left:100px;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
	<br><br>
		<div class="re">
			<label>예매 번호:</label><span>${reserve.reservenum}</span><br> <label>영화
				제목:</label><span>${reserve.movie.title}</span><br> <label>예매
				시간:</label><span><fmt:formatDate value="${reserve.reservetime}"
					pattern="yy.MM.dd hh:mm:ss" /></span><br> <label>예매 좌석:</label>
			<c:forEach var="rd" items="${reserve_detail}">
				<span>${rd.rownum}열 ${rd.colnum}번.</span>
			</c:forEach>
			<br>
		</div>
		<br><br>
		<a class="btn btn-primary" href="/user/mytickets"
			style="float: right; margin-right: 100px;">예매 목록으로</a>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>