<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<script type="text/javascript">

function order_basketList(){
	$.ajax({
		type:'post',
		url:'../basket/userBasketList.do'
		success:function(result){
			
		},error:function(error){
			alert("장바구니 리스트호출 에러")
		}
		
		
	})
}

</script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="../main/main.do"><i class="fa fa-home"></i> 홈페이지</a>
                        <a href="../shop/shop_list.do">쇼핑몰</a>
                        <span>장바구니</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>이미지</th>
                                    <th class="p-name">상품명</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총 갯수</th>
                                    <th><i class="ti-close"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart-pic first-row"><img src="poster "></td>
                                    <td class="cart-title first-row">
                                        <h5>${vo.title }</h5>
                                    </td>
                                    <td class="p-price first-row">price </td>
                                    <td class="qua-col first-row">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                              ordercount 
                                            </div>
                                        </div>
                                    </td>
                                    <td class="total-price first-row">총금액 </td>
                                    <td class="close-td first-row"><i class="ti-close"></i></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <a href="../shop/shop_list.do" class="primary-btn continue-shop">계속 쇼핑하기</a>
                                <a href="#" class="primary-btn up-cart">장바구니 수정</a>
                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-4">
                            <div class="proceed-checkout">
                                <ul>
                                    <!-- <li class="subtotal">Subtotal <span>$240.00</span></li> -->
                                    <li class="cart-total">총 금액 <span></span></li>
                                </ul>
                                <a href="#" class="proceed-btn">결제하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
    
</body>

</html>