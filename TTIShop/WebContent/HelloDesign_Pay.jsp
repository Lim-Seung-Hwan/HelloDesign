<%@page import="com.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	memberDTO info = (memberDTO)session.getAttribute("info");
	String name = request.getParameter("name");
	String addr = request.getParameter("area") + " " + request.getParameter("addr") + " " + request.getParameter("detail_addr");
	String phone = request.getParameter("phone");
	String product_no = request.getParameter("product_no");
	String product_count = request.getParameter("product_count");
	
%>


<form action="payService" method="post">
	<p>card_number : <input type="text" name="card_number" id="card_number" placeholder="하이픈 추가하여 작성">
	<p>card_password : <input type="text" name="card_password" id="card_password" placeholder="숫자 네자리">
	<input type="text" name="name" value="<%=name%>" style="display:none">
	<input type="text" name="addr" value="<%=addr%>" style="display:none">
	<input type="text" name="phone" value="<%=phone%>" style="display:none">
	<input type="text" name="product_no" value="<%=product_no%>" style="display:none">
	<input type="text" name="product_count" value="<%=product_count%>" style="display:none">
	
	

	<center><input type="submit" value="결제""/></center>
	
</form>


</body>
</html>