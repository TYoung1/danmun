<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <div class="container">
                <div class="left">
                    <button class="delete">Delete</button>
               
                    <form action="">
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
                    
                                <tr>
                                    <td>1</td>
                                    <td>ad</td>
                                    <td>관리자</td>
                                    <td><input type="checkbox" name="del" value=""/></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>ad</td>
                                    <td>관리자</td>
                                    <td><input type="checkbox" name="del" value=""/></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>ad</td>
                                    <td>관리자</td>
                                    <td><input type="checkbox" name="del" value=""/></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>ad</td>
                                    <td>관리자</td>
                                    <td><input type="checkbox" name="del" value=""/></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>ad</td>
                                    <td>관리자</td>
                                    <td><input type="checkbox" name="del" value=""/></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>ad</td>
                                    <td>관리자</td>
                                    <td><input type="checkbox" name="del" value=""/></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>ad</td>
                                    <td>관리자</td>
                                    <td><input type="checkbox" name="del" value=""/></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>ad</td>
                                    <td>관리자</td>
                                    <td><input type="checkbox" name="del" value=""/></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>ad</td>
                                    <td>관리자</td>
                                    <td><input type="checkbox" name="del" value=""/></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>ad</td>
                                    <td>관리자</td>
                                    <td><input type="checkbox" name="del" value=""/></td>
                                </tr>
                        
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="right">
                    <div class="r_top">
                        <h2><span>ooo</span>님 환영합니다</h2>
                        <div class="info">
                            <p>My Word 에 저장된 단어 : <span>o개</span></p>
                            <p>Level : <span>0</span></p>
                        </div>
                        <div class="else">
                            <a href="#">로그아웃</a>
                            <a href="#">회원탈퇴</a>
                        </div>
                    </div>
                    <div class="r_bottom">
                        <form>
                            <input type="text" placeholder="단어를 입력해주세요"><br>
                            <input type="text" placeholder="의미를 입력해주세요"><br>
                            <button type="submit">추가</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>