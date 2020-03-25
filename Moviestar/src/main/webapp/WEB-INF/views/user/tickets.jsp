<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
$(function(){
	$(".movie").click(function(){
		var movie = $('input[name=movie]').val();
		
		alert(movie);
	});
	
	/* var movie = $('input[name=movie]').val();
	
	alert(movie); */
	/* function getValue(){
		
		 var tb = $("<table />");
		var row = $("<tr />").append(
			$("<td />").text(movie);	
		);
		
		tb.append(row);
		
		$(".wrap").append(tb); 
	} */
});
	
</script>
<title>티켓 예매하기</title>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}

div .mlab {
	weight: 30px;
	height: 40px;
}
div .slab{
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

					<div class="mvmv btn-group-vertical btn-group-toggle"
						data-toggle="buttons">
						<div class="mlab">
							<label style="font-size: 1.8em; margin-left: 35px;">영화</label>
						</div>
						<c:forEach var="m" items="${movies}">
							<label class="btn btn-primary movie"
								style="font-size: 2em; background-color: #f2f0e5; color: gray;">
								<input type="radio" name="movie" value="${m.id}">${m.title}
							</label>
						</c:forEach>
					</div>
					<span style="margin-right: 20px; margin-left: 20px;"
						class="glyphicon glyphicon-chevron-right"></span>
					<div class="mvmv btn-group-vertical btn-group-toggle"
						data-toggle="buttons">
						<div class="slab">
							<label style="font-size: 1.8em; margin-left: 60px;">극장</label>
						</div>
						<c:forEach var="s" items="${state}">
							<label class="btn btn-primary"
								style="font-size: 2em; background-color: #f2f0e5; color: gray;">
								<input type="radio" name="state" value="${s.id}">${s.name}
							</label>
						</c:forEach>
					</div>

				</div>
				<div class="wrap"></div>
			</form>
		</div>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>