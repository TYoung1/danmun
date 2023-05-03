<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DAO.db_con"%>
    <%@ page import="DTO.user"%>
    <%@ page import="DTO.word"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="resource/css/mini.css">
<body>
 <nav>
        <a href="home.jsp" class="logo"><h3>단먼</h3></a>
        <ul>
            <li><a href="typeword.jsp?type=2">수능단어</a></li>
            <li><a href="typeword.jsp?type=1">토익단어</a></li>
            <li><a href="typeword.jsp?type=4">토스단어</a></li>
            <li><a href="typeword.jsp?type=3">오픽단어</a></li>
       </ul>
    </nav>
<%
					db_con db = new db_con();
               		word day = db.miniword();%>
	<div class="main">
	<div class="inputbox">
		<input type="hidden" class="answer" value="<%= day.getWord() %>">
		<input type="text" class="input" maxlength="1" oninput="handleOnInput(this)">
		<input type="text" class="input" maxlength="1" oninput="handleOnInput(this)">
		<input type="text" class="input" maxlength="1" oninput="handleOnInput(this)">
		<input type="text" class="input" maxlength="1" oninput="handleOnInput(this)">
		<input type="text" class="input" maxlength="1" oninput="handleOnInput(this)">
	</div>
		<div class="btn"><button onclick="result()">확인하기</button>
		<button onClick="window.location.reload()">다시하기</button></div>
		
	</div>
	<script src="resource/js/minitest.js"></script>
</body>
</html>