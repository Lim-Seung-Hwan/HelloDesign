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
<style type="text/css">

.button2 {
    background-color: #F34437;
    width: 100px;
    border: none;
    color: #fff !important;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px;
    cursor: pointer;
    border-radius: 10px;
}

</style>





<script type="text/javascript">
	/* 공부 필요 */
	window.onload = function() {
		var tag = readCookie("tag");
		autocheck(tag);
		document.cookie = 'tag=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';

	}
	function autocheck(pos) {
		if (pos == 'spring') {
			document.getElementById('spring').checked = true;

		}
		if (pos == 'summer') {
			document.getElementById('summer').checked = true;
		}
		if (pos == 'fall') {
			document.getElementById('fall').checked = true;
		}
		if (pos == 'winter') {
			document.getElementById('winter').checked = true;
		}
	}

	function checkboxClick(tag) {
		document.getElementById('spring').checked = false;
		document.getElementById('summer').checked = false;
		document.getElementById('fall').checked = false;
		document.getElementById('winter').checked = false;
		autocheck(tag);
		document.cookie = encodeURIComponent("tag") + "="
				+ encodeURIComponent(tag);
		location.reload();
	}

	function readCookie(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ')
				c = c.substring(1, c.length);
			if (c.indexOf(nameEQ) == 0)
				return c.substring(nameEQ.length, c.length);
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
	memberDTO info = (memberDTO) session.getAttribute("info");

	/* arraylist형인 apron_list받아옴. 일단 null */
	ArrayList<goodsDTO> eco_list = null;
	/* 배열 형태 쿠키 생성 - 여러 정보 저장 할 거라서 -->공부 필요 */
	Cookie[] cookies = request.getCookies();
	String tag = null;
	if (cookies != null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("tag")) {
		tag = URLDecoder.decode(cookies[i].getValue(), "utf-8");
			}
		}
	}

	/* tag를 선택 했는지 안했는지 */
	if (tag != null) {/* tag를 선택 했을 때 - 선택한 테그에 대한 모든 정보 가져옴*/
		goodsDAO ecodao = new goodsDAO();
		eco_list = ecodao.pattern_eco(tag);
	} else { /* tag를 선택 안 했을 때 - 모든 정보 가져옴 */
		goodsDAO ecodao = new goodsDAO();
		eco_list = ecodao.select_eco();
	}

	cartDAO cartdao = new cartDAO();
	ArrayList<cartDTO> cart_list = null;
	if (info != null) {
		cart_list = cartdao.select_cart(info.getNum());
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
			<li><a href="./shop-cart.jsp"><span class="icon_bag_alt"></span>
					<%
					if (cart_list != null) {
					%>
					<div class="tip"><%=cart_list.size()%></div> <%
 } else {
 %>
					<div class="tip">0</div> <%
 }
 %> </a></li>
		</ul>
		<div class="offcanvas__logo">
			<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__auth">
			<%
			if (info != null) {
			%>
			<a href="./mypage.jsp">My Page</a> <a href="./LogoutService">Logout</a>
			<%
			} else {
			%>
			<a href="./login.jsp">Login</a> <a href="./join.jsp">Join</a>
			<%
			}
			%>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-3 col-lg-2">
					<div class="header__logo">
						<a href="./index.jsp"><img src="img/logo.png"
							style="height: 45px" alt=""></a>
					</div>
				</div>
				<div class="col-xl-7 col-lg-7">
					<nav class="header__menu">
						<ul>
							<li><a href="./mug.jsp">MUG-CUP</a></li>
							<li><a href="./eco_bag.jsp">ECO-BAG</a></li>
							<li><a href="./apron.jsp">APRON</a></li>
							<li><a href="./chair.jsp">CHAIR</a></li>
							<li class="active"><a href="./custom.jsp">CUSTOM</a></li>
							<!--  <li><a href="#">주문제작</a></li>  -->
						</ul>
					</nav>
				</div>
				<div class="col-lg-2">
					<div class="header__right">
						<div class="header__right__auth">
							<%
							if (info != null) {
							%>
							<ul class="header__right__widget">
								<li><a href="./shop-cart.jsp"><span
										class="icon_bag_alt"></span> <%
 if (cart_list != null) {
 %>
										<div class="tip"><%=cart_list.size()%></div> <%
 } else {
 %>
										<div class="tip">0</div> <%
 }
 %> </a></li>
							</ul>
							<a href="./mypage.jsp">MY PAGE</a> <a href="./LogoutService">LOGOUT</a>
							<%
							} else {
							%>
							<a href="./login.jsp">LOGIN</a> <a href="./join.jsp">JOIN</a>
							<%
							}
							%>
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
						<a href="./index.jsp"><i class="fa fa-home"></i> Home</a> <span>custom</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Section Begin -->
	<section class="shop spad">
		<div class="container">
			<div class="row" style="margin-left:100px">
				<div class="col-lg-3 col-md-3">
					<div class="shop__sidebar">
						<div class="sidebar__color">
							<div class="section-title">
								<h4>pattern</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-9" style="float: left;" >
					<!-- 여기서 실시간 상품 만드는 작업 이루어 지면 됨 -->

				 <%
				   int cnt=Integer.parseInt(request.getParameter("count"));
				   cnt=cnt-1;
				   %> 
				   
				   	<%try{
				   		Thread.sleep(3000);%>
				   		
				   		<img src="./img/pattern/example<%=cnt%>.png" style="width: 512px; height: 512px;">
				   		
				   	<%
				   	}catch(InterruptedException e){
				   		e.printStackTrace();
				   	} %>

					<table width = "510px">
				
						<tr>
							<td width = '170px'></td>
						
							<td width = '170px' align = 'center'>
							<%String wearther = request.getParameter("time"); %>
								<form action="http://localhost:9000/<%=wearther%>"  id="form">
									<input type="submit" class="button2" value="이미지 재생성"/>
								</form>
							</td>
							
							<td width = '170px'></td>
							
						</tr>
					
					</table>

					<form method="post" enctype="multipart/form-data" action="imgup.jsp" id="fileUploadForm">
				     	<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" name="filename1"/>
				     	<input id="btnSubmit" type="submit" value="업로드" style="display:none"/> 
				    </form>
				   
				   
				    <iframe id="if" name="param" style="display:none;"></iframe>
				    
				     <div id="image_container">
				     	<img src="/" style="width: 512px; height: 512px;" id="user_img">
				     </div>
				     
				    
					<!--"http://localhost:9000/custom" -->
					
					<br>
					<button id="btn" class="button2" style="margin-left:200px">CUSTOM</button>
					<br>
					<img src="/" style="width: 512px; height: 512px;" id="custom_img"> <!-- 커스터마이징 된 이미지가 나오는 태그  -->

			
				<script src="./js/jquery-3.3.1.min.js">//jQuery 파일 불러오기</script>
				
				<script type="text/javascript">
				
					var src=null;
					
					function setThumbnail(event){
						
						var reader = new FileReader();
						reader.onload = function(event){
							var img = document.getElementById("user_img");
							img.setAttribute("src", event.target.result);
							
							src = jQuery('#user_img').attr("src");
							console.log('src 출력:');
							console.log(src);
							
							};
						reader.readAsDataURL(event.target.files[0]);
						}
					
				</script>


					<!-- 여기서 실시간 상품 만드는 작업 이루어 지면 됨 -->
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Section End -->

	<!-- Footer Section Begin -->
	<div class="row"></div>
	<div class="row"></div>
	<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	<div class="row"></div>
	<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	<div class="footer__copyright__text">
		<p>
			Copyright &copy;
			<script>
				document.write(new Date().getFullYear());
			</script>
			All rights reserved | This template is made with <i
				class="fa fa-heart" aria-hidden="true"></i> by <a
				href="https://colorlib.com" target="_blank">Colorlib</a>
		</p>
	</div>
	<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

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
	<script type="text/javascript">
					    $("#btn").click(function (event) {         
					    	//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음 
					    	event.preventDefault();          
					        // Get form         
					        var form = $('#fileUploadForm')[0];  	    
					        // Create an FormData object          
					        var data = new FormData(form);  	   
					        // disabled the submit button         
					        $("#btnSubmit").prop("disabled", true);   
					        
					        $.ajax({             
					        	type: "POST",          
					            enctype: 'multipart/form-data',  
					            url: "ImgupServelt",        
					            data: data,          
					            processData: false,    
					            contentType: false,      
					            cache: false,           
					            timeout: 600000,       
					            success: function (data) { 
					            	alert("complete");
					            	alert(data);
					            	$("#btnSubmit").prop("disabled", false);
					            	
					            	$.ajax({
					            		type: "POST",
					            		url: "http://localhost:9000/custom", 
					            		data: {img_url:data},
					            		success: function (url) {
					            			alert("flask complete");
					            			alert(url);
					            			$('#custom_img').attr('src',url);
					            		},
					            		error: function (e) {
					            			alert("flask fail");
					            		}
					            	});
					            },          
					            error: function (e) {  
					            	console.log("ERROR : ", e);     
					                $("#btnSubmit").prop("disabled", false);    
					                alert("fail");      
					             }     
					    	});
					        
					    }); 
				    </script>
</body>

</html>