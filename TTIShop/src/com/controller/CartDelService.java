package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.cartDAO;
import com.cart.cartDTO;
import com.member.memberDTO;

/**
 * Servlet implementation class CartAddService
 */
@WebServlet("/CartDelService")
public class CartDelService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		memberDTO loginDTO = (memberDTO) session.getAttribute("info");
		int mnum = loginDTO.getNum();
		int gnum = Integer.parseInt(request.getParameter("gnum"));
		System.out.println("mnum=" + mnum + "gnum=" + gnum);
		cartDTO cdto = new cartDTO(mnum, gnum);
		
		

		cartDAO cdao = new cartDAO();
		int cnt = cdao.delete(cdto);

		if (cnt > 0) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		response.sendRedirect("shop-cart.jsp");
	}

}
