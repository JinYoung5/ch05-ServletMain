<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");

	//전송된 데이터 반환
	int num = Integer.parseInt(request.getParameter("num"));
	String snum = request.getParameter("snum");
	
	StoryDAO dao = StoryDAO.getInstance();
	//사원번호 인증하기
	StoryVO db_vo = dao.getStory(num);
	boolean check = false;
	if(db_vo != null){
		//사원번호 체크여부
		check = db_vo.isCheckNumber(snum);
	}
	if(check){
		dao.delete(num);
%>
	<script>
		alert('글 삭제를 완료했습니다.');
		location.replace('list.jsp');
	</script>
<%
	}else{
		
%>
	<script>
		alert('사원번호 불일치');
		history.go(-1);
	</script>
<%
	}
%>
