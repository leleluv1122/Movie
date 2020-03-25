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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/res/css/font.css">
<title>MovieStar 극장</title>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}

.state {
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
		<br> <br> <br>
		<div class="menu">
			<c:forEach var="s" items="${state}">
				<div class="state">
					<span style="font-size: 2em; color: gray;">${s.name}</span>
					<div class="area">
						<c:forEach var="st" items="${st}">
							<c:if test="${st.state.id == s.id}">
								<a style="color:#9c9c9c;font-size:1.4em;margin-right:5px;" href="">${st.name}  |</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<br>
	<br>
	<br>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>