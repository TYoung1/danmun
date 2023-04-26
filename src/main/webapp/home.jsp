<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DAO.db_con"%>
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
    <nav>
        <a href="#" class="logo"><h3>단먼</h3></a>
        <ul>
            <li><a href="#">수능단어</a></li>
            <li><a href="#">토익단어</a></li>
            <li><a href="#">토스단어</a></li>
            <li><a href="#">오픽단어</a></li>
            <li><a href="#">단어테스트</a></li>
            <li><a href="#">오픽단어</a></li>
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
               		word day = db.oneword();
                %>
                <div class="card">
                    <h1>Word of the day</h1>
                    <div class="t_word">
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
                <div class="login">
                    <form method="post" action="login">
                        <h1>Sign in</h1>
                        <label>ID</label><br>
                        <input type="text" class="id" name="user_id"><br>
                        <label>PW</label><br>
                        <input type="text" class="password" name="user_pw"><br>
                        <button type="submit" class="log">Login</button>
                        <div class="another">
                            <div class="findid" onclick="location.href='findid.html'">Find ID</div>
                            <div class="findpw" onclick="location.href='findpw.html'">Find PW</div>
                            <div class="singup" onclick="location.href='signup.html'">Sign up</div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="middle">
            <div class="wrapper">
                <div class="search_box">
                    <input type="text"class="search">
                    <button type="submit" class="sb"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
            </div>
        </div>
        <div class="submid">
            <div class="wrapper2">
                <div class="save">
                    <div class="list"><h2>많이 찾는 단어<a href="#"><i class="fa-solid fa-plus"></i></a></h2></div>
                    <form action="">
                    <div class="list_main">
                        <div class="list_top">
                            <div class="seq_t">순서</div><div class="word_t">단어</div><div class="mean_t">의미</div><div class="check_t"><button id="save">저장</button></div>
                        </div>
                        <div class="index">
                        <% for(int i=0;i<10;i++){
                        	ArrayList<word> list = db.getbestWord();
                        	%>
                        
                            <div class="word_wrap"><div class="seq"><%= i +1 %></div><div class="word"><%= list.get(i).getWord() %></div><div class="mean"><%= list.get(i).getMean() %></div><div class="check"><input type="checkbox" name="save" value="<%= list.get(i).getSeq()%>"></div></div>
                           
                       <%} %>
                        </div>
                    </div>
                    </form>
                </div>
                <div class="move">
                    <div class="toeic" onclick="location.href='toeic.html'"></div>
                    <div class="toeic_s" onclick="location.href='tos.html'"></div>
                    <div class="opic" onclick="location.href='opic.html'"></div>
                    <div class="suneung" onclick="location.href='suneung.html'"></div>
                </div>
            </div>
        </div>
        <button id="goup"><i class="fa-solid fa-chevron-up"></i></button>
    </div>  
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="resource/js/swiper.js"></script>
    <script src="resource/js/func.js"></script>
</body>
</html>