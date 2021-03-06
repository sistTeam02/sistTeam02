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
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="Fashi, unica, creative, html">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
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

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <!-- <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css"> -->
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	let pno=${gvo.no};
	$.ajax({
		type:'POST',
		url:'shop_detail_ok.do',
		data:{'pno':pno},
		success:function(result)
		{
			$('#reply_data').html(result);
		}
	});
});
</script>
</head>
<body>

	<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumbs d-flex flex-row align-items-center">
                      <ul>
                        <li><a href="../main/main.do"><i class="fa fa-home"></i>Home</a></li>
					    <li><a href="../shop/shop_list.do"><i class="fa fa-angle-right" aria-hidden="true"></i>??????</a></li>
					    <li class="active"><i class="fa fa-angle-right" aria-hidden="true"></i>???????????????</li>
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
								<div class="single_product_image_background"><img src="${gvo.poster }"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		<%-- <c:forEach var="gvo" items="${list }"> --%>
			<div class="col-lg-6">
				<div class="product_details">
				  <form name="add" method="post" action="../shop/basket_insert.do">
					<div class="product_details_title" style="width:580px">
						<h2>${gvo.title }</h2>
						<p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>
					</div>
					<div class="free_delivery d-flex flex-row align-items-center justify-content-center" style="width:580px">
						<span class="ti-truck"></span><span>????????????</span>
					</div>
					<div class="original_price">$629.99</div>
					<div class="product_price">
					  <fmt:formatNumber value="${gvo.price }"/>???
					</div>
					<ul class="star_rating">
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
					</ul>
					<!-- <div class="product_color">
						<span>Select Color:</span>
						<ul>
							<li style="background: #e54e5d"></li>
							<li style="background: #252525"></li>
							<li style="background: #60b3f3"></li>
						</ul>
					</div> -->
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
					  <tr>
						<span>??????:</span>
						<div class="quantity_selector">
							<span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>
							<span id="quantity_value">1</span>
							  <%-- <td id="quantity_value">
							    <c:if test="${vo.stock==Y }">
							      <select name="">
							        <c:forEach var="i" begin="1" end="10">
							          <option>${i }</option>
							        </c:forEach>
							      </select>
							    </c:if>
							    <c:if test="${vo.stock==N }">
							      <span>?????? ??????</span>
							    </c:if>
							  </td> --%>
							<span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
						</div>
					  </tr>
			
					  <input type="hidden" name="pno" value="${gvo.no }">
					  <input type="hidden" name="price" value="${gvo.price }">
					  <input type="hidden" name="poster" value="${gvo.poster }">
					  <input type="hidden" name="title" value="${gvo.title }">
					  <c:if test="${sessionScope.id!=null }">
					    <input type="submit" class="red_button add_to_cart_button" value="??????????????? ??????" style="color:white;border:none">
								<!-- <div class="red_button add_to_cart_button">
								    <a href="../shop/user_basket.do">??????????????? ??????</a>
								    <span style="color:white">??????????????? ??????</span>
								</div> -->
					  </c:if>
						
						<div class="product_favorite d-flex flex-column align-items-center justify-content-center"></div>
					  </form>
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
							<li class="tab active" data-active-tab="tab_1"><span>?????? ??????</span></li>
							<!-- <li class="tab" data-active-tab="tab_2"><span>Additional Information</span></li> -->
							<li class="tab" data-active-tab="tab_3"><span>?????? ??????</span></li><!-- ?????? ?????? (2) -->
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
									<h4>?????? ??????</h4>
								</div>
								<div class="tab_text_block text-center">
									<h2>${gvo.title }</h2>
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
									<img src="${gvo.poster }">
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
									<h4>?????? ??????</h4>
								</div>

								<!-- User Review -->
								<!-- ?????? ?????? s -->
								<%-- <div class="user_review_container d-flex flex-column flex-sm-row">
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
									<c:forEach var="svo" items="${rList }">
										<li>
											<div class="review">
												<div class="review_date">${svo.dbday }</div>
												<div class="user_name">${svo.name }</div>
												<p>${svo.msg }</p>
											</div>
										</li>
									</c:forEach>
								</div> --%>
								<!-- ?????? ?????? e -->
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
										<div class="review_date">2021-05-13</div>
										<div class="user_name">?????????</div>
										<p>????????? ???????????? ?????????!</p>
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
										<div class="review_date">2021-05-14</div>
										<div class="user_name">?????????</div>
										<p>??? ?????????</p>
									</div>
								</div>
							</div>


							<!-- Add Review -->

							<div class="col-lg-6 add_review_col">

								<div class="add_review">
									<form id="review_form" action="../shop/shop_reply_ok.do" method="post">
										<div>
											<h1>?????? ????????????</h1>
											<input id="review_name" class="form_input input_name" type="text" name="name" placeholder="??????*" required="required" data-error="????????? ????????? ?????????.">
											<input id="review_email" class="form_input input_email" type="email" name="email" placeholder="?????????*" required="required" data-error="???????????? ????????? ?????????.">
										</div>
										<div>
											<h1>??????:</h1>
											<ul class="user_star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
											<textarea id="review_message" class="input_review" name="message" placeholder="?????? ??????" rows="4" required data-error="????????? ????????? ?????????."></textarea>
										</div>
										<div class="text-left text-sm-right">
											<input type="hidden" name="pno" value="${gvo.no }">
											<button id="review_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">????????????</button>
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

<!-- <script src="../js/bootstrap.min.js"></script> -->
<script src="../js/jquery-ui.min.js"></script>
<!-- <script src="../js/jquery.countdown.min.js"></script> -->
<script src="../js/jquery.nice-select.min.js"></script>
<script src="../js/jquery.zoom.min.js"></script>
<script src="../js/jquery.dd.min.js"></script>
<script src="../js/jquery.slicknav.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/main.js"></script>
</body>
</html>