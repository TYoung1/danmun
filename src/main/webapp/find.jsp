<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@ page import="DAO.db_con"%>
    <%@ page import="DTO.user"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resource/css/findinfo.css">
<script src="resource/js/login.js"></script>
<title>Document</title>
</head>
<body>
	<nav>
        <a href="home.jsp" class="logo"><h3>단먼</h3></a>
        <ul>
            <li><a href="typeword.jsp?type=2">수능단어</a></li>
            <li><a href="typeword.jsp?type=1">토익단어</a></li>
            <li><a href="typeword.jsp?type=4">토스단어</a></li>
            <li><a href="typeword.jsp?type=3">오픽단어</a></li>
            <li><a href="minitest.jsp">단어게임</a></li>
        </ul>
    </nav>
    <% db_con db = new db_con();
   	String id = "";
    id =(String)session.getAttribute("user_id");   	
	String pw = "";
    pw =(String)session.getAttribute("user_pw");   	
    %>
    <div class="main">
    	<div class="wrapper">
    		<div class="form">
    			<div class="left">
    			<h2>아이디 찾기</h2>
    				<form action="findid" method="post">
    					<label>이름입력</label><br>
    					<input type="text" name ="user_name"><br>
    					<label>나이입력</label><br>	
    					<input type="text" name ="user_age"><br>
    					
    					<button type="submit">찾기</button>
    				</form>
    				<h2 class="result">아이디 :<%= id %></h2>
    			</div>
    			<% session.removeAttribute("user_id"); %>
    			<div class="right">
    			<h2>비밀번호 찾기</h2>
    				<form action="findpw" method="post">
    					<label>아이디입력</label><br>
    					<input type="text" name ="user_id"><br>	
    					<label>이름입력</label><br>
    					<input type="text" name ="user_name"><br>
    					<label>나이입력</label><br>	
    					<input type="text" name ="user_age"><br>
    					<button type="submit">찾기</button>
    				</form>
    				<h2 class="result">비밀번호 :<%= pw %></h2>
    				</div>
    				<% session.removeAttribute("user_pw"); %>
    		</div>
    	</div>
    </div>
</body>
</html>