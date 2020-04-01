<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}

.screen {
	width: 90%;
	height: 20px;
	text-align: center;
}
.seat{
	width: 90%;
}
</style>
<title>티켓 예매하기 - 좌석선택</title>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="screen">
			<span style="font-size: 2em">SCREEN</span>
		</div>
		<div class="seat">
			${seat.row } ${seat.col }
		</div>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>