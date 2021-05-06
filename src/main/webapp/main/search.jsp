<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="../main/main.do"><i class="fa fa-home"></i> Home</a>
                        <span>'${search }'의 전체 검색 결과</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
        	<h4 style="color: gray">홈 트레이닝 검색 결과</h4>
        	<div style="height:20px"></div>
            <div class="row" style="height:100px">
                    
            </div>

        	<h4 style="color: gray">운동 기구 & 용품 검색 결과</h4>
        	<div style="height:20px"></div>
            <div class="row">
                    <div class="product-list">
                        <div class="row">
                           <c:forEach var="vo" items="${glist }">
                               <div class="col-lg-3">
                                  <a href="shop_detail.do?no=${vo.no }">
                                     <img src="${vo.poster }">
                                        <div class="pi-text text-center">
	                                       <p>${vo.title }</p>
	                                    </div>
	                              </a>
	                              <div class="product-price text-center" style="font-size:13pt;font-weight:bold;color:#648cff;height:55px">
	                                  <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price}" />&nbsp;원</span>
	                              </div>
                               </div>
                            </c:forEach>    
                         </div>
                     </div>
             </div>
             <div style="height:20px"></div>
             <div class="loading-more" style="height:30px">
             <i class="icon_loading"></i>
                  <a href="../main/search_category.do?no=3&search=${search }">
                      	 더 보기
                  </a>
          	</div>
              <div style="height:60px"></div>
             <h4 style="color: gray">건강 식품 검색 결과</h4>
             <div style="height:20px"></div>
             <div class="row">
                    <div class="product-list">
                        <div class="row">
                           <c:forEach var="vo" items="${dlist }">
                               <div class="col-lg-3">
                                  <a href="shop_detail.do?no=${vo.no }">
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
             <div style="height:20px"></div>
             <div class="loading-more" style="height:30px">
             <i class="icon_loading"></i>
                  <a href="../main/search_category.do?no=2&search=${search }">
                      	 더 보기
                  </a>
          </div>
         </div>
         
      </div>
    </section>
    <!-- Product Shop Section End -->
</body>
</html>