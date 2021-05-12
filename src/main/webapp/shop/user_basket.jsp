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
$(document).ready(function() {
	
	order_basketList(1);
	change_th(1);
});
/* 테이블 상단 메뉴클릭시 */
$(document).on("click",".basket_memu",function() {
	let no=$(this).attr('value');
	order_basketList(no);
	change_th(no);
})
/* 장바구니 수량변경 */
$(document).on("click",".qtybtn",function() {
	let price=$(this).parents(".qua-col").prev().text();
	let ordercount=$(this).siblings(".order_input").val();
	let totalPrice=cal_price(price,ordercount);
	$(this).parents(".qua-col").next().text(totalPrice);
	totalprice();
});
/* 삭제버튼 클릭시 */
$(document).on("click",".ti-close-clone",function() {
 $(this).parent().parent().remove();
 let no=$(this).attr('no');
 
 del_order_basket(no);
});
/* 결제버튼 */
$(document).on("click",".proceed-btn",function() {
insert_purchase();
});
function order_basketList(no){
	$('tr[id^=table_tr]').remove();
	$.ajax({
		type:'post',
		url:'../basket/userBasketList.do',
		data:{'no':no},
		success:function(result){
			let json=JSON.parse(result);
			make_tr(json,no);
			make_icon();
			totalprice();
		},error:function(error){
			alert("장바구니 리스트호출 에러")
		}
		
		
	})
}
function make_tr(json,no){
	if(no==1){
		for(i=0;i<json.length;i++){
			$('#cart_tbody').append(
			  "  <tr id=table_tr"+i+">"+
	                  "<td class='cart-pic'><img src="+json[i].poster+"></td>"+
	                       "<td class='cart-title'>"+
	                         "<h5 class=title pno="+json[i].pno+" cno="+json[i].cno+">"+json[i].title+"</h5>"+
	                          "</td>"+
	                         "<td class='p-price'>"+showPrice(json[i].price)+"</td>"+
	                       "<td class='qua-col'>"+
	                           "<div class='quantity'>"+
	                              "<div class='pro-qty'>"+
	                                      "<input type='text' class='order_input' id=order_input"+i+" value="+json[i].ordercount+">"+
	                               "</div>"+
	                            "</div>"+
	                       "</td>"+
	                "<td class='total-price' id=total"+i+">"+cal_price(json[i].price,json[i].ordercount)+"</td>"+
	                "<td class='close-td'><i class='ti-close ti-close-clone' no="+json[i].no+"></i></td>"+
	                   "</tr>"
			)
		}
	}else if(no==2){
		for(i=0;i<json.length;i++){
			$('#cart_tbody').append(
			  "  <tr id=table_tr"+i+">"+
	                  "<td class='cart-pic'><img src="+json[i].poster+"></td>"+
	                       "<td class='cart-title'>"+
	                         "<h5 class=title pno="+json[i].pno+" cno="+json[i].cno+">"+json[i].title+"</h5>"+
	                          "</td>"+
	                         "<td>"+json[i].trainer+"</td>"+
	                       "<td class='qua-col'>"+
	                          "3개월"+
	                       "</td>"+
	                "<td class='total-price p-price' id=total"+i+">"+showPrice(json[i].price)+"</td>"+
	                "<td class='close-td'><i class='ti-close ti-close-clone' no="+json[i].no+"></i></td>"+
	                   "</tr>"
			)
		}
		
	}
}
function make_icon(){ /* main.js 안에있는 함수*/
	var proQty = $('.pro-qty');
	proQty.prepend('<span class="dec qtybtn">-</span>');
	proQty.append('<span class="inc qtybtn">+</span>');
	proQty.on('click', '.qtybtn', function () {
		var $button = $(this);
		var oldValue = $button.parent().find('input').val();
		if ($button.hasClass('inc')) {
			var newVal = parseFloat(oldValue) + 1;
		} else {
			// Don't allow decrementing below zero
			if (oldValue > 0) {
				var newVal = parseFloat(oldValue) - 1;
			} else {
				newVal = 0;
			}
		}
		$button.parent().find('input').val(newVal);
	});
}
/* Json 금액합계 */
function cal_price(price,ordercount){
	price=price.replace(/,/g, "")
	let totalprice=(price*ordercount).toLocaleString();
	return totalprice
}
/* 금액 ,찍기 */
function showPrice(price){
	let strPrice=price.toLocaleString();
	return strPrice
}
/* 장바구니 삭제 */
function del_order_basket(no){
	$.ajax({
		type:'post',
		data:{'no':no},
		url:'../basket/delete_userBasket.do',
		success:function(result){
			
		},error:function(error){
			alert("장바구니 삭제에러")
		}
		
	})
}
function totalprice(){
	let sumprice=0;
	let count=$(".total-price").length;
	for(i=0; i<count;i++){
		let price=$("#total"+i).text().replace(/,/g, "");
		sumprice+=Number(price);
	}
	$('#sumprice').text(sumprice.toLocaleString());
	
}
/* 결제 테이블로 이동 json생성 */
function insert_purchase(){
	let box=[]
	let rowcount=$(".total-price").length;
	
	for(i=0;i<rowcount;i++){
		box[i]={ 
			"pno" : $("#table_tr"+i).children(".cart-title").children().attr("pno"),
			"cno" : $("#table_tr"+i).children(".cart-title").children().attr("cno"),
			"title" :$("#table_tr"+i).children(".cart-title").children().text(),
			"price" :$("#table_tr"+i).children(".p-price").text().replace(/,/g, ""),
			"ordercount" :$("#order_input"+i).val(),
		}
	}
	$.ajax({
		type:'post',
		data:{"box":JSON.stringify(box)},
		url:'../basket/userBasketInsert.do',
		success:function(result){
			
		},error:function(error){
			alert("결제에러")
		}
	})
}
function change_th(no){
	if(no==1){
		$('#change_th1').text('가격');
		$('#change_th2').text('수량');
		$('#change_th3').text('총금액');
	}else if(no==2){
		$('#change_th1').text('트레이너');
		$('#change_th2').text('기간');
		$('#change_th3').text('금액');
	}
}

</script>
<style type="text/css">
.basket_memu{
    width: 10em;
    display: block;
    height: 2em;
    float: left;
    border: 1px solid #ebebeb;
    text-align: center;
    cursor: pointer;
}

</style>
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
                      	<span class="basket_memu" value="1">쇼핑몰</span>
                      	<span class="basket_memu" value="2">트레이닝</span>
                        <table>
                            <thead>
                                <tr>
                                    <th>이미지</th>
                                    <th class="p-name">상품명</th>
                                    <th id="change_th1">가격</th>
                                    <th id="change_th2">수량</th>
                                    <th id="change_th3">총 금액</th>
                                    <th><i class="ti-close"></i></th>
                                </tr>
                            </thead>
                            <tbody id="cart_tbody">
                              
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <a href="../shop/shop_list.do" class="primary-btn continue-shop">계속 쇼핑하기</a>
                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-4">
                            <div class="proceed-checkout">
                                <ul>
                                    <!-- <li class="subtotal">Subtotal <span>$240.00</span></li> -->
                                    <li class="cart-total">총 금액 <span id="sumprice"></span></li>
                                </ul>
                                <button class="proceed-btn" style="width: 25.7em;">결제하기</button>
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