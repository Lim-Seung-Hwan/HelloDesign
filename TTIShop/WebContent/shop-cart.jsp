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
cartDAO cartdao = new cartDAO();
int g_num = 0;
int count = 1;
cartDTO dto = null;
ArrayList<cartDTO> cart_list = null; 
memberDTO info = (memberDTO)session.getAttribute("info");
System.out.println(request.getParameter("g_num") + ", " + request.getParameter("count"));
if(request.getParameter("g_num") != null) {
	g_num=Integer.parseInt(request.getParameter("g_num"));
	count=Integer.parseInt(request.getParameter("count"));
	if(info != null) {
		dto = new cartDTO(info.getNum(), g_num, count);
	} else response.sendRedirect("loginFail.jsp?trying=0");
}
if (g_num != 0) {
	cartdao.insert(dto);
}
if(info!=null) {cart_list = cartdao.select_cart(info.getNum());}
else response.sendRedirect("loginFail.jsp?try_login=0");

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
  	function updateSubmit(num,gnum){
      var value = document.getElementsByClassName("count").item(num).value;
      location.href='CartUpdateService?gnum='+ gnum +'&count='+value;
    }
    function check() {
    	var cform = document.updateForm
  		cform.action="CartUpdateGroupService";
  		cform.method="post";
    	document.getElementsByName('product_countAll').item(0).value = "";
        for(var i = 0; i < document.getElementsByName('count').length; i++) {
        	document.getElementsByName('product_countAll').item(0).value = document.getElementsByName('product_countAll').item(0).value + document.getElementsByName('count').item(i).value + ";"
        }
        cform.submit();
    }
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
            <li><span class="icon_search search-switch"></span></li>
            <li><a href="#"><span class="icon_heart_alt"></span>
                <div class="tip">2</div>
            </a></li>
            <li><a href="./shop-cart.jsp"><span class="icon_bag_alt"></span>
                <%if(cart_list!=null) { %><div class="tip"><%=cart_list.size() %></div>
                <%} else { %><div class="tip">0</div>
                 <%} %>
            </a></li>
        </ul>
        <div class="offcanvas__logo">
            <a href="./index.jsp"><img src="img/logo.jpg" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__auth">
            <a href="./login.jsp">Login</a>
            <a href="./join.jsp">Join</a>
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
                        <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                        <span>Shopping cart</span>
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
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <% int price = 0;
                                	int total = 0;
                                	ArrayList<String> myItem = new ArrayList<String>(); 
                                if(cart_list != null) for (int i = 0; i<cart_list.size(); i++) {
                                	myItem.add(cart_list.get(i).getG_num() + ";");
                                	total = cart_list.get(i).getC_price() * cart_list.get(i).getC_count();%>
                                    <td class="cart__product__item">
                                        <img src="<%=cart_list.get(i).getC_imgpath() %>" alt="" style='width:90px;' onclick="location.href='product-details.jsp?g_num=<%=cart_list.get(i).getG_num()%>'">
                                        <div class="cart__product__item__title">
                                            <h6><a href="product-details.jsp?g_num=<%=cart_list.get(i).getG_num()%>"><%=cart_list.get(i).getC_name() %></a></h6>
                                        </div>
                                    </td>
                                    <td class="cart__price"><%=cart_list.get(i).getC_price() %> 원</td>
                                    <td class="cart__quantity">
                                        <div class="pro-qty">
                                            <input type="text" name="count" class="count" value="<%=cart_list.get(i).getC_count() %>">
                                        </div>
                                    </td>
                                    <td class="cart__total"><%=total %> 원</td>
                                    <td class="cart__close"><span onclick="location.href='CartDelService?gnum=<%=cart_list.get(i).getG_num()%>'" class="icon_close"></span>
                                    <a><span onclick="updateSubmit(<%=i%>,<%=cart_list.get(i).getG_num()%>)"><i class="fa fa-check-circle-o"></i></span></a>
                                    </td>
                                </tr>
                                <% price += total; } 
                                StringBuilder stringBuilder = new StringBuilder();
                                for (String item : myItem) { stringBuilder.append(item); }
                                String myItemProcess = stringBuilder.toString();
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="cart__btn">
                        <a href="#">Continue Shopping</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
	                <div class="cart__btn update__btn">
                        <a href="CartDropService"> Drop cart</a>
                    </div>
	            </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="cart__btn update__btn">
                    <form name="updateForm" style="display:none">
                    	<input type="text" name="product_no" value="<%=myItemProcess%>" style="display:none">
                   		<input type="text" name="product_countAll" id="product_countAll" style="display:none">
                    </form>
                        <a onclick="check()"><span class="icon_loading"></span> Update cart</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="discount__content">
                        
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-2">
                    <div class="cart__total__procced">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Total <span><%=price %> 원</span></li>
                        </ul>
                        <a href="./checkout.jsp" class="primary-btn">Proceed to checkout</a>
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