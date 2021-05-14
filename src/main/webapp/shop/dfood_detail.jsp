<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type X-UA-Compatible" content="text/html; charset=UTF-8; IE=edge">
<title>Insert title here</title>
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" type="text/css" href="../styles/bootstrap4/bootstrap.min.css"> -->
<link href="../plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="../plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="../plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="../styles/single_styles.css">
<link rel="stylesheet" type="text/css" href="../styles/single_responsive.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

	<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumbs d-flex flex-row align-items-center">
                      <ul>
                        <li><a href="../main/main.do"><i class="fa fa-home"></i> 홈</a></li>
					    <li><a href="../shop/dfood_list.do"><i class="fa fa-angle-right" aria-hidden="true"></i>건강식품</a></li>
					    <li class="active"><i class="fa fa-angle-right" aria-hidden="true"></i>상세페이지</li>
                      </ul>
                    </div>
                </div>
            </div>
        </div>
		
    <!-- Product Shop Section Begin -->
		<div class="row">
		
			<div class="col-lg-6">
				<div class="single_product_pics">
					<div class="row">
					
					    <div class="col-lg-5 thumbnails_col order-lg-1 order-2">
							<!-- <div class="single_product_thumbnails">
								<ul>
									<li><img src="images/single_1_thumb.jpg" alt="" data-image="images/single_1.jpg"></li>
									<li class="active"><img src="images/single_2_thumb.jpg" alt="" data-image="images/single_2.jpg"></li>
									<li><img src="images/single_3_thumb.jpg" alt="" data-image="images/single_3.jpg"></li>
								</ul>
							</div> -->
						</div>
						<div class="col-lg-7 image_col order-lg-2 order-1">
							<div class="single_product_image">
								<div class="single_product_image_background"><img src="${vo.poster }"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		<%-- <c:forEach var="gvo" items="${list }"> --%>
			<div class="col-lg-6">
				<div class="product_details">
					<div class="product_details_title" style="width:580px">
						<h2>${vo.title }</h2>
						<p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>
					</div>
					<div class="free_delivery d-flex flex-row align-items-center justify-content-center" style="width:580px">
						<span class="ti-truck"></span><span>무료배송</span>
					</div>
					<div class="original_price">￦380,000</div>
					<div class="product_price">
					  <span>${vo.price }&nbsp;원</span>
					</div>
					<ul class="star_rating">
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
					</ul>		
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						<span>수량:</span>
						<div class="quantity_selector">
							<span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>
							<span id="quantity_value">1</span>
							<span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
						</div>
						<div class="red_button add_to_cart_button"><a href="#">장바구니</a></div>
						<div class="product_favorite d-flex flex-column align-items-center justify-content-center"></div>
					</div>
				</div>
			</div>
		  <%-- </c:forEach> --%>
		</div>
	</div>
	
	<!-- Tabs -->

	<div class="tabs_section_container">

		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabs_container">
						<ul class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
							<li class="tab active" data-active-tab="tab_1"><span>상세 설명</span></li>
							<!-- <li class="tab" data-active-tab="tab_2"><span>Additional Information</span></li> -->
							<li class="tab" data-active-tab="tab_3"><span>구매 후기(2)</span></li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">

					<!-- Tab Description -->

					<div id="tab_1" class="tab_container active">
						<div class="row">
							<div class="col-lg desc_col">
								<div class="tab_title">
									<h4>상세 설명</h4>
								</div>
								<div class="tab_text_block text-center">
									<h2>${vo.title }</h2>
									<!-- <p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p> -->
								</div>
								<%-- <div class="tab_image">
									<c:choose>
									   <c:when test="${gvo.detail_poster==null }">
									      <li><img src="${gvo.poster }" alt="" data-image="${gvo.poster }"></li>
									   </c:when>
									   <c:when test="${gvo.detail_poster!=null }">
									      <li><img src="${gvo.detail_poster }" alt="" data-image="${gvo.detail_poster }"></li>
									   </c:when>
									</c:choose>
								</div> --%>
								<div class="tab_image">
									<img src="${vo.poster }">
								</div>
							</div>
						</div>
					</div>

					<!-- Tab Reviews -->

					<div id="tab_3" class="tab_container">
						<div class="row">

							<!-- User Reviews -->

							<div class="col-lg-6 reviews_col">
								<div class="tab_title reviews_title">
									<h4>구매 후기</h4>
								</div>

								<!-- User Review -->
								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">2021-05-14</div>
										<div class="user_name">홍길동</div>
										<p>어버이날 선물로 구매했습니다</p>
									</div>
								</div>
								
								<!-- User Review -->
								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">2021-05-12</div>
										<div class="user_name">초롱이</div>
										<p>다이어트 화이팅!!</p>
									</div>
								</div>

							</div>


							<!-- Add Review -->

							<div class="col-lg-6 add_review_col">

								<div class="add_review">
									<form id="review_form" action="post">
										<div>
											<h1>리뷰 작성하기</h1>
											<input id="review_name" class="form_input input_name" type="text" name="name" placeholder="이름*" required="required" data-error="이름을 작성해 주세요.">
											<input id="review_email" class="form_input input_email" type="email" name="email" placeholder="이메일*" required="required" data-error="이메일을 작성해 주세요.">
										</div>
										<div>
											<h1>평점:</h1>
											<ul class="user_star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
											<textarea id="review_message" class="input_review" name="message"  placeholder="리뷰 내용" rows="4" required data-error="리뷰를 작성해 주세요."></textarea>
										</div>
										<div class="text-left text-sm-right">
											<button id="review_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">작성하기</button>
										</div>
									</form>
								</div>

							</div>

						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	
<!-- Product Shop Section End -->
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../styles/bootstrap4/popper.js"></script>
<script src="../styles/bootstrap4/bootstrap.min.js"></script>
<script src="../plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="../plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="../plugins/easing/easing.js"></script>
<script src="../plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="../js/single_custom.js"></script>
</body>
</html>