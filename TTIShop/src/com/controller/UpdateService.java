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


@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		memberDTO loginDTO = (memberDTO) session.getAttribute("info");
		

		String id = loginDTO.getId();
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");

		memberDTO info = new memberDTO(id, pw, name, address, phone);
		memberDAO dao = new memberDAO();
		int cnt = dao.update(info);

		if (cnt > 0) {
			
			System.out.println("정보수정성공");
			session.setAttribute("upsskey", info);
			response.sendRedirect("login.jsp");

		} else {
			System.out.println("정보수정실패");
			response.sendRedirect("update.jsp");
		}
		
	}

}
