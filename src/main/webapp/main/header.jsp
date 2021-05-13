<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$("#main_text").autocomplete({
		source:function(request, response){
			$.ajax({
				type:'get',
				url:"../main/json.do",
				dataType:"json",
				data:{'search':$("#main_text").val()},
				success: function(data){
					response(
						$.map(data, function(item){
							return {
								label:item,
								value:item,
								test:item+"test"
							}
						})
					);
				}
			});
		},
		select:function(event, ui){
			console.log(ui);
			console.log(ui.item.label);
			console.log(ui.item.value);
			console.log(ui.item.test);
		},
		focus:function(event, ui){
			return false;
		},
		minLength:1,
		autoFocus:true,
		classes: {
			"ui-autocomplete":"highlight"
		},
		delay:300,
		position:{of:'#searchdiv', my:"right top", at:"right botton"},
		close: function(event){
			console.log(event);
		}
	}).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
        return $( "<li>" )    //기본 tag가 li로 되어 있음 
        .append( "<div>" + item.label + "</div>" )    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
        .appendTo( ul );
 		};
	
	
	$('#main_button').click(function(){
		let selectvalue=$('#category_selected option:selected').val();
		let search=$('#main_text').val();
		//console.log(selectvalue);
		if(search.trim()==''){
			alert('검색어를 입력해 주세요.');
			$('#main_text').focus();
		}
		else if(selectvalue==0){
			location.href="../main/search.do?no="+selectvalue+"&search="+search;
		}
		else{
			location.href="../main/search_category.do?no="+selectvalue+"&search="+search;
		}
		//console.log("../main/search.do?no="+selectvalue+"&search="+search);
	});
});
</script>
<body>
	 <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="header-top">
            <div class="container">
                <div class="ht-left">
                  
                </div>
                <div class="ht-right">
                	<c:if test="${sessionScope.id==null}">
                         <a href="../member/login.do" class="login-panel"><i class="fa fa-user"></i>Login</a>
                         <a href="../member/register.do" class="login-panel"><i class="fa fa-user"></i>Sign Up</a>
                	</c:if>
                	<c:if test="${sessionScope.id!=null}">
                		 <a href="../member/logout.do" class="login-panel"><i class="fa fa-user"></i>로그아웃</a>
                	</c:if>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="../main/main.do">
                                <img src="../img/logo.png">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7" id="searchdiv">
                        <div class="advanced-search">
                            <!-- <button type="button" class="category-btn">카테고리</button>-->
                            <select class=category-btn id="category_selected">
                            	<option value="0">카테고리 전체</option>
                            	<option value="1">무료 홈 트레이닝</option>
                            	<option value="4">유튜브 홈 트레이닝</option>
                            	<option value="2">건강 식품</option>
                            	<option value="3">운동 기구 & 용품</option>
                            </select>
                            <div class="input-group">
                                <input type="text" placeholder="무엇을 찾으시나요?" id="main_text">
                                <button type="button" id="main_button"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                            <li class="heart-icon">
                                <a href="../mypage/like_list.do"><!-- 찜 리스트 -->
                                    <i class="icon_heart_alt"></i>
                                    <span>3</span>
                                </a>
                            </li>
                            <li class="cart-icon">
                                <a href="#"><!-- 장바구니 -->
                                    <i class="icon_bag_alt"></i>
                                    <span>2</span>
                                </a>
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="si-pic"><img src="../img/shop_001.jpg" width=70px height=70px></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>￦80,600 x 1</p>
                                                            <h6>홈트레이닝 룰루레몬 요가...</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="si-pic"><img src="../img/shop_067.jpg" width=70px height=70px></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>￦21,760 x 1</p>
                                                            <h6>스타스포츠 이지 중량밴드...</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="select-total">
                                        <span>총 금액:</span>
                                        <h5>￦102,360</h5>
                                    </div>
                                    <div class="select-button">
                                        <a href="../shop/user_basket.do" class="primary-btn view-card">장바구니</a>
                                        <a href="#" class="primary-btn checkout-btn">결제하기</a>
                                    </div>
                                </div>
                            </li>
                            <c:if test="${sessionScope.id!=null }">
                            <li class="cart-price">${name }${admin=='y'?"(관리자)":" "}님</li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>쇼핑몰</span>
                        <ul class="depart-hover">
                            <li><a href="../shop/shop_list.do">운동기구&용품</a></li>
                            <li><a href="../shop/dfood_list.do">건강 식품</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
						<li><a href="../main/main.do">Home</a></li>
						<li><a href="../home_training/ht_main.do">홈트레이닝</a>
                            <ul class="dropdown">
                                <li><a href="../home_training/ht_main.do">홈트레이닝 목록</a></li>
                                <li><a href="../homet_board/homet_boardList.do">수강후기 게시판</a></li>
                                <li><a href="../youtube/you_list.do">유튜브 전체 리스트</a></li>
                                <li><a href="../youtube/you_tuber.do">홈트 유튜버</a></li>
                            </ul>
                        </li>
                        <li><a href="#">커뮤니티</a>
                            <ul class="dropdown">
                                <li><a href="../board/flist.do">자유게시판(운동팁 공유)</a></li>
                                <li><a href="../board/qlist.do">고객문의 게시판</a></li>
                                <li><a href="../board/nlist.do">공지사항</a></li>
                            </ul>
                        </li>
                        <li><a href="../walk/walk.do">산책로</a>
                            <ul class="dropdown">
                                <li><a href="../walk/walk.do">산책로 추천맵</a></li>
                            </ul>
                        </li>
						<li><a href="../chat/chat_main.do">채팅</a>
						</li>
					
						
						
						<c:if test="${sessionScope.id!=null }">
							<c:if test="${sessionScope.admin=='y' }">
							<li><a href="#">관리자페이지</a>
								<ul class="dropdown">
									<li><a href="../main/admin.do">관리자 결제승인</a></li>
									<li><a href="../main/admin_main.do">관리자페이지</a></li>
								</ul>
							</li>
							</c:if>
							<c:if test="${sessionScope.admin=='n' }">
	                        <li><a href="../mypage/like_list.do">마이페이지</a>
	                            <ul class="dropdown">
	                                <li><a href="../mypage/like_list.do">운동&쇼핑몰 찜리스트</a></li>
	                                <li><a href="../mypage/buy_list.do">프로그램 신청 내역</a></li>
	                                <li><a href="../mypage/mypage_schedule.do">나만의 계획</a></li>
	                                <li><a href="../mypage/mypage_update.do">회원정보 수정</a></li>
	                            </ul>
	                        </li>
	                        </c:if>
                        </c:if>
                        
                        <li><a href="#">쇼핑</a>
                            <ul class="dropdown">
                                <li><a href="../shop/user_basket.do">장바구니</a></li>
                                <li><a href="./shopping-cart.html">주문확인</a></li>
                            </ul>
                        </li>
                       
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->
</body>
</html>