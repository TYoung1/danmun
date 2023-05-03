<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="resource/css/signup.css">
</head>
<%
Object chk_ = session.getAttribute("chk");
String chk_value = (String) chk_;
%>
<%
if (chk_value != null) {
   session.removeAttribute("chk");
%>
<script>
   alert("아이디가 중복됩니다.");
</script>
<%
}
%>
<script src="resource/js/input_info.js"></script>

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
	<div class="main">
		<div class="wrap">
			<div class="sign_box">
				<div class="title">
					<h1>회원가입</h1>
				</div>
				<div class="content">
					<form action="signup" method="post"  onsubmit="return chkall()"
						>
						<label>아이디</labe> <input type="text" name="user_id" id="idval"
							>
							<div id="id_inner" class="warn"></div> <label>비밀번호</label> <input
							type="password" name="user_pw" id="pwval" >
							<div id="pw_inner" class="warn"></div> <label>비밀번호 확인</label> <input
							type="password" name="Chk_pw" id="chkpwval">
							<div id="chk_inner" class="warn"></div> <label>이름</label> <input
							type="text" name="user_name" id="nameval" >
							<div id="name_inner" class="warn"></div> <label>나이</label><br>
							<input type="text" placeholder="나이입력"
							name="user_age" id="ageval" 
							maxlength="2">
							<div id="age_inner" class="warn"></div> <label>성별</label> <select
							name="user_gender" id="genval" onblur=>
								<option selected disabled value="0">성별선택</option>
								<option value="male">남</option>
								<option value="female">여</option>
						</select>
							<div id="gen_inner" class="warn"></div>
							<button type="submit" id="btn_">가입하기</button>
					</form>

				</div>
			</div>
		</div>
	</div>
	<script src="resource/js/chk.js"></script>
</body>

</html>