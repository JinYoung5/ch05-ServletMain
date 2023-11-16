<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="kr.story.vo.StoryVO" />
<jsp:setProperty property="*" name="board" />
<%
	//클라이언트의 ip주소 저장
	vo.setIp(request.getRemoteAddr());
	StoryDAO dao = StoryDAO.getInstance();
	dao.insert(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 완료</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="page-main">
	<h1>글쓰기 완료</h1>
	<div class="align-center">
		사원이야기에 글을 등록했습니다.<br>
		<button onclick="location.href='list.jsp'">목록</button>
	</div>
</div>
</body>
</html>