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
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
		<table class="table table-hover"
			style="width: 90%; margin-left: auto; margin-right: auto;">
			<thead>
				<tr>
					<th>예매번호</th>
					<th>영화</th>
					<th>상영시간</th>
					<th>예매시간</th>
				</tr>
			</thead>
			<tbody style="cursor: pointer;">
				<c:forEach var="r" items="${reserve}">
					<tr onclick="location.href='/user/ticketdetail/${r.id}'">
						<td>${r.reservenum}</td>
						<td>${r.movie.title}</td>
						<td><fmt:formatDate value="${r.ms.startrunning}"
								pattern="yy.MM.dd hh:mm" /></td>
						<td><fmt:formatDate value="${r.reservetime}"
								pattern="yy.MM.dd hh:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:forEach var="r" items="${reserve }">

		</c:forEach>

	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>