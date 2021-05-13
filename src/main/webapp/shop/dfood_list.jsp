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

</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="../main/main.do"><i class="fa fa-home"></i> Home</a>
                        <span>Shop</span>
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
                        <h4 class="fw-title">가격대</h4>
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
                            <div class="bc-item"><!--  vo-for="gvo in goods" -->
                               <%-- <c:forEach var="poster" items="${gvo.list }"> --%>
                                  <img :src="vo.poster" width=100px height=100px>
                               <%-- </c:forEach> --%>
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
                                <%-- <p>총 <span id="count" style="color:#648cff">${vo.count }</span>개의 상품</p> --%>
                            </div>
                        </div>
                    </div>
                    <div class="product-list">
                        <div class="row">
                           <c:forEach var="vo" items="${list }">
                               <div class="col-lg-4">
                                  <a href="dfood_detail.do?no=${vo.no }">
                                     <img src="${vo.poster }">
                                        <div class="pi-text text-center">
	                                       <p>${vo.title }</p>
	                                    </div>
	                              </a>
	                              <div class="product-price text-center" style="font-size:13pt;font-weight:bold;color:#648cff;height:55px">
	                                  <span>${vo.price }&nbsp;원</span>
	                              </div>
                               </div>
                            </c:forEach>    
                         </div>
                     </div>
             </div>
         </div>
         <!-- <div class="loading-more" style="height:30px">
             <i class="icon_loading"></i>
                  <a href="#">
                       Loading More
                  </a>
          </div> -->
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
</body>
</html>