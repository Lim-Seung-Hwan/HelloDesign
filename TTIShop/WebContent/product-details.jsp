<%@page import="com.member.memberDTO"%>
<%@page import="java.net.URLDecoder"%>
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

	<script type="text/javascript">
	</script>
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
	memberDTO info = (memberDTO)session.getAttribute("info");

	/* arraylist형인 apron_list받아옴. 일단 null */
	ArrayList<goodsDTO> mat_list = null;
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
		goodsDAO matdao = new goodsDAO();
		mat_list = matdao.pattern_mat(tag);
	} else { /* tag를 선택 안 했을 때 - 모든 정보 가져옴 */
		goodsDAO matdao = new goodsDAO();
		mat_list = matdao.select_mat();
	}
%>
<!-- Page Preloder -->
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
            <a href="./index.html"><img src="img/logo.jpg" alt=""></a>
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
                        <a href="./index.html"><img src="img/logo.jpg" alt=""></a>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="./index.jsp">HOME</a></li>
                            <li><a href="./mat.jsp">MAT</a></li>
                            <li><a href="./eco_bag.jsp">ECO-BAG</a></li>
                            <li class="active"><a href="./apron.jsp">APRON</a></li>
                            <li><a href="./chair.jsp">CHAIR</a></li>
                            <li><a href="./product-details.html">주문제작</a></li>
                            <li><a href="#">MYPAGE</a>
                            <ul class="dropdown">
                                    <li><a href="./shop-cart.html">Shop Cart</a></li>
                                    <li><a href="./checkout.jsp">Checkout</a></li>
                            </ul>
                            </li>
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
            <div class="row"> <!-- 나중에 고쳐. 카테고리 분류로 입력받아서 -->
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">shop</a>
                        <span>Essential structured blazer</span> <!-- 상품명 -->
                    </div>
                    
                    <!-- <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="#">Women’s </a>
                        <span>Essential structured blazer</span>
                    </div> -->
                    
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product__details__pic">
                        
                        <div class="product__details__slider__content">
                            <div class="product__details__pic__slider owl-carousel">
                                <img data-hash="product-1" class="product__big__img" src="#" alt="">
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product__details__text">
                    	<h3>Essential structured blazer </h3>
                    	
                        <!-- <h3>Essential structured blazer <span>Brand: SKMEIMore Men Watches from SKMEI</span></h3> -->
                       <!--  <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <span>( 138 reviews )</span>
                        </div> -->
                        <div class="product__details__price">75.000원 </div> <!-- 계속 빨간색임!! -->
                        <p>Nemo enim ipsam voluptatem quia aspernatur aut odit aut loret fugit, sed quia consequuntur
                        magni lores eos qui ratione voluptatem sequi nesciunt.</p>
                        <div class="product__details__button">
                            <div class="quantity">
                                <span>Quantity:</span>
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                            <a href="#" class="cart-btn"><span class="icon_bag_alt"></span> Add to cart</a>
                            <!-- <ul>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_adjust-horiz"></span></a></li>
                            </ul> -->
                        </div>
                        <!-- <div class="product__details__widget">
                            <ul>
                                <li>
                                    <span>Availability:</span>
                                    <div class="stock__checkbox">
                                        <label for="stockin">
                                            In Stock
                                            <input type="checkbox" id="stockin">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>Available color:</span>
                                    <div class="color__checkbox">
                                        <label for="red">
                                            <input type="radio" name="color__radio" id="red" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label for="black">
                                            <input type="radio" name="color__radio" id="black">
                                            <span class="checkmark black-bg"></span>
                                        </label>
                                        <label for="grey">
                                            <input type="radio" name="color__radio" id="grey">
                                            <span class="checkmark grey-bg"></span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>Available size:</span>
                                    <div class="size__btn">
                                        <label for="xs-btn" class="active">
                                            <input type="radio" id="xs-btn">
                                            xs
                                        </label>
                                        <label for="s-btn">
                                            <input type="radio" id="s-btn">
                                            s
                                        </label>
                                        <label for="m-btn">
                                            <input type="radio" id="m-btn">
                                            m
                                        </label>
                                        <label for="l-btn">
                                            <input type="radio" id="l-btn">
                                            l
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>Promotions:</span>
                                    <p>Free shipping</p>
                                </li>
                            </ul>
                        </div> -->
                    </div>
                </div>
               
            </div>
            
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Footer Section Begin -->
	<footer class="footer" style="padding-bottom: 50px;">
    
    <div class="row"></div>
    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                <div class="footer__copyright__text">
                    <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                </div>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	
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