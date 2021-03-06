<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="assets/styles/index.css">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
    
    <!-- Js Plugins -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.countdown.min.js"></script>
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/jquery.zoom.min.js"></script>
    <script src="../js/jquery.dd.min.js"></script>
    <script src="../js/jquery.slicknav.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/main.js"></script>
</head>
<body>
<jsp:include page="mypage_breadcurmb.jsp"/>
	<!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
                    <div class="blog-sidebar">
                        <!-- <div class="search-form">
                            <h4>Search</h4>
                            <form action="#">
                                <input type="text" placeholder="Search . . .  ">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div> -->
                        <div class="blog-catagory">
                            <h4>???????????????</h4>
                            <ul>
                                 <li><a href="like_list.do">??????&????????? ???????????? </a></li> 
                                <li><a href="buy_list.do">???????????? ?????? ??????</a></li>
                                <li><a href="mypage_schedule.do">????????? ??????</a></li>
                                <li><a href="mypage_update.do">???????????? ??????</a></li>
                            </ul>
                        </div>
                        <div class="recent-post">
                            <h4>????????????</h4>
                            <div class="recent-blog">
                                <a href="#" class="rb-item">
                                    <div class="rb-pic">
                                        <img src="../img/shop_001.jpg">
                                    </div>
                                    <div class="rb-text">
                                        <h6>??????????????? ???????????? ????????????</h6>
                                        <p>???????????? <span>80,600???</span></p>
                                    </div>
                                </a>
                               
                            </div>
                        </div>
                        <div class="blog-tags">
                            <h4>????????? ?????? ??????</h4>
                            <div class="tag-item">
                                <a href="#">???????????????</a>
                                <a href="#">?????????</a>
                                <a href="#">?????????</a>
                                <a href="#">???????????????????????????</a>
                                <a href="#">???????????? ??????100%</a>
                                <a href="#">????????????</a>
                                <a href="#">??????????????????</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                <!-- ??????????????? ?????? ?????? -->
            	 <jsp:include page="${mypage_jsp }"/>
            	 
                </div>
            </div>
        </div>
    </section>
</body>
</html>