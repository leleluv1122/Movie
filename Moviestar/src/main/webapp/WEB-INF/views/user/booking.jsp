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
<script>
	function count_ck(obj) {
		var chkbox = document.getElementsByName("ck");
		var chkCnt = 0;
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked) {
				chkCnt++;
			}
		}
		if (chkCnt > 2) {
			alert("인원을 증가시키세요=_=;");
			obj.checked = false;
			return false;
		}
	}
</script>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}
.title{
	width:90%;
	height:80px;
	text-align: center;
	font-size:2em;
}
.screen {
	width: 90%;
	height: 20px;
	text-align: center;
	margin-bottom: 20px;
}

.seat {
	width: 90%;
	text-align: center;
}

.seatimg {
	height: 20px;
	width: 23px;
	margin: 2;
}
/* input[type=checkbox] { display:none; } */
</style>
<title>티켓 예매하기 - 좌석선택</title>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="title">
			<label style="font-size:1.5em;">${s.movie.title}</label>
			<label>극장: ${s.st.name}</label>
			<span><fmt:formatDate value="${s.startrunning }" pattern="yy.MM.dd hh:mm" /></span>
			<span></span>
		</div>
		<form action="/user/reserve" method="post">
			<!--  action="/user/reserve" method="post" -->
			<sec:authentication property="user.id" var="currentid" />
			<input type="hidden" id="user" name="user" value="${currentid}" >
			<input type="hidden" id="movie" name="movie" value="${param.movie}">
			<%-- <input type="hidden" id="stheater" name="stheater"
				value="${param.stheater}"> --%> <input type="hidden"
				id="schedule" name="schedule" value="${param.schedule}"> ticket :
			<select name="cnt" style="width: 50px; height: 20px;">
				<option value="0" selected disabled >0</option>
				<c:forEach var="i" begin="1" end="6" step="1">
					<option value="${i}" >${i}</option>
				</c:forEach>
			</select>

			<div class="screen">
				<span style="font-size: 2em">SCREEN</span>
			</div>
			<div class="seat">
				<c:forEach var="r" begin="1" end="${seat.row}">
					<c:forEach var="c" begin="1" end="${seat.col }">
						<input type="checkbox" value="${r}/${c}" id="ck${r}_${c}"
							name="ck" onClick="count_ck(this);">
						<label for="ck${r}_${c}"><img src="/images/seat.jpg"
							class="seatimg" title="${r}행 ${c}열"></label>
					</c:forEach>
					<br>
				</c:forEach>
			</div>

			<button class="btn btn-secondary reserve_btn"
				style="float: right; margin-right: 100px;">예매하기</button>
		</form>
	</div>
	<%-- <img src="/images/seat.jpg" class="seatimg" title="${r}행 ${c}열"> --%>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>