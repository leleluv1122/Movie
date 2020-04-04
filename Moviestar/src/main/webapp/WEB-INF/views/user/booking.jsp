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
<!-- <script>
	/* function count_ck(obj) {
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
	} */
</script> -->
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}

.title {
	width: 90%;
	height: 80px;
	text-align: center;
	font-size: 2em;
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

.ck_img {
	background: url('/images/seat.JPG');
	height: 20px;
	max-height: 100%;
	width: 23px;
	max-width: 100%;
	margin: 2;
}

input[type="checkbox"]+label span {
	display: inline-block;
	width: 23px;
	height: 20px;
}

input[type="checkbox"]:checked+label span {
	background: url(/images/seatclick.JPG);
}

/* background:url('/images/seat.JPG') */
input[type=checkbox] {
	display: none;
}

.seatimg {
	width: 23px;
	height: 20px;
}
</style>
<title>티켓 예매하기 - 좌석선택</title>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="title">
			<label style="font-size: 1.5em;">${s.movie.title}</label> <label>극장:
				${s.st.name}</label> <span><fmt:formatDate value="${s.startrunning }"
					pattern="yy.MM.dd hh:mm" /></span> <span></span>
		</div>
		<form action="/user/reserve" method="post" autocomplete="off">
			<!--  action="/user/reserve" method="post" -->
			<sec:authentication property="user.id" var="currentid" />
			<input type="hidden" name="user" value="${currentid}"> <input
				type="hidden" name="movie" value="${param.movie}">
			<%-- <input type="hidden" id="stheater" name="stheater"
				value="${param.stheater}"> --%>
			<input type="hidden" name="schedule" value="${param.schedule}">
			ticket : <select name="cnt" id="cnt"
				style="width: 50px; height: 20px;">
				<!-- onChange="SelectValue(this.value)" -->
				<option value="0" selected disabled>0</option>
				<c:forEach var="i" begin="1" end="6" step="1">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
			<script>
				/* function SelectValue(value) {
					alert(value);
				} */
				function count_ck(obj) {
					var target = document.getElementById("cnt");
					var rcnt = target.options[target.selectedIndex].value;
					var chkbox = document.getElementsByName("ck");
					var chkCnt = 0;
					for (var i = 0; i < chkbox.length; i++) {
						if (chkbox[i].checked) {
							chkCnt++;
						}
					}
					if (rcnt == 0) {
						alert("인원을 선택하세용>_<;;");
						obj.checked = false;
						return false;
					} else if (chkCnt > rcnt && rcnt > 0) {
						alert("인원을 증가시키세요=_=;;");
						obj.checked = false;
						return false;
					}
				}
			</script>
			<div align="right" style="padding-right: 40px">
				<img src="/images/seatno.JPG" width="20px"> 예약불가 <img
					src="/images/seat.JPG" width="20px"> 선택가능 <img
					src="/images/seatclick.JPG" width="20px"> 선택상태
			</div>
			<div class="screen">
				<span style="font-size: 2em">SCREEN</span>
			</div>
			<%-- <c:set var="ro" items="${reserve.rownum}"></c:set>
			<c:set var="co" items="${reserve.colnum}"></c:set> --%>
			<div class="seat">
				<c:forEach var="r" begin="1" end="${seat.row}">
					<c:forEach var="c" begin="1" end="${seat.col }">
						<%-- 
						<c:forEach var="rr" items="${reserve}">
							<c:if test="${rr.colnum != c || rr.rownum != r}"> --%>


						<input type="checkbox" value="${r}${c}" id="ck${r}${c}" name="ck"
							onClick="count_ck(this);">
						<label for="ck${r}${c}" class="ck_img"> <span
							title="${r}행 ${c}열"></span>
						</label>

						<%-- <img src="/images/seat.jpg"
							class="seatimg" title="${r}행 ${c}열"> --%>
						<%-- </c:if>
						</c:forEach> --%>
					</c:forEach>
					<br>
				</c:forEach>
			</div>

			<div class="total"></div>

			<button type="submit" onclick="return confirm('예매 하시겠습니까?')"
				class="btn btn-secondary" style="float: right; margin-right: 100px;">
				<i class="glyphicon glyphicon-ok" style="margin-right: 2px;"></i>
				예매하기
			</button>
		</form>
	</div>
	<%-- <img src="/images/seat.jpg" class="seatimg" title="${r}행 ${c}열"> --%>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>