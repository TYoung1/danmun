<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="DAO.db_con"%>
    <%@ page import="DTO.user"%>
    <%@ page import="DTO.word"%>
    <%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resource/css/find.css">
    <script src="https://kit.fontawesome.com/ec5d781ab7.js"
	crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
    <nav>
        <a href="index.html" class="logo"><h3>단먼</h3></a>
        <ul>
            <li><a href="#">수능단어</a></li>
            <li><a href="#">토익단어</a></li>
            <li><a href="#">토스단어</a></li>
            <li><a href="#">오픽단어</a></li>
        </ul>
    </nav>
    <div class="middle">
        <div class="wrapper">
            <div class="search_box">
                <input type="text"class="search">
                <button type="submit" class="sb"><i class="fa-solid fa-magnifying-glass"></i></button>
            </div>
        </div>
    </div>
     
    <div class="content">
        <div class="wrapper2">
            <% 
                	db_con db = new db_con();
                user User = new user();
               		word day = db.oneword();
               		ArrayList<word> wordList = (ArrayList<word>)request.getAttribute("wordList"); 
               		%>
                <% %>
				<% for (word each : wordList) { %>
				<div class="word">
				<h1><%= each.getWord() %> <span class="more"><a href="#">+</a></span></h1>
				<h2>뜻 : <span id="mean"><%= each.getMean() %></span></h2>
				 </div>
				<% } %>
            <div class="word">
                <h1>English <span class="more"><a href="#">+</a></span></h1>
                <h2>뜻 : <span id="mean">영어</span></h2>
            </div>
            <div class="word">
                <h1>English <span class="more"><a href="#">+</a></span></h1>
                <h2>뜻 : <span id="mean">영어</span></h2>
            </div>
            <div class="word">
                <h1>English <span class="more"><a href="#">+</a></span></h1>
                <h2>뜻 : <span id="mean">영어</span></h2>
            </div>
        </div>
    </div>
</body>
</html>