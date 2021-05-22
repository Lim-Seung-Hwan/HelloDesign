package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/payService")
public class payService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String card_number=request.getParameter("card_number");
		String card_password=request.getParameter("card_password");
		PrintWriter out = response.getWriter();
		
		if ("1111-2222-3333-4444".equals(card_number)&&"1234".equals(card_password)) {
			System.out.println("결제 성공");
			
			 out.println("<script>alert('♡ 결제성공 ♡'); opener.location.replace(\"index.jsp\"); self.close(); </script>"); 
			 out.flush();
			 
		} else {
			System.out.println("결제 실패");
		
			out.println("<script>alert('결제 실패'); opener.location.replace(\"checkout.jsp\"); self.close(); </script>"); 
			out.flush();
			 
		}
		
		
	}

}
