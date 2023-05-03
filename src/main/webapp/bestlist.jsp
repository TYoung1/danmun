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
    <link rel="stylesheet" href="resource/css/type.css">
    <script src="https://kit.fontawesome.com/ec5d781ab7.js"
	crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
<% String _id = (String)session.getAttribute("userId"); %>
<% int type= 0;
	if(request.getParameter("type")!= null){
		type = Integer.parseInt(request.getParameter("type"));
		} 
		%>
		<%String _dup = (String)session.getAttribute("dup"); %>
					<% if(_dup == "1"){ 
                       		session.removeAttribute("dup");
                       		_dup ="";
                       	%>
                       	<script>
							alert("이미 저장되어 있는 단어가 포함되어 있습니다");
						</script>
                       	<%}%>
		
    <nav>
        <a href="home.jsp" class="logo"><h3>단먼</h3></a>
        <ul>
            <li><a href="typeword.jsp?type=2">수능단어</a></li>
            <li><a href="typeword.jsp?type=1">토익단어</a></li>
            <li><a href="typeword.jsp?type=4">토스단어</a></li>
            <li><a href="typeword.jsp?type=3">오픽단어</a></li>
        </ul>
    </nav>
   
     
    <div class="content">
        <div class="wrapper2">
           <% 
                	db_con db = new db_con();
               		 user User = new user();	
               	for(int i=0;i<30;i++){
                        	ArrayList<word> list = db.getbestList();
                        	%>
                            
				<div class="word">
				<h1><%= list.get(i).getWord() %> <span class="more">
				<form method="post" action="addatlist" onsubmit="return chkid()">
				<button type="submit">+</button>
				<input type="hidden" name="addword" value="<%= list.get(i).getSeq()%>">
				 <input type="hidden" name="id" id="idval" value="<%= _id %>">
				 <input type ="hidden" name="type" value="0">
				 </form></span></h1>
				<h2>뜻 : <span id="mean"><%= list.get(i).getMean() %></span></h2>
				 </div>
				<% } %>
           
        </div>
    </div>
    <script src="resource/js/add.js"></script>
</body>
</html>