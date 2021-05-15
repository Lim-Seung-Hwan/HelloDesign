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

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		

		memberDTO mdto = new memberDTO(id, pw, name, address, phone);
		memberDAO dao = new memberDAO();
		int cnt = dao.join(mdto);

		if (cnt > 0) {
			System.out.println("성공");
			HttpSession session = request.getSession();
			session.setAttribute("jsskey", id);
			response.sendRedirect("login.jsp");
		} else {
			System.out.println("실패");
			response.sendRedirect("join.jsp");
		}
		
	}

}
