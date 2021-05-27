<%@page import="com.order.orderDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> 
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<%
memberDTO info = (memberDTO)session.getAttribute("info");
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String addr = request.getParameter("area") + " " + request.getParameter("addr") + " " + request.getParameter("detail_addr");
String phone = request.getParameter("phone");
String product_no = request.getParameter("product_no");
String pname = request.getParameter("pname");
String product_count = request.getParameter("product_count");
int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
int pcount = 0;
if(request.getParameter("multiple")!=null) {
	pcount = Integer.parseInt(request.getParameter("multiple"));
}
String urlpno = URLEncoder.encode(product_no, "utf-8");
String urlpcount = URLEncoder.encode(product_count, "utf-8");
orderDTO odto = new orderDTO(addr, name, phone, product_no, product_count);
session.setAttribute("order", odto);
%>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp60991373'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '<%=pname%> <%if(pcount>1) {%> 외 <%=pcount-1%>건<%}%>',
            amount : <%=totalPrice%>,
            buyer_email : '',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=addr%>',
            buyer_postcode : '',
            m_redirect_url : 'http://digiwb.softether.net:8085/TTIShop/payService'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                       msg = '결제에 실패했습니다.';
                       msg += '에러내용 :'+ rsp.error_msg;
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                opener.location.replace("payService");
                self.close();
                
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                                  
                alert(msg);
                opener.location.replace("checkout.jsp");
            }
        });
        
    });
    </script>
	<!--  <form action="payService" method="post" name="checkout__form">
		<input type="text" name="name" value="<%=name%>" style="display:none">
		<input type="text" name="addr" value="<%=addr%>" style="display:none">
		<input type="text" name="phone" value="<%=phone%>" style="display:none">
		<input type="text" name="product_no" value="<%=product_no%>" style="display:none">
		<input type="text" name="product_count" value="<%=product_count%>" style="display:none">		
	</form> -->
</body>
</html>