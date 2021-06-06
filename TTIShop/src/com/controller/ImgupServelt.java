package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/ImgupServelt")
public class ImgupServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("euc-kr");
		 String realFolder = "";
		 String filename1 = "";
		 int maxSize = 1024*1024*5;
		 String encType = "euc-kr";
		 String savefile = "img";
		 ServletContext scontext = getServletContext();
		 realFolder = scontext.getRealPath(savefile);
		 HttpSession session = request.getSession();
		 try{
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		  Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename1 = multi.getFilesystemName(file1);
		 } catch(Exception e) {
		  e.printStackTrace();
		 }
		 
		 	String fullpath = realFolder + "\\" + filename1;
		 	
		 	if(session.getAttribute("fullpath")!=null){
		 		session.removeAttribute("fullpath");
		 	}
		 	
			session.setAttribute("fullpath", fullpath);
		System.out.println("실행");
		
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(fullpath);
	}

}
