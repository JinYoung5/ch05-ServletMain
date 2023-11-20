<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:redirect url="s01_set.jsp" >
	<%--		파라미터네임		값 --%>
	<c:param name="id" value="dragon"/>
	<c:param name="name" value="petter"/> <%-- 주소창에 표시됨. get방식으로 보냄 --%>
</c:redirect>