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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="/res/css/font.css">
<title>관리자페이지</title>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
		<br><br>
		<h1 style="font-family: 'Do Hyeon', sans-serif;"><b>관리자 페이지</b></h1><br>
		<a href="/admin/movieadd" style="color:gray;font-size:2em;">1. 영화 등록</a><br>
		<a href="/admin/faqwrite" style="color:gray;font-size:2em;">2. 자주묻는질문 등록</a><br>
		<a href="/admin/noticewrite" style="color:gray;font-size:2em;">3. 공지사항 등록</a><br>
		
	</div>
	<br>
	<br>
	<br>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>