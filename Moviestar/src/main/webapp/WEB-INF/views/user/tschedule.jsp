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
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="res/index.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/res/css/font.css">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>티켓 예매하기 - 영화 고르기</title>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}
div .mvmv {
	margin-left: 50px;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="mvmv btn-group-vertical btn-group-toggle"
			data-toggle="buttons">
			<div class="mlab">
				<label style="font-size: 1.8em; margin-left: 50px;">지역</label>
			</div>
			<c:forEach var="s" items="${state}">
				<label class="btn btn-primary movie"
					style="font-size: 2em; background-color: #f2f0e5; color: gray;">
					<input type="radio" class="radio" id="state" name="state" value="${s.id}" onclick="changes(this.value)">${s.name}
					<script>
										function changes(state) {
											alert(state);
											$.ajax({
												url : '/user/sth',
												type : 'post',
												data : state,
												success : function(data) {
													var box;
													for ( var i in data) {
														var $id = data[i].id;
														var $name = data[i].name;
														
														box += "<input type='radio' class='radio' name='state' value="
															+ $id + ">" + $name;
													}
													$(".tttt").append(box);
												}
											});
										}
							</script>
				</label>
			</c:forEach>
		</div>
		
		<div class="mvmv btn-group-vertical btn-group-toggle"
			data-toggle="buttons">
			<div class="mlab">
				<label style="font-size: 1.8em; margin-left: 50px;">극장</label>
				<div class="tttt"></div>
			</div>
			
		</div>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>