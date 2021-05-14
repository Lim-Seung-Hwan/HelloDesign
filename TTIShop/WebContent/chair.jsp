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
	window.onload = function(){
		var tag = readCookie("tag");
		autocheck(tag);
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
	/* session.setAttribute("info","");
	goodsDTO info = (goodsDTO)session.getAttribute("info"); */
	
	
%>
<%
	ArrayList<goodsDTO> chair_list = null;
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
	
	if (tag != null) {
		goodsDAO chairdao = new goodsDAO();
		chair_list = chairdao.pattern_chair(tag);
	} else {
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
			<li><span class="icon_search search-switch"></span></li>
			<li><a href="#"><span class="icon_heart_alt"></span>
					<div class="tip">2</div> </a></li>
			<li><a href="#"><span class="icon_bag_alt"></span>
					<div class="tip">2</div> </a></li>
		</ul>
		<div class="offcanvas__logo">
			<a href="./index.html"><img src="img/logo.png" alt=""></a>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__auth">
			<a href="./Login.html">Login</a> <a href="./Register.html">Join</a>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-3 col-lg-2">
					<div class="header__logo">
						<a href="./index.html"><img src="img/logo.jpg" alt=""></a>
					</div>
				</div>
				<div class="col-xl-6 col-lg-7">
					<nav class="header__menu">
						<ul>
							<li><a href="./index.html">HOME</a></li>
							<li><a href="./mat.html">MAT</a></li>
							<li><a href="./eco_bag.html">ECO-BAG</a></li>
							<li><a href="./apron.html">APRON</a></li>
							<li class="active"><a href="./chair.html">CHAIR</a></li>
							<li><a href="./product-details.html">주문제작</a></li>
							<li><a href="#">MYPAGE</a>
								<ul class="dropdown">
									<li><a href="./shop-cart.html">Shop Cart</a></li>
									<li><a href="./checkout.html">Checkout</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__right">
						<div class="header__right__auth">
							<a href="./Login.html">Login</a> <a href="./Register.html">Join</a>
						</div>
						<ul class="header__right__widget">
							<li><span class="icon_search search-switch"></span></li>
							<li><a href="#"><span class="icon_heart_alt"></span>
									<div class="tip">999+</div> </a></li>
							<li><a href="#"><span class="icon_bag_alt"></span>
									<div class="tip">6</div> </a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a> <span>의자</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Section Begin -->
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="shop__sidebar">
						<div class="sidebar__color">
							<div class="section-title">
								<h4>pattern</h4>
							</div>
							<div class="size__list color__list">
								<label for="spring" onClick="checkboxClick('spring')"> spring <input type="checkbox"
									id="spring"> <span class="checkmark"></span>
								</label> <label for="summer" onClick="checkboxClick('summer')"> summer <input type="checkbox"
									id="summer"> <span class="checkmark"></span>
								</label> <label for="fall" onClick="checkboxClick('fall')"> fall <input type="checkbox"
									id="fall"> <span class="checkmark"></span>
								</label> <label for="winter" onClick="checkboxClick('winter')"> winter <input type="checkbox"
									id="winter"> <span class="checkmark"></span>
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-9">
					<div class="row">
						<%for (int i=0; i<chair_list.size(); i++){%>
						<div class="col-lg-4 col-md-6">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="<%=chair_list.get(i).getImg_path() %>"
									onClick="location.href='./product-details.html'">
									<!--  <div class="label new">New</div> -->
									<%-- <ul class="product__hover">
	                                        <li><a href="<%=mat_list.get(i).getImg_path() %>" class="image-popup"><span class="arrow_expand"></span></a></li>
	                                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
	                                        <li><a href="#"><span class="icon_bag_alt"></span></a></li>
	                                    </ul> --%>
								</div>
								<div class="product__item__text">
									<h6>
										<a href="./product-details.html"><%= chair_list.get(i).getName() %></a>
									</h6>
									<div class="product__price"><%= chair_list.get(i).getPrice() %></div>
								</div>
							</div>
						</div>
						<%}%>

						<div class="col-lg-12 text-center">
							<div class="pagination__option">
								<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a
									href="#"><i class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Section End -->

	<!-- Footer Section Begin -->
	
	<!-- Footer Section End -->


	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>