package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.cartDAO;
import com.cart.cartDTO;
import com.member.memberDTO;
import com.order.orderDAO;
import com.order.orderDTO;

/**
 * Servlet implementation class CartAddService
 */
@WebServlet("/CartUpdateGroupService")
public class CartUpdateGroupService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		memberDTO loginDTO = (memberDTO) session.getAttribute("info");
		int mnum = loginDTO.getNum();
		String[] product_no = request.getParameter("product_no").split(";");
		String[] product_count = request.getParameter("product_countAll").split(";");
		cartDAO cdao = new cartDAO();
		cartDTO cdto = null;
		for(int i = 0; i<product_no.length; i++) {
			int pno = Integer.parseInt(product_no[i]);
			int pcount = Integer.parseInt(product_count[i]);
			cdto = new cartDTO(mnum, pno, pcount);
			
			int cnt = cdao.update(cdto);			
			
			if (cnt > 0) {
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
		}
		response.sendRedirect("shop-cart.jsp");
	}

}
