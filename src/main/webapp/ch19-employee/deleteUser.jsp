<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	String user_id = (String)session.getAttribute("user_id");
	if(user_id==null){ //로그인이 되지 않은 경우
		response.sendRedirect("main.jsp");
	}else{ //로그인이 된 경우
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		//전송된 데이터 반환
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		//id, 비밀번호 일치 여부 체크
		EmployeeDAO dao = EmployeeDAO.getInstance();
		EmployeeVO vo = dao.checkEmployee(id);
		boolean check = false;
		
		if(vo != null && user_id.equals(id)){
			check = vo.isCheckedPassword(passwd);
		}
		if(check){
			//회원 정보 삭제
			dao.deleteEmployee(vo.getSnum());
			//로그아웃
			session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원탈퇴 완료</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="page-main">
	<h1>사원탈퇴 완료</h1>
	<div class="resul-display">
		<div class="align-center">
			사원탈퇴가 완료 되었습니다.<br>
			<button onclick="location.href='main.jsp'">홈으로</button>
		</div>
	</div>
</div>
</body>
</html>
<%
		}else{
%>
	<script>
	alert('아이디 또는 비밀번호가 불일치합니다.');
	history.go(-1);
	</script>
<%
		}
	}
%>