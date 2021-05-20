<%@page import="com.member.memberDTO"%>
<%@page import="com.cart.cartDTO"%>
<%@page import="com.cart.cartDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.goods.goodsDTO"%>
<%@page import="com.goods.goodsDAO"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hello | Design</title>
    
     <script language="javascript">
  	function showPopup() {
  		
  	 	var chkbox = document.checkout__form.check_order.checked;
		if(chkbox){
			var namecheck = document.checkout__form.name.value == "";
			var addrcheck = document.checkout__form.name.value == "";
			var detailaddrcheck = document.checkout__form.name.value == "";
			var phonecheck = document.checkout__form.name.value == "";
			if(!namecheck && !addrcheck && !detailaddrcheck && !phonecheck) {
				document.cookie = encodeURIComponent("name") + "=" + encodeURIComponent(document.checkout__form.name.value);
				document.cookie = encodeURIComponent("area") + "=" + encodeURIComponent(document.checkout__form.area.value);
				document.cookie = encodeURIComponent("addr") + "=" + encodeURIComponent(document.checkout__form.addr.value);
				document.cookie = encodeURIComponent("detail_addr") + "=" + encodeURIComponent(document.checkout__form.detail_addr.value);
				document.cookie = encodeURIComponent("phone") + "=" + encodeURIComponent(document.checkout__form.phone.value);
		  		window.open("HelloDesign_Pay.jsp", "전자결제 신용카드 ", "width=500, height=300, left=100, top=50");
		  	//결제창 넘어가는 파일, 팝업창의 별칭, 팝업창 크기
			}
			else {
				alert ('모든 양식을 기록해주세요');
			}
		} else if(!chkbox) {
			alert("주문 내역을 확인해주세요.");
		}
  		 
  		
  		}
 	 </script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-ic\ons.css" type="text/css">
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

	cartDAO cartdao = new cartDAO();
	ArrayList<cartDTO> cart_list = null;
	memberDTO info=(memberDTO)session.getAttribute("info");
	if(info==null) {
		response.sendRedirect("login.jsp");
	} else {
		cart_list = cartdao.select_cart(info.getNum());
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
            <a href="./index.jsp"><img src="img/logo.jpg" alt=""></a>
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
                        <a href="./index.jsp"><img src="img/logo.jpg" alt=""></a>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="./index.jsp">HOME</a></li>
                            <li><a href="./mat.jsp">MAT</a></li>
                            <li><a href="./eco_bag.jsp">ECO-BAG</a></li>
                            <li><a href="./apron.jsp">APRON</a></li>
                            <li><a href="./chair.jsp">CHAIR</a></li>
                           <!--  <li><a href="#">주문제작</a></li>  -->
                            <li class="active"><a href="#">MYPAGE</a>
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

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
<!--             <div class="row">
                <div class="col-lg-12">
                    <h6 class="coupon__link"><span class="icon_tag_alt"></span> <a href="#">Have a coupon?</a> Click
                    here to enter your code.</h6>
                </div>
            </div> -->
            <form action="#" class="checkout__form" name="checkout__form">
                <div class="row">
                    <div class="col-lg-8">
                        <h5>주문하기</h5>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>이름 <span>*</span></p>
                                    <input type="text" name="name">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>시/도 <span>*</span></p>
                                    <select name="area">
									  <option value="서울특별시">서울특별시</option>
									  <option value="인천광역시">인천광역시</option>
									  <option value="대전광역시">대전광역시</option>
									  <option value="대구광역시">대구광역시</option>
									  <option value="울산광역시">울산광역시</option>
									  <option value="부산광역시">부산광역시</option>
									  <option value="광주광역시">광주광역시</option>
									  <option value="세종특별자치시">세종특별자치시</option>
									  <option value="경기도">경기도</option>
									  <option value="강원도">강원도</option>
									  <option value="충청북도">충청북도</option>
									  <option value="충청남도">충청남도</option>
									  <option value="전라북도">전라북도</option>
									  <option value="전라남도">전라남도</option>
									  <option value="경상북도">경상북도</option>
									  <option value="경상남도">경상남도</option>
									  <option value="제주도">제주도</option>
									</select>
                                </div>
                                <div class="checkout__form__input">
                                    <p>주소 <span>*</span></p>
                                    <input type="text" placeholder="주소" name="addr">
                                    <input type="text" placeholder="상세주소" name="detail_addr">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>전화번호 <span>*</span></p>
                                    <input type="text" name="phone">
                                </div>
                            </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="checkout__order">
                                <h5>주문서</h5>
                                <div class="checkout__order__product">
                                    <ul>
                                        <li>
                                            <span class="top__text">제품</span>
                                            <span class="top__text__right">가격</span>
                                        </li>
                                        <%int sum = 0;
                                        if(info!=null) for (int i=0; i<cart_list.size(); i++){%>
                                        <li><%=cart_list.get(i).getC_name()%> <span><%=cart_list.get(i).getC_price() %></span></li>
                                        <% sum += cart_list.get(i).getC_price(); } %>
                                    </ul>
                                </div>
                                <div class="checkout__order__total">
                                    <ul>
                                        <!-- <li>Subtotal <span>$ 750.0</span></li> -->
                                        <li>합계 <span> <%= sum %></span></li>
                                    </ul>
                                </div>
                                <div class="checkout__order__widget">
                                    <label for="check-payment">
                                        주문 내역을 확인하였습니다.
                                        <input type="checkbox" id="check-payment" name="check_order">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="button" class="site-btn" onclick="showPopup();" />주문하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

        <!-- Footer Section Begin -->
	<footer class="footer" style="padding-bottom: 50px;">
    
    <div class="row"></div>
    <div class="row"></div>
    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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