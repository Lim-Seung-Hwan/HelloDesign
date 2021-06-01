<%@page import="com.cart.cartDTO"%>
<%@page import="com.cart.cartDAO"%>
<%@page import="com.member.memberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.goods.goodsDTO"%>
<%@page import="com.goods.goodsDAO"%>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ashion | Template</title>

<script type="text/javascript">
/* 공부 필요 */
	window.onload = function(){
		var tag = readCookie("tag");
		autocheck(tag);
		document.cookie = 'tag=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	}
	function autocheck(pos) {
		if(pos == 'spring') { 
			document.getElementById('spring').checked = true;
			
		}
		if(pos == 'summer') {
			document.getElementById('summer').checked = true;
		}
		if(pos == 'fall') {
			document.getElementById('fall').checked = true;
		}
		if(pos == 'winter') {
			document.getElementById('winter').checked = true;
		}
	}
	
  	function checkboxClick(tag) {
		document.getElementById('spring').checked = false;
		document.getElementById('summer').checked = false;
		document.getElementById('fall').checked = false;
		document.getElementById('winter').checked = false;
		autocheck(tag);
		document.cookie = encodeURIComponent("tag") + "=" + encodeURIComponent(tag);
		location.reload();
  	}
  	
  	function readCookie(name) {
  	    var nameEQ = name + "=";
  	    var ca = document.cookie.split(';');
  	    for(var i=0;i < ca.length;i++) {
  	        var c = ca[i];
  	        while (c.charAt(0)==' ') c = c.substring(1,c.length);
  	        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
  	    }
  	    return null;
  	}
	</script>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>

	<%
	memberDTO info = (memberDTO)session.getAttribute("info");

	cartDAO cartdao = new cartDAO();
	ArrayList<cartDTO> cart_list = null;
	if(info!=null) {
		cart_list = cartdao.select_cart(info.getNum());
	}

	/* arraylist형인 chair_list받아옴. 일단 null */
	ArrayList<goodsDTO> chair_list = null;
	/* 배열 형태 쿠키 생성 - 여러 정보 저장 할 거라서 -->공부 필요 */
	Cookie[] cookies = request.getCookies();
	String tag = null;
	if(cookies != null && cookies.length > 0)
	{
		for(int i = 0; i < cookies.length; i++)
		{
			if(cookies[i].getName().equals("tag")) {
				tag = URLDecoder.decode(cookies[i].getValue(), "utf-8");
			}
		}
	}
	
	/* tag를 선택 했는지 안했는지 */
	if (tag != null) {/* tag를 선택 했을 때 - 선택한 테그에 대한 모든 정보 가져옴*/
		goodsDAO chairdao = new goodsDAO();
		chair_list = chairdao.pattern_chair(tag);
	} else { /* tag를 선택 안 했을 때 - 모든 정보 가져옴 */
		goodsDAO chairdao = new goodsDAO();
		chair_list = chairdao.select_chair();
	}
%>
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__close">+</div>
		<ul class="offcanvas__widget">
			<li><a href="./shop-cart.jsp"><span class="icon_bag_alt"></span>
                 <%if(cart_list!=null) { %>
                      <div class="tip"><%=cart_list.size() %></div>
			     <%} else { %>
				      <div class="tip">0</div>
				 <%} %>
             </a></li>
		</ul>
		<div class="offcanvas__logo">
			<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__auth">
           <%if(info !=null) { %>
             <a href="./update.jsp">회원정보변경</a>
             <a href="./LogoutService">Logout</a>
             <%}else{%>
             <a href="./login.jsp">Login</a>
             <a href="./join.jsp">Join</a>
             <%} %> 
        </div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-3 col-lg-2">
					<div class="header__logo">
						<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-xl-6 col-lg-7">
					<nav class="header__menu">
						<ul>
							<li><a href="./index.jsp">HOME</a></li>
							<li><a href="./mat.jsp">MUG-CUP</a></li>
							<li><a href="./eco_bag.jsp">ECO-BAG</a></li>
							<li><a href="./apron.jsp">APRON</a></li>
							<li class="active"><a href="./chair.jsp">CHAIR</a></li>
							<!-- <li><a href="./product-details.html">주문제작</a></li> -->
							<li><a href="#">MYPAGE</a>
								<ul class="dropdown">
									<li><a href="./shop-cart.jsp">Shop Cart</a></li>
									<li><a href="./checkout.jsp">Checkout</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__right">
                        <div class="header__right__auth">
                        <%if(info !=null) { %>
                        	<a href="./update.jsp">회원정보변경</a>
                            <a href="./LogoutService">Logout</a>
                        	<%}else{%>
                            <a href="./login.jsp">Login</a>
             				<a href="./join.jsp">Join</a>
                            <%} %>
                        </div>
                        <ul class="header__right__widget">
                            <li><span class="icon_search search-switch"></span></li>
                            <li><a href="./shop-cart.jsp"><span class="icon_bag_alt"></span>
                 				<%if(cart_list!=null) { %>
                     				<div class="tip"><%=cart_list.size() %></div>
			    				 <%} else { %>
				      				<div class="tip">0</div>
				 				<%} %>
            				 </a></li>
                        </ul>
                        
                    </div>
				</div>
			</div>
			%>
</body>
</html>