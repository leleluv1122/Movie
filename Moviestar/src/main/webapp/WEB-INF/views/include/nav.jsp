<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/minty/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet">
<style>
.abc {
	height: 30px;
	weight: 100%;
	margin-left: 80%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="abc">
			<sec:authorize access="not authenticated">
				<a href="/movies/login"
					style="color: gray; font-size: 1.5em; font-family: 'Do Hyeon', sans-serif; margin-left: 10px;">로그인</a>
				<a href="/movies/register"
					style="color: gray; font-size: 1.5em; font-family: 'Do Hyeon', sans-serif; margin-left: 10px;">회원가입</a>
			</sec:authorize>
			<sec:authorize access="authenticated">
				<a href="#"
					style="color: gray; font-size: 1.5em; font-family: 'Do Hyeon', sans-serif; margin-left: 10px;">myMS</a>
				<a href="/user/logout_processing"
					style="color: gray; font-size: 1.5em; font-family: 'Do Hyeon', sans-serif; margin-left: 10px;">로그아웃</a>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="/admin/index"
					style="color: gray; font-size: 1.5em; font-family: 'Do Hyeon', sans-serif;">관리자페이지</a>
			</sec:authorize>
		</div>
		<nav class="navbar navbar-expand-lg navbar-light">
			<!-- <button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button> -->
			<a class="navbar-brand" href="/"
				style="font-family: 'Lobster', cursive; font-size: 4em;">Movie
				Stars</a>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item"><a class="nav-link" href="#"
						style="font-family: 'Do Hyeon', sans-serif; font-size: 2.5em; margin-left: 90px;">영화</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="font-family: 'Do Hyeon', sans-serif; font-size: 2.5em; margin-left: 40px;">예매</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="font-family: 'Do Hyeon', sans-serif; font-size: 2.5em; margin-left: 40px;">극장</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="font-family: 'Do Hyeon', sans-serif; font-size: 2.5em; margin-left: 40px;">이벤트</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</nav>
	</div>
</body>
</html>