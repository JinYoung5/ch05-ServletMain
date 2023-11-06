<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습]회원가입</title>
</head>
<body>
<%--
[실습]회원가입 폼
input type = "text" - 이름(name),ID(id),전화번호(phone)
input type = "password" - 비밀번호(password)
input type = "checkbox" - 취미(hobby - 영화보기,음악감상,등산,낚시,춤)
textarea - 자기소개
[출력 예시]
이름	: 홍길동
ID	: dragon
비밀번호 : 1234
전화번호 : 010-1234-5678
취미 : 영화보기, 춤
자기소개 : 서울에서 태어나서 서울에서 거주
--%>
<form action="s06_register.jsp" method="post">
	<ul>
		<li>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" size="10">
		</li>
		<li>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" size="30">
		</li>
		<li>
			<label for="password">비밀번호</label>
			<input type="password" name="password" id="password" size="30">
		</li>
		<li>
			<label for="phone">전화번호</label>
			<input type="text" name="phone" id="phone" size="30">
		</li>
		<li>
			<label>취미</label><br>
			<input type="checkbox" name="hobby" value="영화보기">영화보기
			<input type="checkbox" name="hobby" value="음악강상">음악감상
			<input type="checkbox" name="hobby" value="등산">등산
			<input type="checkbox" name="hobby" value="낚시">낚시
			<input type="checkbox" name="hobby" value="춤">춤<br><br>
		</li>
		<li>
			<label for="content">자기소개</label><br>
			<textarea rows="5" cols="60" name="content" id="content"></textarea>
		</li>
	</ul>
	<input type="submit" value="회원가입">
	<!-- 
	이름 <input type="text" name="name" size="10"><br>
	ID <input type="text" name="ID" size="10"><br>
	비밀번호 <input type="password" name="Password" size="13"><br>
	전화번호 <input type="text" name="Phone" size="13"><br>
	취미
	<input type="checkbox" name="hobby" value="영화보기">영화보기
	<input type="checkbox" name="hobby" value="음악감상">음악감상
	<input type="checkbox" name="hobby" value="등산">등산
	<input type="checkbox" name="hobby" value="낚시">낚시
	<input type="checkbox" name="hobby" value="춤">춤
	<br>
	자기소개<br>
	<textarea name="intro" id="" cols="30" rows="10"></textarea>
	<input type="submit" value="회원가입"> 
	-->
</form>
</body>
</html>