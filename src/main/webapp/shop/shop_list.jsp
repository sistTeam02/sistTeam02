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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 181400,
      values: [ 111, 181400 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "???" + ui.values[ 0 ] + " - ???" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "???" + $( "#slider-range" ).slider( "values", 0 ) +
      " - ???" + $( "#slider-range" ).slider( "values", 1 ) );
  } );
  </script>
<!-- <script type="text/javascript">
$(function(){
	// ????????? ?????????(?????? ?????? ?????? ?????? ??????)
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
	// ???
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
    recCount(); // ?????? ???????????? ??? ??????????????? ?????? ?????? ?????? 
});

</script> -->
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
                        <a href="../main/main.do"><i class="fa fa-home"></i> ???</a>
                        <span class="active">????????????&??????</span>
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
              <!-- ????????? ??? -->
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    <div class="filter-widget">
                        <h4 class="fw-title">????????????</h4>
                        <ul class="filter-catagories">
                            <li><a href="../shop/shop_list.do">????????????&??????</a></li>
                            <li><a href="../shop/dfood_list.do">????????????</a></li>
                        </ul>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">????????????</h4>
                        <div class="fw-brand-check">
                            <div class="bc-item">
                                <ul class="filter-catagories">
                                	<input type="checkbox" id="min0">
                                    <span class="checkmark"></span>
                                    1?????? ??????
                                </ul>
                            </div>
                            <div class="bc-item">
                                <ul class="filter-catagories">
                                	<input type="checkbox" id="min1">
                                    <span class="checkmark"></span>
                                    1??????-2?????? ??????
                                </ul>
                            </div>
                            <div class="bc-item">
                                <ul class="filter-catagories">
                                	<input type="checkbox" id="min5">
                                    <span class="checkmark"></span>
                                    5??????-10?????? ??????
                                </ul>
                            </div>
                            <div class="bc-item">
                                <ul class="filter-catagories">
                                	<input type="checkbox" id="min10">
                                    <span class="checkmark"></span>
                                    10?????? ??????
                                </ul>
                            </div>
                        </div><br>
                        <a href="#" class="filter-btn">??????</a>
                    </div>
                    <div class="filter-widget row">
                        <h4 class="fw-title">?????? ??? ??????</h4>
                        <div class="fw-brand-check">
                            <div class="bc-item"><!--  vo-for="gvo in goods" -->
                                 <c:forEach var="poster" items="${cList }">
							       <img src="${poster }" width=70px height=70px>&nbsp;&nbsp;&nbsp;
							     </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="product-show-option">
                        <div class="row">
                            <div class="col-lg-7 col-md-7">
                                <div class="select-option" style="weight:30px">
                                    <!-- <select class="sorting">
                                        <option value="">?????????</option>
                                        <option value="">?????????</option>
                                    </select> -->
                                    <!-- <select class="p-show">
                                        <option value="">Show:</option>
                                    </select> -->
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-5 text-right">
                                <!-- <p>Show 01- 09 Of 36 Product</p> -->
                                <p>??? <span id="count" style="color:#648cff">572</span>?????? ??????</p>
                            </div>
                        </div>
                    </div>
                    <div class="product-list">
                        <div class="row"><!-- v-for="gvo in goods" -->
                           <c:forEach var="gvo" items="${list }">
                             <div class="col-lg-4">
                               <div class="product-item" style="width:262.5px;height:410.5px">
                                     <div class="pi-pic" style="width:262.5px;height:262.5px">
                                        <a href="shop_detail_before.do?no=${gvo.no }">
                                           <img src="${gvo.poster }">
                                        </a>
                                        <!-- <div class="sale pp-sale">Sale</div> -->
                                        <div class="icon product_favorite">
                                          <!-- ????????? ?????? -->
                                          <c:choose>
                                            <c:when test="${id!=null }">
	                                          <a href="#" id="goodsJjimUpdate"><!-- ????????????, ????????? -->
	                                            <i class="icon_heart_alt"></i> <!-- ???????????? icon_heart -->
	                                          </a>
	                                        </c:when>
	                                        <c:otherwise><!-- ????????? ?????? -->
	                                          <a href="../member/login.do">
	                                            <i class="icon_heart_alt"></i>
	                                          </a>
	                                        </c:otherwise>
                                          </c:choose>
                                        </div>
                                        <ul class="text-left">
                                          <!-- ??????????????? ?????? -->
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
	                                    <span><fmt:formatNumber value="${gvo.price }"/>&nbsp;???</span>
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
	            <a href="shop_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm">??????</a>
	            ${curpage } page / ${totalpage } pages
	            <a href="shop_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm">??????</a>
	          </td>
            </tr> --%>
	          <tr>
		       <td>
		         <ul class="pagination">
		             <li><a href="shop_list.do?page=${curpage>1?curpage-1:curpage }">??????</a></li>
				         <c:forEach var="i" begin="${startPage }" end="${endPage }">
				           &nbsp;&nbsp;<li><a href="../shop/shop_list.do?page=${i }">${i }</a></li>&nbsp;&nbsp;
				         </c:forEach>
			         <li><a href="shop_list.do?page=${curpage<totalpage?curpage+1:curpage }">??????</a></li>
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