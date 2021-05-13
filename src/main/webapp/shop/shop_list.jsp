<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	// 추천버튼 클릭시(추천 추가 또는 추천 제거)
	$("#goodsJjimUpdate").click(function(){
		$.ajax({
			url: "mypage/like_list_insert.do",
            type: "POST",
            data: {
                no: ${pno},
                id: '${id}'
            },
            success: function () {
		        recCount();
            }
		})
	});
	// 게시글 추천수
    function recCount() {
		$.ajax({
			url: "mypage/like_list_gcount.do",
            type: "POST",
            data: {
                no: ${pno}
            },
            success: function (count) {
            	$(".goodsJjimCount").html(count);
            },
		})
    };
    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
    
    function initPriceSlider()
    {
    	$( "#slider-range" ).slider(
    	{
    		range: true,
    		min: 0,
    		max: 1000,
    		values: [ 0, 580 ],
    		slide: function( event, ui )
    		{
    			$( "#amount" ).val( "//" + ui.values[ 0 ] + " - //" + ui.values[ 1 ] );
    		}
    	});
    		
    	$( "#amount" ).val( "//" + $( "#slider-range" ).slider( "values", 0 ) + " - //" + $( "#slider-range" ).slider( "values", 1 ) );
    }
});

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
      <div class="app">
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
                        <h4 class="fw-title" id="price">가격대</h4>
                        <div class="filter-range-wrap">
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                data-min="0" data-max="300">
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
                            <div class="bc-item"><!--  vo-for="gvo in goods" -->
                               <%-- <c:forEach var="poster" items="${gvo.list }"> --%>
                                  <img :src="gvo.poster" width=100px height=100px>
                               <%-- </c:forEach> --%>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="product-show-option">
                        <div class="row">
                            <div class="col-lg-7 col-md-7">
                                <div class="select-option" style="weight:25px">
                                    <select class="sorting">
                                        <option value="">최신순</option>
                                        <option value="">가격순</option>
                                    </select>
                                    <!-- <select class="p-show">
                                        <option value="">Show:</option>
                                    </select> -->
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-5 text-right">
                                <!-- <p>Show 01- 09 Of 36 Product</p> -->
                                <p>총 <span id="count" style="color:#648cff">572</span>개의 상품</p>
                            </div>
                        </div>
                    </div>
                    <div class="product-list">
                        <div class="row"><!-- v-for="gvo in goods" -->
                           <c:forEach var="gvo" items="${list }">
                             <div class="col-lg-4">
                               <div class="product-item" style="width:262.5px;height:410.5px">
                                     <div class="pi-pic" style="width:262.5px;height:262.5px">
                                        <img src="${gvo.poster }">
                                        <!-- <div class="sale pp-sale">Sale</div> -->
                                        <div class="icon product_favorite">
                                          <!-- 찜으로 이동 -->
                                          <c:choose>
                                            <c:when test="${id!=null }">
	                                          <a href="#" id="goodsJjimUpdate"><!-- 로그인시, 활성화 -->
	                                            <i class="icon_heart_alt"></i> <!-- 활성화는 icon_heart -->
	                                          </a>
	                                        </c:when>
	                                        <c:otherwise><!-- 로그인 필요 -->
	                                          <a href="../member/login.do">
	                                            <i class="icon_heart_alt"></i>
	                                          </a>
	                                        </c:otherwise>
                                          </c:choose>
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

        </div>
                <div style="height:30px"></div>
          <div class="col-lg-3"></div>
          <div class="col-lg-9 text-center">
            <%-- <tr>
              <td class="text-right">
	            <a href="shop_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm">이전</a>
	            ${curpage } page / ${totalpage } pages
	            <a href="shop_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm">다음</a>
	          </td>
            </tr> --%>
	          <tr>
		       <td>
		         <ul class="pagination">
		             <li><a href="shop_list.do?page=${curpage>1?curpage-1:curpage }">이전</a></li>
				         <c:forEach var="i" begin="${startPage }" end="${endPage }">
				           &nbsp;&nbsp;<li><a href="../shop/shop_list.do?page=${i }">${i }</a></li>&nbsp;&nbsp;
				         </c:forEach>
			         <li><a href="shop_list.do?page=${curpage<totalpage?curpage+1:curpage }">다음</a></li>
			     </ul>
		       </td>
		     </tr>
          </div>
          <div style="height:50px"></div>
      </div>
    </section>
    <!-- Product Shop Section End -->
    
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/jquery.countdown.min.js"></script>
<script src="../js/jquery.nice-select.min.js"></script>
<script src="../js/jquery.zoom.min.js"></script>
<script src="../js/jquery.dd.min.js"></script>
<script src="../js/jquery.slicknav.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/main.js"></script>
</body>
</html>