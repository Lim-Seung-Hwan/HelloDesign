<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
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
	goodsDAO matdao = new goodsDAO();
	ArrayList<goodsDTO> mat_list = matdao.select_mat();
	if(mat_list != null) {
		System.out.println(mat_list.get(0).getName());
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
                <div class="tip">2</div>
            </a></li>
            <li><a href="#"><span class="icon_bag_alt"></span>
                <div class="tip">2</div>
            </a></li>
        </ul>
        <div class="offcanvas__logo">
            <a href="./index.html"><img src="img/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__auth">
            <a href="./Login.html">로그인</a>
            <a href="./Register.html">회원가입</a>
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
                            <li class="active"><a href="./index.html">홈</a></li>
                            <li><a href="./mat.html">돗자리</a></li>
                            <li><a href="./eco_bag.html">에코백</a></li>
                            <li><a href="./apron.html">앞치마</a></li>
                            <li><a href="./chair.html">의자</a></li>
                            <li><a href="./product-details.html">주문제작</a></li>
                            <li><a href="#">마이페이지</a>
                            <ul class="dropdown">
                                    <li><a href="./shop-cart.html">Shop Cart</a></li>
                                    <li><a href="./checkout.html">Checkout</a></li>
                            </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__right">
                        <div class="header__right__auth">
                            <a href="./Login.html">로그인</a>
                            <a href="./Register.html">회원가입</a>
                        </div>
                        <ul class="header__right__widget">
                            <li><span class="icon_search search-switch"></span></li>
                            <li><a href="#"><span class="icon_heart_alt"></span>
                                <div class="tip">999+</div>
                            </a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span>
                                <div class="tip">6</div>
                            </a></li>
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
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>돗자리</span>
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
                                <label for="spring">
                                    spring
                                    <input type="checkbox" id="spring">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="summer">
                                  	 summer
                                    <input type="checkbox" id="summer">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="fall">
                                     fall
                                    <input type="checkbox" id="fall">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="winter">
                                     winter
                                    <input type="checkbox" id="winter">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="row">
                    	<%for (int i=0; i<mat_list.size(); i++){%>
	                        <div class="col-lg-4 col-md-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" data-setbg="<%=mat_list.get(i).getImg_path() %>" onClick="location.href='./product-details.html'">
	                                   <!--  <div class="label new">New</div> -->
	                                    <%-- <ul class="product__hover">
	                                        <li><a href="<%=mat_list.get(i).getImg_path() %>" class="image-popup"><span class="arrow_expand"></span></a></li>
	                                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
	                                        <li><a href="#"><span class="icon_bag_alt"></span></a></li>
	                                    </ul> --%>
	                                </div>
	                                <div class="product__item__text">
	                                    <h6><a href="./product-details.html"><%= mat_list.get(i).getName() %></a></h6>
	                                    <div class="product__price"><%= mat_list.get(i).getPrice() %></div>
	                                </div>
	                            </div>
	                        </div>
                        <%}%>
                        <div class="col-lg-12 text-center">
                            <div class="pagination__option">
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->

    <!-- Footer Section Begin -->
	<footer class="footer" style="padding-bottom: 50px;">
    
    <div class="row"></div>
	
	</footer>
   
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