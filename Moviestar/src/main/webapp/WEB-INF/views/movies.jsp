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
<title>MovieStar 무비차트</title>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}

.mvimg {
	width: 197px;
	position: relative;
	height: 300px;
	overflow: hidden;
	border-radius: 8px 8px 0 0;
}

.mv {
	height: 370px;
	width: 197px;
	float: left;
	margin: 25px;
	cursor: pointer;
}

div .well {
	padding: 0px;
	background-color: #ffffff;
	border-radius: 8px;
}

.release {
	margin-top: 3px;
	margin-left: 5px;
	height: 17px;
	color: #666666;
	font-weight: 500;
	white-space: nowrap;
}
</style>
</head>
<body>
	<%@ include file="include/nav.jsp"%>
	<div class="container">
		<br> <br> <br>
		<c:forEach var="m" items="${movies}">
			<div class="mv well" onclick="location.href='/movies/detail/${m.id}'">
				<div class="mv_img">
					<img src="/images/${m.imagetitle}" class="mvimg">
				</div>

				<div class="name">
					<span
						style="font-size: 2em; margin-left: 3px; color: #585858; font-weight: bold;"><b><c:choose>
								<c:when test="${fn:length(m.title) gt 13}">
									<c:out value="${fn:substring(m.title, 0, 12)}...">
									</c:out>
								</c:when>
								<c:otherwise>
									<c:out value="${m.title}">
									</c:out>
								</c:otherwise>
							</c:choose></b></span>
				</div>
				<div class="release">
					<span style="font-size:1.3em;">${m.releases} 개봉</span>
				</div>
			</div>
		</c:forEach>

	</div>
	<br>
	<br>
	<br>
	<%@ include file="include/bottom.jsp"%>
</body>
</html>