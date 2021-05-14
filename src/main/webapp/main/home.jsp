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
   

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg" data-setbg="../img/hero-4.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7">
                            <h1 style="font-weight: 100">
                            	<span class="boo">내방</span>에서 <span class="boo">스마트</span>하게 <span class="boo">홈트레이닝</span>하자!
                            </h1>
                            &nbsp;
                            <a href="../home_training/ht_main.do" class="primary-btn">바로가기</a>
                        </div>
                    </div>
                   <!--  <div class="off-card">
                        <h2>Sale <span>50%</span></h2>
                    </div> -->
                </div>
            </div>
            <div class="single-hero-items set-bg" data-setbg="../img/hero-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7">
                            <span>아이들과 함께</span>
                            <h1>산책하기 좋은 날</h1>
                            <p>전국에 있는 산책로 핫플레이스를 선정하여 추천해드립니다</p>
                            <a href="../walk/walk.do" class="primary-btn">산책로 맵 바로가기</a>
                        </div>
                    </div>
                  <!--   <div class="off-card">
                        <h2>Sale <span>50%</span></h2>
                    </div> -->
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Banner Section Begin -->
    <div class="banner-section spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="../img/bvb.png" style="width: 570px; height: 320px" alt="">
                        <div class="inner-text">
                            <a href="../shop/shop_list.do"><h4>운동 기구&용품</h4></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="../img/training.PNG" style="width: 570px; height: 320px" alt="">
                        <div class="inner-text">
                              <a href="../youtube/you_list.do"><h4>홈트 영상</h4></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="../img/dietff.PNG" style="width: 570px; height: 320px" alt="">
                        <div class="inner-text">
                            <a href="../shop/dfood_list.do"><h4>다이어트&건강 식품</h4></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Section En d ---->

    <!-- Women Banner Section Begin -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="product-large set-bg" data-setbg="../img/products/walklike.jpg">
                        <h2>전국 추천 산책로</h2>
                        <a href="../walk/walk.do">#산책길 #함께걸어요</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="filter-control">
                        <ul>
                            <li class="active">마음에 드는 산책로를 찾아보세요</li>
                            <!-- <li>HandBag</li>
                            <li>Shoes</li>
                            <li>Accessories</li> -->
                        </ul>
                    </div>
                    <div class="product-slider owl-carousel">
                      
                      	<c:forEach var="vo" items="${list }">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="../walk/walk.do">
                                <img src="${vo.poster }" value="${vo.no }">
                                </a>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                              <!--   <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                    <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                </ul> -->
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">WALK</div>
                                <a href="../walk/walk.do">
                                    <h5>${vo.title }</h5>
                                </a>
                                <!-- <div class="product-price">
                                    $13.00
                                </div> -->
                            </div>
                        </div>
                        </c:forEach>
                       
                       
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Women Banner Section End -->

    <!-- Deal Of The Week Section Begin-->
    <!-- <section class="deal-of-week set-bg spad" data-setbg="../img/maaa.png">
        <div class="container" >
            <div class="col-lg-6 text-center">
                <div class="section-title">
                    <h2>수강 기간 할인권</h2>
                    <p>홈트계 끝판왕 힙으뜸의 필라테스 트레이닝</p>
                    <div class="product-price">
                    	홈트계 끝판왕 힙으뜸의 필라테스 트레이닝
                        <span>바로가기</span>
                    </div>
                </div>
                <div class="countdown-timer" id="countdown">
                    <div class="cd-item">
                        <span>2</span>
                        <p>Days</p>
                    </div>
                    <div class="cd-item">
                        <span>08</span>
                        <p>Hrs</p>
                    </div>
                    <div class="cd-item">
                        <span>40</span>
                        <p>Mins</p>
                    </div>
                    <div class="cd-item">
                        <span>52</span>
                        <p>Secs</p>
                    </div>
                </div>
                <a href="#" class="primary-btn">자세히</a>
            </div>
        </div>
    </section> -->
    <!-- Deal Of The Week Section End -->

    <!-- Man Banner Section Begin -->
    <section class="man-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <div class="filter-control">
                        <ul>
                            <li class="active">운동용품</li>
                            <li>건강식품</li>
                        </ul>
                    </div>
                    <div class="product-slider owl-carousel">
                        
                           <c:forEach var="gvo" items="${goodslist }">
                        <div class="product-list">
                            <div class="pi-pic">
                             <a href="../shop/shop_detail.do?no=${gvo.no }">
                                <img src="${gvo.poster }" alt="">
                                </a>
                            </div>
                            <div class="pi-text">
                               
                                <a href="../shop/shop_detail.do?no=${gvo.no }">
                                    <h5>${gvo.title }</h5>
                                </a>
                                <div class="product-price">
                                    ${gvo.price }
                                </div>
                            </div>
                         </div>
                            </c:forEach>
				      </div>
                   </div>
                    <div class="col-lg-3 offset-lg-1">
                    <div class="product-large set-bg m-large" data-setbg="../img/shop_poster.jpg">
                        <h2>운동용품</h2>
                        <a href="../shop/shop_list.do">더보기</a>
                    </div>
               		 </div>
                </div>
               
            </div>
        </div>
    </section>
    <!-- Man Banner Section End -->

 <%--    <!-- Instagram Section Begin -->
    <div class="instagram-photo">
    	<c:forEach var="fvo" items="${foodlist }">
        <div class="insta-item set-bg" data-setbg="${fvo.poster }">
            <div class="inside-text">
                <h5><a href="../shop/dfood_detail.do?no=${fvo.no }">${fvo.title }</a></h5>
            </div>
        </div>
        </c:forEach>
 
    </div>
    <!-- Instagram Section End --> --%>

    <!-- Latest Blog Section Begin -->
    <section class="latest-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>이번달 추천 건강식품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach var="fvo" items="${foodlist }">
                <div class="col-lg-2 col-md-6">
                    <div class="single-latest-blog">
                        <img src="${fvo.poster }" alt="">
                        <div class="latest-text">
                            <a href="../shop/dfood_detail.do?no=${fvo.no }">
                                <sub>${fvo.title }</sub>
                            </a>
                        </div>
                    </div>
                </div>
                </c:forEach>

            </div>
          <!--   <div class="benefit-items">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="../img/icon-1.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>Free Shipping</h6>
                                <p>For all order over 99$</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="../img/icon-2.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>Delivery On Time</h6>
                                <p>If good have prolems</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="../img/icon-1.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>Secure Payment</h6>
                                <p>100% secure payment</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->
        </div>
    </section>
    <!-- Latest Blog Section End -->

    <!-- Partner Logo Section Begin -->
    <div class="partner-logo">
        <div class="container">
            <div class="logo-carousel owl-carousel">
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="../img/logo-carousel/logo-1.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="../img/logo-carousel/logo-2.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="../img/logo-carousel/logo-3.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="../img/logo-carousel/logo-4.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="../img/logo-carousel/logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Logo Section End -->
</body>
</html>