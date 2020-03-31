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
<script>
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
</script>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="mvmv btn-group-vertical btn-group-toggle"
			data-toggle="buttons">
			<div class="slab">
						<label style="font-size: 1.8em;">지역</label>
					</div>
					<div class="form-group">
						<select id="state" name="state" class="form-control w300"
							required="required">
							<option value="" selected disabled>-----------지역을 골라주세요-----------</option>
							<c:forEach var="s" items="${state}">
								<option value="${s.id}">${s.name}</option>
							</c:forEach>
						</select>
					</div>


					<div class="slab">
						<label style="font-size: 1.8em;">극장</label>
					</div>
					<div class="theater">
						<div class="form-group">
							<select id="stheater" name="stheater" class="form-control w300"
								required="required">
								<option value="" selected disabled>-----------극장을 골라주세요-----------</option>
							</select>
							<script>
								$(function() {
									$('#state').change(
										function() {
											var state = $(this).serialize();
											$.ajax({
												url : '/user/sth',
												type : 'post',
												data : state,
												success : function(data) {
													var searchArr = $('#stheater').find("option");
													searchArr += "<option value=''  selected disabled>-----------극장을 골라주세요-----------</option>";
													for ( var i in data) {
														var $id = data[i].id;
														var $name = data[i].name;

														searchArr += "<option value=" +$id + ">"
															+ $name + "</option>";
													}
													document.getElementById("stheater").innerHTML = searchArr;
												}
											});
										});
								})
							</script>
						</div>
					</div>
					
					<div class="slab">
						<label style="font-size: 1.8em;">일정</label>
					</div>
					<div class="schedudu">
						<select id="schedule" name="schedule" class="form-control w300"
							required="required">
							<option value="" selected disabled>-----------일정을 골라주세요-----------</option>
						</select>
					</div>
					<script>
						$(function() {
							$('#stheater').change(
							function() {
								var theater = $(this).serialize();
								var movie = getParameterByName("movie");
								
								var param = theater + "&" + "movie" + "=" + movie;
								$.ajax({
									url : '/user/moviefind',
									type : 'post',
									data : param,
									success : function(data) {
										var searchArr = $('#schedule').find("option");
										
										searchArr += "<option value='' selected disabled>-----------일정을 골라주세요-----------</option>";
										for ( var i in data) {
											var $id = data[i].id;
											var $startrunning = data[i].startrunning;

											searchArr += "<option value=" +$id + ">"
												+ $startrunning + "</option>";
											}
											document.getElementById("schedule").innerHTML = searchArr;
										}
									});
							});
						})
					</script>
			
		</div>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>