<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="/res/css/font.css">
<title>공지사항 작성</title>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
		<form:form method="post" modelAttribute="notice" autocomplete="off">
			<div class="form-group">
				<label>제목</label>
				<form:input path="title" class="form-control w400"
					required="required" />
			</div>
			<div class="forn-group">
				<label>구분</label>
				<form:input path="sort" class="form-control w400"
					required="required" />
			</div>
			<div class="form-group">
				<label>내용</label>
				<form:input path="detail" class="form-control w4h2"
					required="required" />
			</div>
			<button type="submit" style="background-color: #F3969A;"
				onclick="return confirm('작성 하시겠습니까?')" class="btn">작성</button>
		</form:form>
		
	</div>
	<br>
	<br>
	<br>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>