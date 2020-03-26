<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/res/css/faq.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/minty/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
	
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="/res/js/jqueryfaq.js"></script>
<title>자주 하는 질문</title>
<style>
li {
	list-style: none;
}

body {
	font-family: 'Do Hyeon', sans-serif;
}

h1 {
	margin-left:50px;
	font-size:2em;
	margin-bottom:50px;
}
</style>
<script>
	$(function() {
		$.fn.extend({
			faq : function() {
				var ts = $(this);
				$.each(ts, function(i, o) {
					$("button", o).on("click", faqHanddler);
					function faqHanddler() {
						if ($(this).parent().next().is(":hidden")) {
							$("li>div:visible", o).hide();
							$(this).parent().next().show();
						} else {
							$("li>div:visible", o).hide();
						}
					}
				});
			}
		});

		$(".faq").faq();
	});
</script>
</head>
<%@ include file="../include/nav.jsp"%>
<body>
	


	<div class="faq container">
		<h1>자주 하는 질문</h1>
		<ul>
			<c:forEach var="f" items="${faq}">
				<li>
					<p>
						<button>${f.question }</button>
					</p>
					<div>
						<div class="cont">${f.answer }</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>



	
</body>
<%@ include file="../include/bottom.jsp"%>
</html>