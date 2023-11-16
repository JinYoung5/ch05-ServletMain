<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="kr.story.vo.StoryVO" />
<jsp:setProperty property="*" name="vo" />
<%
	StoryDAO dao = StoryDAO.getInstance();
	//사원번호 인증하기
	StoryVO db_vo = dao.getStory(vo.getNum());
	boolean check = false;
	if(db_vo != null){
		//사원번호 일치 여부 체크
		check = db_vo.isChecked(vo.getSnum());
	}
	if(check){ //인증 성공
		vo.setIp(request.getRemoteAddr());
		dao.updateStory(vo);
%>
	<script type="text/javascript">
		alert('글 수정을 완료 했습니다.');
		location.href='detail.jsp?num=<%=vo.getNum()%>';
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert('사원번호 불일치');
		history.go(-1);
	</script>
<%
	}
%>