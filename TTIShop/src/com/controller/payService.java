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


@WebServlet("/payService")
public class payService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		memberDTO loginDTO = (memberDTO) session.getAttribute("info");
		int mnum = loginDTO.getNum();
		String card_number=request.getParameter("card_number");
		String card_password=request.getParameter("card_password");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String[] product_no = request.getParameter("product_no").split(";");
		String[] product_count = request.getParameter("product_count").split(";");
		orderDAO odao = new orderDAO();
		orderDTO odto = null;
		cartDAO cdao = new cartDAO();
		cartDTO cdto = null;
		PrintWriter out = response.getWriter();
		
		if ("1111-2222-3333-4444".equals(card_number)&&"1234".equals(card_password)) {
			System.out.println("결제 성공");
			
			for (int i = 0; i < product_no.length; i++) {
				int pronum = Integer.parseInt(product_no[i]);
				int procount = Integer.parseInt(product_count[i]);
				odto = new orderDTO(addr, name, phone, pronum, "HD카드", mnum, procount);
				int cnt = odao.insert(odto);
				if(cnt > 0) {
					System.out.println("추가됨");
					cdto = new cartDTO(mnum, pronum);
					cdao.delete(cdto);
				}
				else {
					System.out.println("실패!");
				}
			}
			 out.println("<script>alert('♡ 결제성공 ♡'); opener.location.replace(\"index.jsp\"); self.close(); </script>"); 
			 out.flush();
			 
		} else {
			System.out.println("결제 실패");
		
			out.println("<script>alert('결제 실패'); opener.location.replace(\"checkout.jsp\"); self.close(); </script>"); 
			out.flush();
			 
		}
		
		
	}

}
