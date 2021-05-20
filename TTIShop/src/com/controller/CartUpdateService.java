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
import com.member.memberDAO;
import com.member.memberDTO;

/**
 * Servlet implementation class CartAddService
 */
@WebServlet("/CartUpdateService")
public class CartUpdateService extends HttpServlet {
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
		int count = Integer.parseInt(request.getParameter("count"));
		System.out.println("mnum=" + mnum + "gnum=" + gnum + "count=" + count);
		cartDTO cdto = new cartDTO(mnum, gnum, count);
		
		

		cartDAO cdao = new cartDAO();
		int cnt = cdao.update(cdto);

		if (cnt > 0) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		response.sendRedirect("shop-cart.jsp");
	}

}
