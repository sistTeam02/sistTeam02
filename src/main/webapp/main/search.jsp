<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
h4{
	color: darkgray;
}
a{
	color: black;
}
a:hover{
	color: black;
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
                        <span>'${search }' 의 검색 결과</span>
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
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    <div class="filter-widget">
                        <h4 class="fw-title">검색 카테고리</h4>
                        <ul class="filter-catagories">
                        	<li><a href="../main/search.do?no=0&search=${search }">카테고리 전체</a></li>
                            <li><a href="../main/search_category.do?no=1&search=${search }">무료 홈 트레이닝</a></li>
                            <li><a href="../main/search_category.do?no=4&search=${search }">유튜브 홈 트레이닝</a></li>
                            <li><a href="../main/search_category.do?no=3&search=${search }">운동 기구/용품</a></li>
                            <li><a href="../main/search_category.do?no=2&search=${search }">건강 식품</a></li>
                        </ul>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">검색 순위</h4>
                        <div class="fw-brand-check">
                        	<table class=table>
                        	<c:forEach var="ke" items="${klist }" varStatus="s">
	                            <tr>
	                            	<th width="20%">${s.count }</th>
	                            	<td width="80%"><a href="../main/search.do?no=0&search=${ke.keyword }">${ke.keyword }</a></td>
	                            </tr>
                            </c:forEach>
                            </table>
                        </div>
                    </div>

                </div>
                <div class="col-lg-9 order-1 order-lg-2">

                    
                    	 <div class="height:50px"></div>
                    <hr>
                    <div class="product-list">
         				<h4>무료 홈 트레이닝 검색 결과</h4>
         				<div style="height:30px"></div>
                        <div class="row">
                        	<c:forEach var="hvo" items="${hlist }">
	                            <div class="col-lg-4 col-sm-6">
	                                <div class="product-item">
	                                    <div class="pi-pic">
	                                        <img src="${hvo.poster }" alt="">
	                                    </div>
	                                    <div class="pi-text">
	                                        <div class="catagory-name">무료</div>
	                                        <a href="#">
	                                            <h5>${hvo.title }</h5>
	                                        </a>
	                                    </div>
	                                </div>
	                            </div>
							</c:forEach>
                        </div>
                    </div>
                    <c:if test="${!empty hlist}">
	                    <div class="loading-more">
	                        <i class="icon_loading"></i>
	                        <a href="../main/search_category.do?no=1&search=${search }">
	                           		무료 홈 트레이닝 더 보기
	                        </a>
	                    </div>
                    </c:if>
                    <c:if test="${empty hlist }">
                   		<div style="height:50px"></div>
                    	<h5 style="text-align: center">검색 결과가 없습니다.</h5>
                    	<div style="height:50px"></div>
                    </c:if>
                    
                     	 <div class="height:50px"></div>
                    <hr>
                    <div class="product-list">
         				<h4>유튜브 홈 트레이닝 검색 결과</h4>
         				<div style="height:30px"></div>
                        <div class="row">
                        	<c:forEach var="yvo" items="${ylist }">
	                            <div class="col-lg-4 col-sm-6">
	                                <div class="product-item">
	                                	<a href="../youtube/you_detail.do?no=${yvo.no }">
	                                    <div class="pi-pic">
	                                        <img src="${yvo.thumbnails }" alt="">
	                                    </div>
	                                    </a>
	                                    <div class="pi-text">
	                                        <div class="catagory-name">유튜브</div>
	                                        <a href="../youtube/you_detail.do?no=${yvo.no }">
	                                            <h5>${yvo.title }</h5>
	                                        </a>
	                                    </div>
	                                </div>
	                            </div>
							</c:forEach>
                        </div>
                    </div>
                    <c:if test="${!empty ylist}">
	                    <div class="loading-more">
	                        <i class="icon_loading"></i>
	                        <a href="../main/search_category.do?no=4&search=${search }">
	                           		유튜브 홈 트레이닝 더 보기
	                        </a>
	                    </div>
                    </c:if>
                    <c:if test="${empty ylist }">
                   		<div style="height:50px"></div>
                    	<h5 style="text-align: center">검색 결과가 없습니다.</h5>
                    	<div style="height:50px"></div>
                    </c:if>
                    
                    <div class="height:50px"></div>
                    <hr>
                    <div class="product-list">
         				<h4>운동 기구/용품 검색 결과</h4>
         				<div style="height:30px"></div>
                        <div class="row">
                        	<c:forEach var="gvo" items="${glist }">
	                            <div class="col-lg-4 col-sm-6">
	                                <div class="product-item">
	                                	<a href="../shop/shop_detail_before.do?no=${gvo.no }">
		                                    <div class="pi-pic">
		                                        <img src="${gvo.poster }" alt="">
		                                    </div>
	                                    </a>
	                                    <div class="pi-text">
	                                        <div class="catagory-name">운동 기구/용품</div>
	                                        <a href="../shop/shop_detail_before.do?no=${gvo.no }">
	                                            <h5>${gvo.title }</h5>
	                                        </a>
	                                        <div class="product-price">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${gvo.price}" />&nbsp;원
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
							</c:forEach>
                        </div>
                    </div>
                    <c:if test="${!empty glist}">
	                    <div class="loading-more">
	                        <i class="icon_loading"></i>
	                        <a href="../main/search_category.do?no=3&search=${search }">
	                           		 운동 기구/용품 더 보기
	                        </a>
	                    </div>
                    </c:if>
                    <c:if test="${empty glist }">
                   		<div style="height:50px"></div>
                    	<h5 style="text-align: center">검색 결과가 없습니다.</h5>
                    	<div style="height:50px"></div>
                    </c:if>
                    <div class="height:50px"></div>
                    <hr>
                    <div class="product-list">
                    	<h4>건강 식품 검색 결과</h4>
                    	<div style="height:30px"></div>
                        <div class="row">
                        	<c:forEach var="dvo" items="${dlist }">
	                            <div class="col-lg-4 col-sm-6">
	                                <div class="product-item">
	                                	<a href="../shop/dfood_detail.do?no=${dvo.no }">
	                                    <div class="pi-pic">
	                                        <img src="${dvo.poster }" alt="">
	                                    </div>
	                                    </a>
	                                    <div class="pi-text">
	                                        <div class="catagory-name">건강 식품</div>
	                                        <a href="../shop/dfood_detail.do?no=${dvo.no }">
	                                            <h5>${dvo.title }</h5>
	                                        </a>
	                                        <div class="product-price">
	                                            ${dvo.price }원
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
							</c:forEach>
                        </div>
                    </div>
                    <c:if test="${!empty dlist }">
	                    <div class="loading-more">
	                        <i class="icon_loading"></i>
	                        <a href="../main/search_category.do?no=2&search=${search }">
	                          	  건강 식품 더 보기
	                        </a>
	                    </div>
                    </c:if>
                    <c:if test="${empty dlist }">
                    	<div style="height:50px"></div>
                    	<h5 style="text-align: center">검색 결과가 없습니다.</h5>
                    	<div style="height:50px"></div>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->
</body>
</html>