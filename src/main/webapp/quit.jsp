<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="resource/css/quit.css">
</head>

<body>
	<%
		String _id = (String)session.getAttribute("userId");
		%>
	
		<div class="main">
			<div class="wrap">
				<div class="big">정말로 탈퇴하시겠습니까?</div>
	<form method="post" action="quit">
				<input type="hidden" value="<%= _id %>" name="id">
				<button type="submit" class="btn" id="yes">네</button>
	</form>
				<button onClick="location.href='home.jsp'" class="btn" id="no">아니요</button>
			</div>
		</div>		
	
</body>
</html>