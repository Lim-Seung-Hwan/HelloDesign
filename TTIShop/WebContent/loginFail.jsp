<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
<body>
<%
int trying = 0;
String check = request.getParameter("trying");
if(check!=null) trying = Integer.parseInt(check);
%>
	<script type="text/javascript">
	window.onload = function(){
		let trying = '<%= trying%>'
			if (trying == 1) {
				alert("로그인 실패!");
			} else alert("로그인이 필요합니다.");
			location.href = "login.jsp";
	}
	</script>
</body>
</html>