<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="DAO.db_con" %>
<%@ page import="DTO.user" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
String searchType = request.getParameter("type"); // 선택한 검색 유형 (userid, username, gender)
String searchTerm = request.getParameter("search"); // 검색어

// 검색 결과 조회
List<user> searchResults = null; // 검색 결과를 담을 변수
if (searchType != null && searchTerm != null && !searchTerm.isEmpty()) {
  // 검색 결과를 가져오는 로직 구현
  // 예를 들어, DAO 클래스를 사용하여 DB에서 검색 결과를 가져올 수 있습니다.
  // searchResults = DAO.searchUsers(searchType, searchTerm);
}

// 검색 결과를 admin.jsp로 전달하기 위해 request 속성에 저장
request.setAttribute("searchResults", searchResults);

// admin.jsp로 다시 포워드
request.getRequestDispatcher("admin.jsp").forward(request, response);
%>
</body>
</html>