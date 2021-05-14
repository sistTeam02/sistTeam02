<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	changeState();
})
$(document).on("click",".eventBtn",function(){
	updateBtn();
})

function updateBtn(){
	let value=$('.eventBtn').attr('value');
	if(value==0){//숨기기 버튼클릭
		$('.eventBtn').attr('id','showBtn');
		$('.eventBtn').text('결제완료 보기');
		hideState();
		$('.eventBtn').attr('value','1');
	}else{//보이기버튼 클릭
		$('.eventBtn').attr('id','hideBtn');
		$('.eventBtn').text('결제완료 가림');
		showState();
		$('.eventBtn').attr('value','0');
	}
}

/* 구매상태 보여줌 */
function changeState(){
	
	let row=$('td[id^=state]').length;
	for(i=0;i<row;i++){
		let state=$('#state'+i).text();
		if(state==0){
			$('#state'+i).text('결제 대기중');
			$('#state'+i).attr('value','0');
		}else if(state==1){
			$('#state'+i).text('결제 완료');
			$('#state'+i).attr('value','1');
		}
	}
}
function hideState(){
	let row=$('td[id^=state]').length;
	for(i=0;i<row;i++){
		let value=$('#state'+i).attr('value');
		if(value==1){
			$('#state'+i).parent().hide();
		}
	}
}
function showState(){
	let row=$('td[id^=state]').length;
	for(i=0;i<row;i++){
		let value=$('#state'+i).attr('value');
		if(value==1){
			$('#state'+i).parent().show();
		}
	}
}
</script>
<style type="text/css">
#hideBtn{
    float: right;
    width: 7em;
    border-radius: 8px;
    background-color: white;
    color: #000000a6;
}
#showBtn{
	float: right;
    width: 7em;
    border-radius: 8px;
    background-color: #648cff;
    color: white;
}
</style>
</head>
<body>
	<section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                    	<form method="get" action="../shop/user_basket_ok.do">
                    	<table>
                    		<select name=year>
                    			<c:forEach begin="2010" end="2021" var="i">
                    			<option >${ i}</option>
                    			</c:forEach>
                    		</select>
                    		년
                    		<select name=month>
                    			<c:forEach begin="1" end="12" var="i">
                    			<option >
                    			<fmt:parseDate var="num" value="${i }" pattern="MM"/>
                    			<fmt:formatDate value="${num }" pattern="MM"/></option>
                    			</c:forEach>
                    		</select>
                    		월
                    		<button type="submit">조회</button>
                    		<button type="button" id="hideBtn" class="eventBtn" value="0">결제완료 숨김</button>
                    	</table>
                 		</form>
                        <table>
                            <thead>
                                <tr>
                                    <th class="p-name">상품명</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>합계</th>
                                    <th><i class="ti-close"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="vo" varStatus="s">
                                <tr>
                                    <td class="cart-title ">
                                        <h5>${vo.title }</h5>
                                    </td>
                                    <td class="p-price ">${vo.price }</td>
                                    <td class="qua-col ">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="${vo.ordercount }">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="total-price ">${vo.price*vo.ordercount}</td>
                                    <td class="state" id="state${s.index }">${vo.state }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </section>
</body>
</html>