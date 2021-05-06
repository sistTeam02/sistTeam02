<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/* $(function(){
	$("div.loading-more").slice(0, 9).show(); // 최초 9개 선택
	$("#load").click(function(e){ // Load More를 위한 클릭 이벤트e
		e.preventDefault();
		$("div:hidden").slice(0, 9).show(); // 숨김 설정된 다음 10개를 선택하여 표시
		if($("div:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
			alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
		}
	}); */
	$("#price").click(function(){
		$(this).append(
				 "<li class='test'>건강식품</li>"
				 
				 
		)
	});
	
	
 });
$(document).on("click",".test",function(){
	alert("a");
});
 function make_json(){
	$.ajax({
		type:'get',
		url:'../shop/detail_json.do',
		success:function(result){
			let json=JSON.parse(result); //변수명 상관없음 let aa
			make_tr(json);
			/* 여기서 제어 */
		},error:function(error){
			alert("에러");
		}
	})
}
function 출력함수(){
	
}
$(document).ready(function(){//문서 출력하자마자  아래 함수실행
	출력함수();
})

function 추가함수(){
	
	$.ajax({
		이전출력부분제거();
		출력함수();
	})
}
</script>
<style type="text/css">
.checkBtn{
	background-color: gray;
}
.okBtn{
	display: none;
}
</style>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="../main/main.do"><i class="fa fa-home"></i> Home</a>
                        <span class="active">Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
              <!-- 사이트 바 -->
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    <div class="filter-widget">
                        <h4 class="fw-title">카테고리</h4>
                        <ul class="filter-catagories">
                            <li><a href="../shop/shop_list.do">운동기구&용품</a></li>
                            <li><a href="../shop/dfood_list.do">건강식품</a></li>
                        </ul>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title" id="price">가격</h4>
                        <div class="filter-range-wrap">
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                data-min="33" data-max="98">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            </div>
                        </div>
                        <a href="#" class="filter-btn">Filter</a>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">최근 본 상품</h4>
                        <div class="fw-brand-check">
                            <div class="bc-item">
                               <c:forEach var="poster" items="${gvo.list }">
                                  <img src="${gvo.poster }" width=150px height=150px>
                               </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="product-show-option">
                        <div class="row">
                            <div class="col-lg-7 col-md-7">
                                <div class="select-option">
                                    <select class="sorting">
                                        <option value="">Default Sorting</option>
                                    </select>
                                    <select class="p-show">
                                        <option value="">Show:</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-5 text-right">
                                <p>Show 01- 09 Of 36 Product</p>
                            </div>
                        </div>
                    </div>
                    <div class="product-list">
                        <div class="row">
                           <c:forEach var="gvo" items="${list }">
                             <div class="col-lg-4">
                               <div class="product-item" style="width:262.5px;height:410.5px">
                                     <div class="pi-pic" style="width:262.5px;height:262.5px">
                                        <img src="${gvo.poster }">
                                        <!-- <div class="sale pp-sale">Sale</div> -->
                                        <div class="icon">
                                          <!-- 찜으로 이동 -->
                                          <a href="#">
                                            <i class="icon_heart_alt"></i>
                                          </a>
                                        </div>
                                        <ul class="text-left">
                                          <!-- 장바구니로 이동 -->
                                            <li class="w-icon active">
                                              <a href="../shop/user_basket.do"><i class="icon_bag_alt"></i></a>
                                            </li>
                                            <!-- <li class="quick-view"><a href="#">+ Quick View</a></li> -->
                                            <!-- <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li> -->
                                        </ul>
                                     </div> 
                                     <a href="shop_detail_before.do?no=${gvo.no }">
                                        <div class="pi-text text-center">
	                                       <p>${gvo.title }</p>
	                                    </div>
	                                 </a>
	                                 <div class="product-price text-center" style="font-size:13pt;font-weight:bold;color:#648cff;height:55px">
	                                    <span><fmt:formatNumber value="${gvo.price }"/>&nbsp;원</span>
	                                 </div>
	                              </div>
                               </div>
                            </c:forEach>    
                         </div>
                     </div>
             </div>
         </div>
         <div class="loading-more" style="height:30px">
             <i class="icon_loading"></i>
                  <a href="#" id="load">
                       Loading More
                  </a>
          </div>
      </div>
    </section>
    <!-- Product Shop Section End -->
</body>
</html>