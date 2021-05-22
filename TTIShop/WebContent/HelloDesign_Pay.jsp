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

	if(info!=null){
			 String card_num="1111-2222-3333-4444";
			 String card_password="1234";
	}
	
%>


<form action="payService" method="post">
	<p>card_number : <input type="text" name="card_number" id="card_number" placeholder="하이픈 추가하여 작성">
	<p>card_password : <input type="text" name="card_password" id="card_password" placeholder="숫자 네자리">
	

	<center><input type="submit" value="결제""/></center>
	
</form>


</body>
</html>