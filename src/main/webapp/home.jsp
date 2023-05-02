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
    <link rel="stylesheet" href="resource/css/home.css">
    <script src="https://kit.fontawesome.com/ec5d781ab7.js"
	crossorigin="anonymous"></script>
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
</head>
<body>
			<%String _dup = (String)session.getAttribute("dup"); %>
					<% if(_dup == "1"){ 
                       		session.removeAttribute("dup");
                       	%>
                       	<script>
							alert("이미 저장되어 있는 단어가 포함되어 있습니다");
						</script>
                       	<%}else if(_dup == "0"){
                       		session.removeAttribute("dup");
                           	%>
                           	<script>
    							alert("로그인 후 이용하실 수 있습니다");
    						</script>
                       	<%} %>

    <nav>
        <a href="#" class="logo"><h3>단먼</h3></a>
        <ul>
            <li><a href="typeword.jsp?type=2">수능단어</a></li>
            <li><a href="typeword.jsp?type=1">토익단어</a></li>
            <li><a href="typeword.jsp?type=4">토스단어</a></li>
            <li><a href="typeword.jsp?type=3">오픽단어</a></li>
            <li><a href="#">단어테스트</a></li>
        </ul>
    </nav>
    <div class="main">
        <div class="wrapper">
            <div class="top">
                <div class="ban">
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="ban_wrap">
                                    <img src="resource/img/ban3.png" width="100%" height="100%">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="ban_wrap">
                                    <img src="resource/img/ban2.png" width="100%" height="100%">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="ban_wrap">
                                    <img src="resource/img/ban.png" width="100%" height="100%">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% 
                	db_con db = new db_con();
                user User = new user();
               		word day = db.oneword();
                %>
                <div class="card">
                    <div class="t_word">
                    <h1>오늘의 단어</h1>
                        <figure class="front">
                            <img src="resource/img/kocard.png" alt="영단어">
                            <figcaption>
                                <%= day.getWord() %>
                            </figcaption>
                        </figure>
                        <figure class="back">
                            <img src="resource/img/engcard.png" alt="한국단어">
                            <figcaption>
                                <%= day.getMean() %>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <%
                	String _id = (String)session.getAttribute("userId");
                	Integer _grant = (Integer)session.getAttribute("grant");
                	String _name = (String)session.getAttribute("name");
                	String count = db.countWord(_id);
      				String _chk = (String)session.getAttribute("chk");
                %>
                  	<% if(_chk == "1"){ 
                       		session.removeAttribute("chk");
                       	%>
                       	<script>
							alert("비밀번호가 일치하지 않습니다");
						</script>
                       	<%}else if(_chk == "2"){ 
                       	session.removeAttribute("chk");
                       	%>
                       	<script>
							alert("존재하지 않는 아이디 입니다.");
						</script>
                       	<%} %>
                <%if(_id == null) {%>
                <div class="login">
                    <form method="post" action="login">
                        <h1>Sign in</h1>
                        <label>ID</label><br>
                        <input type="text" class="id" name="user_id" id="user_id" onblur="chk1()"><br>
                        <p id="warnid" class="warn"></p>
                        <label>PW</label><br>
                        <input type="password" class="password" name="user_pw" id="user_pw" onblur="chk2()"><br>
                         <p id="warnpw" class="warn"></p>
                        <button type="submit" class="log">Login</button>
                     
                        <div class="another">
                            <div class="findid" onclick="location.href='findid.html'">Find ID</div>
                            <div class="findpw" onclick="location.href='findpw.html'">Find PW</div>
                            <div class="singup" onclick="location.href='signup.jsp'">Sign up</div>
                        </div>
                    </form>
                </div>
                <%}else{
                if(_grant == 0){
                %>
	               <div class="login">
	                    <form>
	                        <h2> <%=_name%>님 환영합니다</h2>
	                        <ul>
	                            <li style="text-align:center;"><a href="myword.jsp">내 단어장</a></li>
	                            <li>저장된 단어 : <span><%= count %>개</span> </li>
	                            <li>Level : <span>2</span></li>
	                        </ul>
	                        <div class="another">
	                            <div class="findid" onclick="location.href='logout.jsp'">로그아웃</div>
	                            <div class="singup" onclick="location.href='quit.jsp'">회원탈퇴</div>
	                        </div>
	                    </form>
	                </div>
                <%}else{ %>
                 <div class="login">
                    <form>
                        <h2> <%=_name%>님 환영합니다</h2>
                        <ul>
                            <li style="text-align:center;"><a href="myword.jsp">내 단어장</a></li>
                            <li>저장된 단어 : <span><%= count %>개</span> </li>
                            <li>Level : <span>2</span></li>
                        </ul>
                        <div class="another">
                        <div class="findid" onclick="location.href='logout.jsp'">공지쓰기</div>
                            <div class="singup" onclick="location.href='signup.html'">회원관리</div>
                            <div class="findid" onclick="location.href='logout.jsp'">로그아웃</div>
                            <div class="singup" onclick="location.href='quit.jsp'">회원탈퇴</div>
                        </div>
                    </form>
                </div>
                 
                <% 
                }
                }
                %>
            </div>
        </div>
        <div class="middle">
            <div class="wrapper">
            	<form action ="search" method="post">
                <div class="search_box">
                    <input type="text"class="search" name="searchWord">
                    <button type="submit" class="sb"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
                </form>
            </div>
        </div>
        <div class="submid">
            <div class="wrapper2">
                <div class="save">
                    <div class="list"><h2>많이 찾는 단어<a href="bestlist.jsp"><i class="fa-solid fa-plus"></i></a></h2></div>
                    <form method="post" action="addForm">
                    <div class="list_main">
                        <div class="list_top">
                            <div class="seq_t">순서</div><div class="word_t">단어</div><div class="mean_t">의미</div><div class="check_t"><button id="save" type="submit">저장</button></div>
                        </div>
                        <div class="index">
                        <% for(int i=0;i<10;i++){
                        	ArrayList<word> list = db.getbestWord();
                        	%>
                        
                            <div class="word_wrap"><div class="seq"><%= i +1 %></div><div class="word"><%= list.get(i).getWord() %></div><div class="mean"><%= list.get(i).getMean() %></div><div class="check"><input type="checkbox" name="save" value="<%= list.get(i).getSeq()%>"></div></div>
                           
                       <%} %>
                        </div>
                        <input type="hidden" name ="id" value="<%= _id%>"/>
                    </div>
                    </form>
                </div>
                <div class="move">
                    <div class="toeic" onclick="location.href='typeword.jsp?type=1'"></div>
                    <div class="suneung" onclick="location.href='typeword.jsp?type=2'"></div>
                    <div class="opic" onclick="location.href='typeword.jsp?type=3'"></div>
                    <div class="toeic_s" onclick="location.href='typeword.jsp?type=4'"></div>
                </div>
            </div>
        </div>
        <button id="goup"><i class="fa-solid fa-chevron-up"></i></button>
    </div>  
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="resource/js/swiper.js"></script>
    <script src="resource/js/func.js"></script>
    <script src="resource/js/chk.js"></script>
</body>
</html>