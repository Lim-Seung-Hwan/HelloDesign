package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.memberDAO;
import com.member.memberDTO;



@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		memberDTO dto = new memberDTO(id, pw);
		memberDAO dao = new memberDAO();
		memberDTO loginDTO = dao.login(dto);

		if (loginDTO != null) {
			System.out.println("로그인성공");
			HttpSession session = request.getSession();
			session.setAttribute("info", loginDTO);
			response.sendRedirect("index.jsp");
			
		} else {
			System.out.println("로그인실패");
			response.sendRedirect("login.jsp");
		}


		
	}

}
