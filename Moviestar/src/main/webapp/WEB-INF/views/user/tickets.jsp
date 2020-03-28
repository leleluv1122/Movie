<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="/res/css/font.css">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->
<!-- <script>
	$(function() {
		$(".movie").click(function() {
			var movie = $('input[name=movie]').val();

			$(".smovie p").text(movie);
		});
	});
</script> -->
<!-- <script>
$("input[name='movie']").prop("checked", true);

</script> -->
<title>티켓 예매하기</title>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}

div .mlab {
	weight: 30px;
	height: 40px;
}

div .slab {
	weight: 30px;
	height: 40px;
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
		<div>

			<form action="/user/select" method="post">
				<div class="mov">
					<%-- <label>영화</label> <select id="movie" name="movie"
						class="form-control w300" required="required">
						<option value="">-----------영화을 골라주세요-----------</option>
						<c:forEach var="m" items="${movies}">
							<option value="${m.id}">${m.title}</option>
						</c:forEach>
					</select> --%>

					<%-- <c:forEach var="m" items="${movies}">
						<input type="radio" name="movie" value="${m.id}" />
						<span class="up">${m.title}</span>
					</c:forEach> --%>

					<%-- <div class="mvmv btn-group-vertical btn-group-toggle"
						data-toggle="buttons">
						<div class="mlab">
							<label style="font-size: 1.8em; margin-left: 35px;">영화</label>
						</div>
						<c:forEach var="m" items="${movies}">
							<label class="btn btn-primary movie" style="font-size: 2em; background-color: #f2f0e5; color: gray;">
								<input type="radio" class="radio" name="movie" value="${m.id}">${m.title}
							</label>
						</c:forEach>
					</div> --%>

					<div class="form-group">
						<!-- onchange="setState(this)" -->
						<div class="mlab">
							<label style="font-size: 1.8em;">영화</label>
						</div>
						<select id="movie" name="movie" class="form-control w300"
							required="required">
							<option value="" selected disabled>-----------영화를 골라주세요-----------</option>
							<c:forEach var="m" items="${movies}">
								<option value="${m.id}">${m.title}</option>
							</c:forEach>
						</select>
						<%-- <c:if test="${m.id=='4'}">selected</c:if>  --%>
						<!-- <script>
						$(function() {
							$('#movie').change(
								function() {
									
								});
						})
						</script> -->

					</div>




					<!-- <span style="margin-right: 20px; margin-left: 20px;"
						class="glyphicon glyphicon-chevron-right"></span> -->
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
													searchArr += "<option value=''>-----------극장을 골라주세요-----------</option>";
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
								$.ajax({
									url : '/user/moviefind',
									type : 'post',
									data : theater,
									success : function(data) {
										var searchArr = $('#schedule').find("option");
										/* var movie = ${"select[name='movie']"}.val(); */
										/* var movie = document.getElementsByName('movie');
										movie = movie.options[movie.selectedIndex].value; */
										/* alert(movie); */
										
										searchArr += "<option value=''>-----------일정을 골라주세요-----------</option>";
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
					
					<!-- <script>
					$(function() {
						$('#schedule').change(
						function() {
							/* var theater = $(this).serialize(); */
							var stheater = document.getElementsByName('stheater').value;
							alert(stheater);
							$.ajax({
								url : '/user/seatfind',
								type : 'post',
								data : stheater,
								success : function(data) {
									
								}
							});
						});
					})
					</script> -->
					
				</div>

				<%-- <div class="mvmv btn-group-vertical btn-group-toggle"
						data-toggle="buttons">
						<div class="slab">
							<label style="font-size: 1.8em; margin-left: 60px;">지역</label>
						</div>
						<c:forEach var="s" items="${state}">
							<label class="btn btn-primary"
								style="font-size: 2em; background-color: #f2f0e5; color: gray;">
								<input type="radio" id="radio_1" name="state" value="${s.id}">${s.name}
							</label>
						</c:forEach>
					</div> --%>

				<!-- <div class="smovie">
					<p>영화선택</p>
				</div> -->
				
				
				
				
				
			</form>
		</div>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>