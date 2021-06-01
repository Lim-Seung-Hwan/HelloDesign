<%@page import="com.order.orderDAO"%>
<%@page import="com.order.orderDTO"%>
<%@page import="com.cart.cartDTO"%>
<%@page import="com.cart.cartDAO"%>
<%@page import="com.member.memberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.goods.goodsDTO"%>
<%@page import="com.goods.goodsDAO"%>
<%

orderDAO orderdao = new orderDAO();
orderDTO dto=null;
ArrayList<orderDTO> order_list = null; 

memberDTO info = (memberDTO)session.getAttribute("info");
if(info!=null) {
	order_list = orderdao.select_order(info.getNum());
}else{
	response.sendRedirect("loginFail.jsp?try_login=0");
}

cartDAO cartdao = new cartDAO();
ArrayList<cartDTO> cart_list = null;
if(info!=null) {
	cart_list = cartdao.select_cart(info.getNum());
}
%>
<!DOCTYPE html>
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
    <script type="text/javascript">
    </script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__close">+</div>
        <ul class="offcanvas__widget">
            <li><a href="./shop-cart.jsp"><span class="icon_bag_alt"></span>
                <%if(cart_list!=null) { %><div class="tip"><%=cart_list.size() %></div>
                <%} else { %><div class="tip">0</div>
                 <%} %>
            </a></li>
        </ul>
        <div class="offcanvas__logo">
            <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__auth">
           <%if(info !=null) { %>
             <a href="./mypage.jsp">My Page</a>
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
                        <a href="./index.jsp"><img src="img/logo.png" style="height:45px"  alt=""></a>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="./mug.jsp">MUG-CUP</a></li>
                            <li><a href="./eco_bag.jsp">ECO-BAG</a></li>
                            <li><a href="./apron.jsp">APRON</a></li>
                            <li><a href="./chair.jsp">CHAIR</a></li>
                           <!--  <li><a href="#">주문제작</a></li>  -->
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <div class="header__right__auth">
                        <%if(info !=null) { %>
	                        <ul class="header__right__widget">
	                            <li><a href="./shop-cart.jsp"><span class="icon_bag_alt"></span>
	                                <%if(cart_list!=null) { %>
	                                	<div class="tip"><%=cart_list.size() %></div>
					                <%} else { %>
					                	<div class="tip">0</div>
					                 <%} %>
	                            </a></li>
	                        </ul>
                        	<a href="./mypage.jsp">MY PAGE</a>
                            <a href="./LogoutService">LOGOUT</a>
                        	<%}else{%>
                            <a href="./login.jsp">LOGIN</a>
             				<a href="./join.jsp">JOIN</a>
                            <%} %>
                        </div>
                        
                        
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
                        <a href="./index.jsp"><i class="fa fa-home"></i> Home</a> <a href="./mypage.jsp">My Page</a>
                        <span>buy</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Cart Section Begin -->
    <section class="shop-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shop__cart__table">
                        <table>
                            <thead>
                                <tr>
                                	<th>Date</th> <!-- 구매 날짜 -->
                                    <th>Product</th> <!-- 상품 사진, 이름 -->
                                    <!--  <th>Price</th> 상품 가격 -->
                                    <th>Quantity</th> <!-- 상품 수량 -->
                                    <th>Total Price</th> <!-- 총액 -->
                                    <th>Way</th> <!-- 구매 방법(카드명) -->
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <% int price = 0;
                                	int total = 0;
                                	if(order_list != null) 
                                	for (int i = 0; i<order_list.size(); i++) { 
                                		total = order_list.get(i).getG_price() * order_list.get(i).getO_count();%>
                   <!-- 구매 날짜 -->     	<td class="cart__date"><%=order_list.get(i).getO_date() %> </td>	
                   <!-- 상품 이름, 사진 --> <td class="cart__product__item">
                                        <img src="<%=order_list.get(i).getG_img_path() %>" alt="" style='width:90px;' onclick="location.href='product-details.jsp?g_num=<%=order_list.get(i).getG_num()%>'">
                                        <div class="cart__product__item__title">
                                            <h6><a href="product-details.jsp?g_num=<%=order_list.get(i).getG_num()%>"><%=order_list.get(i).getG_name() %></a></h6>
                                        </div>
                                    </td>
                   <!-- 구매 수량 -->      <td class="cart__quantity">
                                        <div class="pro-qty2">
                                            <input type="text" name="count" class="count" value="<%=order_list.get(i).getO_count() %>" readonly>
                                        </div>
                                    </td>
                   <!-- 총액 -->  <td class="cart__total"><%=total %> 원</td>
                  <!-- 구매 방법 --><td class="cart__way"><%=order_list.get(i).getO_way() %></td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Cart Section End -->

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