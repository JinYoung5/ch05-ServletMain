<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="dbInfo.jspf" %>
<%-- contentType이 text/plain 이면 HTML문 지움 --%>

<%
	//전송된 데이터 인코딩 처리 (1)
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환 (2)
	String todo = request.getParameter("todo");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		//JDBC 수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC 수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		//SQL문 작성
		sql = "INSERT INTO todo (id,todo,created,completed) VALUES(todo_seq.nextval,?,SYSDATE,0)"; //컬럼명 명시
		//JDBC 수행 3단계 : PreparedStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//?에 데이터 바인딩
		pstmt.setString(1, todo);
		//JDBD 수행 4단계 : SQL문 실행
		pstmt.executeUpdate();
%>
		{"result":"success"} <%-- jSON문자열 --%>
<%
	}catch(Exception e){
%>
		{"result":"failure"}
<%
		e.printStackTrace();
	}finally{
		//자원정리 (3)
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
	
%>