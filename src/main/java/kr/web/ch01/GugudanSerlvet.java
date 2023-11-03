package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class GugudanSerlvet extends HttpServlet{
	public void doGet(HttpServletRequest request, 
					HttpServletResponse response) throws ServletException, IOException{
		//문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=uft-8");
		
		//전송된 데이터를 반환
		int dan = Integer.parseInt(request.getParameter("dan")); //반환 타입 String->Integer.parseInt 사용
		
		//HTML 출력을 위한 출력 스트림을 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>구구단</title></head>");
		out.println(dan + "단<br>");
		out.println("-----------------<br>");
		
		for(int i=1; i<=9; i++) {
			out.println(dan + "*" + i + "=" + dan*i + "<br>");
		}
		out.println("</body>");
		out.println("</html>");
	}
	
}
