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
<link rel="stylesheet" href="/res/css/font.css">
<title>고객센터 홈</title>
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
}
.fimg{
	width:347px;
	height:208px;
}
</style>
</head>
<body>
	<%@ include file="include/nav.jsp"%>
	<div class="container">
		<br> <br>
		<!-- <table>
			<tr>
				<td><a style="cursor:pointer;"
					onclick="window.open('/support/faq','자주하는질문','width=500,height=500,location=no,status=no,scrollbars=yes');">자주
						하는 질문</a></td>
				<td></td>
			</tr>
		</table> -->
		<a href="/support/faq"><img src="/images/support/faq.jpg" class="fimg"></a>
		
		<a href="#"><img src="/images/support/1_1mon.jpg" class="fimg"></a>

	</div>
	<br>
	<br>
	<br>
	<%@ include file="include/bottom.jsp"%>
</body>
</html>