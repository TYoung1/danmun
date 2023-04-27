<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.removeAttribute("userId");
		session.removeAttribute("userPw");
		session.removeAttribute("grant");
		session.removeAttribute("name");
		response.sendRedirect("home.jsp");
		%>
</body>
</html>