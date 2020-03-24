<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<link rel="stylesheet" href="/res/css/font.css">
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
<title>MovieStar 회원가입</title>
<style>
.error {
	color: red;
}
</style>
<script>
$(function() {
	$("#startDate").datepicker({
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
		changeYear: true,
		minDate:"-100y",
		maxDate:+0,
		yearRange: 'c-100:c+10',
		showMonthAfterYear: true // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다.
	});
});
</script>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
		<h1>회원 가입</h1>
		<hr />
		<form:form method="post" modelAttribute="userRegistrationModel"
			autocomplete="off">
			<div class="form-group">
				<label for="userid">아이디:</label>
				<form:input path="userid" class="form-control w300" />
				<form:errors path="userid" class="error" />
			</div>
			<div class="form-group">
				<label for="passwd1">비밀번호:</label>
				<form:password path="passwd1" class="form-control w300" />
				<form:errors path="passwd1" class="error" />
			</div>
			<div class="form-group">
				<label for="passwd2">비밀번호 확인:</label>
				<form:password path="passwd2" class="form-control w300" />
				<form:errors path="passwd2" class="error" />
			</div>
			<div class="form-group">
				<label for="name">이름:</label>
				<form:input path="name" class="form-control w300" />
				<form:errors path="name" class="error" />
			</div>
			<div class="form-group">
				<label for="email">이메일:</label>
				<form:input path="email" class="form-control w300" />
				<form:errors path="email" class="error" />
			</div>
			<div class="form-group">
				<label for="phone">전화번호:</label>
				<form:input path="phone" class="form-control w300" />
				<form:errors path="phone" class="error" />
			</div>
			<div class="form-group">
				<label for="startDate">생년월일:</label>
				<form:input path="birth" id="startDate" class="form-control w300" />
			</div>
			<button type="submit" onclick="return confirm('회원가입 하시겠습니까?')"
				class="btn" style="background-color: #F3969A;">
				<i class="glyphicon glyphicon-user"></i> 회원가입
			</button>
		</form:form>
	</div>

	<%-- <%@ include file="../include/bottom.jsp"%> --%>
</body>
</html>