<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/res/js/jquery.js"></script>
<script src="/res/js/jquery-ui-1.10.4.custom.min.js"></script>
<link rel="stylesheet" href="/res/css/jquery-ui.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="/res/css/font.css">
<script>
	$(function() {
		$("#release").datepicker({
			dateFormat : 'yy-mm-dd',
			changeMonth : true,
			changeYear : true,
			minDate : "-100y",
			maxDate : "+1m",
			yearRange : 'c-100:c+10',
			showMonthAfterYear : true
		});
	});
</script>
<title>관리자페이지 - 영화 등록</title>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
		<br> <br>
		<h1 style="font-family: 'Do Hyeon', sans-serif;">영화 등록 페이지</h1>
		<br>
		<form action="/admin/fileinsert" method="post"
			enctype="multipart/form-data" autocomplete="off">
			<div class="form-group">
				<label for="title">영화 제목</label><input type="text"
					class="form-control w200" name="title" placeholder="영화제목을 입력하세요"
					required />
			</div>
			<div class="form-group">
				<label for="director">영화 감독</label><input type="text"
					class="form-control w200" name="director" placeholder="감독이름을 입력하세요"
					required />
			</div>
			<div class="form-group">
				<label for="actor">주연배우</label><input type="text"
					class="form-control w200" name="actor" placeholder="주연배우를 입력하세요"
					required />
			</div>
			<div class="form-group">
				<label for="release">개봉날짜</label> <input name="release" id="release"  placeholder="영화의 개봉날짜를 입력하세요"
					class="form-control w200" required />
			</div>
			<div class="form-group">
				<label for="detail">영화 간략한내용</label><input type="text"
					class="form-control w200" name="detail"
					placeholder="영화의 간략한 내용을 입력하세요" required />
			</div>
			<div class="form-group">
				<label for="genre">영화 장르</label><input type="text"
					class="form-control w200" name="genre" placeholder="영화의 장르를 입력하세요"
					required />
			</div>
			<div class="form-group">
				<label for="file">영화 메인 사진</label> <input type="file"
					name="imagetitle" required />
			</div>
			<div class="form-group">
				<label for="file">영화 스틸컷</label> <input multiple="multiple"
					type="file" name="files" required />
			</div>
			<button type="submit" onclick="return confirm('영화를 등록 하시겠습니까?')"
				class="btn" style="background-color: #F3969A;">
				<i class="glyphicon glyphicon-ok" style="margin-right:2px;"></i> 등록
			</button>
		</form>
	</div>
	<br>
	<br>
	<br>
	<%-- <%@ include file="../include/bottom.jsp"%> --%>
</body>
</html>