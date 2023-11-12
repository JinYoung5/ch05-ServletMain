<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 처리</title>
</head>
<body>
<%
   //파일 업로드 경로
   String saveFolder = "/upload"; 
   String encType = "utf-8"; //인코딩 타입
   int maxSize = 5*1024*1024;//파일의 최대 업로드 사이즈(5M)
   
   //파일 업로드 절대 경로 구하기
   String realFolder = application.getRealPath(saveFolder); //application.getRealPath로 해당 context에 있는 경로 넣어줌
   out.println("파일 업로드 절대 경로 : " + realFolder + "<br>");
   out.println("------------------------------------<br>");
   
   //파일 업로드 할 때에는 request.getParameter가 동작을 안함 (이름 같은거 빼낼 때 multi.getParameter 써야함)
   //그래서 통째로 request를 넘기고  MultipartRequest를 사용해야함
   
   //파일 업로드 처리 및 정보 읽기
   MultipartRequest multi = new MultipartRequest(request,
                                    realFolder, //upload 절대경로
                                    maxSize, //파일 최대 업로드 사이즈
                                    encType, //인코딩 타입
                           new DefaultFileRenamePolicy()); //이미 업로드된 파일과 동일한 파일명일 경우 파일명 교체
   
   out.println("작성자 : " + multi.getParameter("user") + "<br>");
   out.println("제목 : " + multi.getParameter("title") + "<br>");
   out.println("------------------------------------<br>");
   
   //파일 정보 읽어오기
   //전송전 원래의 파일 이름 
   String original = multi.getOriginalFileName("uploadFile"); 
   //서버에 저장된 파일 이름
   String filename = multi.getFilesystemName("uploadFile");
   out.println("전송전 원래의 파일 이름 : " + original + "<br>");
   out.println("서버에 저장된 파일 이름 : " + filename + "<br>");
   
   String type = multi.getContentType("uploadFile");
   out.println("컨텐트 타입 : " + type + "<br>");
   
   //파일의 용량 구하기
   File file = multi.getFile("uploadFile");
   out.println("파일 용량 : " + file.length() + "bytes");
   
%>
</body>
</html>