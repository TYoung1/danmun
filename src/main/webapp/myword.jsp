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
    <title>Document</title>
    <link rel="stylesheet" href="resource/css/myword.css">
</head>
<body>
<%
             	    db_con db = new db_con();
                	String _id = (String)session.getAttribute("userId");
                	Integer _grant = (Integer)session.getAttribute("grant");
                	String _name = (String)session.getAttribute("name");
                	String count = db.countWord(_id);
      				String _chk = (String)session.getAttribute("chk");
      				String message = "";
      				if(session.getAttribute("message") != null){
      					message = "찾을수 없는 단어입니다";
      				};
      				session.removeAttribute("message");
      				int pag = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
      			    if (request.getParameter("npage") != null)
      			    {
      			       pag = Integer.parseInt(request.getParameter("npage"));
      			     }   
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
    <div class="main">
        <div class="wrapper">
            <div class="container">
                <div class="left">
                    <form action="deletemine" method="post" onsubmit="return re()">
                    <input type="hidden" name="id" value="<%= _id %>"/>
                    <button class="delete" type="submit">Delete</button>
                        <table>
                            <h1>My Word</h1>
                            <thead>
                                <tr>
                                    <th style="background-color: #CCCCFF; text-align: center;">번호</th>
                                    <th style="background-color: #CCCCFF; text-align: center;">단어</th>
                                    <th style="background-color: #CCCCFF; text-align: center;">의미</th>
                                    <th style="background-color: #CCCCFF; text-align: center;">체크</th>    
                                </tr>
                            </thead>
                            <tbody>
                    			<% 
                    			 int a= (pag-1)*10+1;
                    			ArrayList<word>list =db.mywordList(_id,pag);
                    			for(int i=0; i<list.size();i++){
                    				
                    				%>
                                <tr>
                                    <td><%= a%></td>
                                    <td><%= list.get(i).getWord() %></td>
                                    <td><%= list.get(i).getMean() %></td>
                                    <td><input type="checkbox" name="del" value="<%= list.get(i).getSeq() %>"/></td>
                                </tr>
                                <%
                                a++;
                    			} 
                    			%>
                               
                                
                            </tbody>
                        </table>
                    </form>
                    <div class="page">
				<ul style="list-style: none;">
					<% 
			int lastpage=0;
			// 전체 게시글 카운트 개수 
			int cou = Integer.parseInt(db.countWord(_id)); 
			// 한페이지에 10개 표시 한다는 전제하에 10의배수보다 많으면 마지막페이지 +1
			if(cou% 10 !=0 ){
				lastpage = cou/10+1;
			}else{
				lastpage = cou/10;
				
			}
			for(int pageNum = 1; pageNum<=lastpage;pageNum++){
	 	%>
					<li><a href="myword.jsp?npage=<%=pageNum %>"><%= pageNum  %></a></li>
					<%
			}	
		%>
				</ul>
			</div>
                </div>
                 
                <div class="right">
                    <div class="r_top">
                        <h2><span><%= _name %></span>님 환영합니다</h2>
                      
                        <div class="info">
                       	 <a href="minitest.jsp" class="game">머리식히러가기</a>
                            <p>My Word 에 저장된 단어 : <span><%= count %>개</span></p>
                        </div>
                        <div class="else">
                            <a href="logout.jsp">로그아웃</a>
                            <a href="#">회원탈퇴</a>
                        </div>
                    </div>
                    <div class="r_bottom">
                        <form action ="addone" method="post">
                        <h2>More Word</h2>
                            <input type="text" name="addword" placeholder="단어를 입력해주세요"><br>
                            <button type="submit">추가</button>
                            <h3><%= message %>.</h3>
                            <input type="hidden" name="id" value="<%= _id %>"/>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <script src="resource/js/add.js"></script>
</body>
</html>