<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%@ page import="kr.util.PagingUtil" %>
<%@ page import="java.util.List" %>
<%
	//선택한 페이지 번호(get 방식)
	String pageNum = request.getParameter("pageNum");

	//pageNum이 전송되지 않으면 1페이지로 처리
	if(pageNum==null){
		pageNum = "1";
	}
	
	//한 화면에 몇 개의 글(행,레코드)를 보여줄지 지정
	int rowCount = 1;
	//한 화면에 몇 개의 페이지 수를 보여줄지 지정
	int pageCount = 10;
	//현재 선택한 페이지(String -> int)
	int currentPage = Integer.parseInt(pageNum);
	
	StoryDAO dao = StoryDAO.getInstance();
	//총 레코드 수
	int count = dao.getCount();
	
	//페이지 처리
	PagingUtil util = new PagingUtil(currentPage,count,rowCount,pageCount,"list.jsp");
	
	List<StoryVO> list = null;
	if(count>0){
		list = dao.getList(util.getStartRow(), util.getEndRow());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="page-main">
	<h1>사원이야기</h1>
	<div class="align-right">
		<input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'">
	</div>
<%
	if(count == 0){
%>
	<div class="result-display">저장된 글이 없습니다.</div>
<%
	}else{
%>
	<!-- 목록 출력 시작 -->
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>사원번호</th>
			<th>작성일</th>
		</tr>
<%
	for(StoryVO vo : list){		
%>
		<tr>
			<td><%= vo.getNum() %></td>
			<td><a href="detail.jsp?num=<%= vo.getNum() %>"><%= vo.getTitle() %></a></td>
			<td><%= vo.getSnum() %></td>
			<td><%= vo.getReg_date() %></td>
		</tr>
<%
	}
%>
	</table>
	<!-- 목록 출력 끝 -->
	<!-- 페이지 표시 시작 -->
	<div class="align-center">
		<%= util.getPage() %>
	</div>
	<!-- 페이지 표시 끝 -->
		
<%
	}
%>
</div>
</body>
</html>