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
		orderDTO ordto = (orderDTO) session.getAttribute("order");
		String imp_success = request.getParameter("imp_success");
		if(imp_success==null) imp_success = "true";
		int mnum = loginDTO.getNum();
		orderDAO odao = new orderDAO();
		orderDTO odto = null;
		cartDAO cdao = new cartDAO();
		cartDTO cdto = null;
		System.out.println("imp_success: " + imp_success);
		PrintWriter out = response.getWriter();
		if(ordto != null && imp_success.equals("true")) {
			String name = ordto.getO_name();
			String addr = ordto.getO_address();
			String phone = ordto.getO_phone();
			String[] product_no = ordto.getList_num().split(";");
			String[] product_count = ordto.getList_count().split(";");
			System.out.println("결제 성공");
			for (int i = 0; i < product_no.length; i++) {
				int pronum = Integer.parseInt(product_no[i]);
				int procount = Integer.parseInt(product_count[i]);
				odto = new orderDTO(addr, name, phone, pronum, "카드", mnum, procount);
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
			 out.println("<script>alert('♡ 결제성공 ♡'); location.replace(\"buy.jsp\"); self.close(); </script>"); 
			 session.removeAttribute("order");
			 out.flush();
				 
		} else {
			if(imp_success.equals("false")) out.println("<script>alert('결제에 실패하였습니다.'); location.replace(\"index.jsp\"); self.close(); </script>");
			else out.println("<script>alert('잘못된 요청입니다.'); location.replace(\"index.jsp\"); self.close(); </script>");
			out.flush();
		}
	} 
		
	

}
