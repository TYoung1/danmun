<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="DAO.db_con"%>
    <%@ page import="DTO.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="resource/css/admin.css">
</head>
<body>
<% 
	List<user> list=(List<user>) session.getAttribute("list");
	session.removeAttribute("list");
%>
		
<nav>
        <a href="home.jsp" class="logo"><h3>단먼</h3></a>
        <ul>
           <li><a href="typeword.jsp?type=2">수능단어</a></li>
            <li><a href="typeword.jsp?type=1">토익단어</a></li>
            <li><a href="typeword.jsp?type=4">토스단어</a></li>
            <li><a href="typeword.jsp?type=3">오픽단어</a></li>
            <li><a href="#">단어게임</a></li>
        </ul>
    </nav>
   	<div class="container">
   		<div class="topput">
	<form action="pleaseForm" method="post">
		<select name="type">
   			<option value="userid" selected>아이디</option>
    		<option value="username">이름</option>
    		<option value="gender">성별</option>
		</select>
		<input type="text" name="search" placeholder="회원 검색"/>
		<button type="submit">조회</button>
		</div>
		
	</form>
	<table>
	<form action="serviceForm" method="post">
		<tr>
			<th>체크</th>
			<th>유저아이디</th>
			<th>유저</th>
			<th>나이</th>
			<th>성별</th>
		</tr>
		<%
		if ( list==null||list.isEmpty()) {
		out.println("검색 결과가 없습니다.");
	} else {
		for (user each : list) {
	%>
		<tr>
			<td><input type="checkbox" name="chk" value="<%=each.getUserid() %>"/></td>
			<td><%=each.getUserid() %></td>
			<td><%=each.getUsername() %></td>
			<td><%=each.getAge() %></td>
			<td><%=each.getGender() %></td>
		</tr>	
		<%}} %>
	</table>
	<button type="submit" name="action" value="revoke">권한뺏기</button>
	<button type="submit" name="action" value="grant">권한주기</button>
	<button type="submit" name="action" value="ban">유저벤</button>
	</form>
	</div>
</body>
</html>