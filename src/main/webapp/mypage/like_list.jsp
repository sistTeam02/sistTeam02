<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | Template</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <style type="text/css">
     .table-hover{
     	font-size:large;
     	width:900px;
     }
     </style>
    
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
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i>마이페이지</a>
                        <span>관심목록</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

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
                            <h4>마이페이지</h4>
                            <ul>
                                <li><a href="like_list.jsp">관심목록 </a></li> 
                                <li><a href="buy_list.jsp">구매정보</a></li>
                                <li><a href="schedule.jsp">채팅</a></li>
                                <li><a href="update.jsp">회원정보수정</a></li>
                            </ul>
                        </div>
                        <div class="recent-post">
                            <h4>쿠키 들어갈 자리?</h4>
                            <div class="recent-blog">
                                <a href="#" class="rb-item">
                                    <div class="rb-pic">
                                        <img src="img/blog/recent-1.jpg" alt="">
                                    </div>
                                    <div class="rb-text">
                                        <h6>The Personality Trait That Makes...</h6>
                                        <p>Fashion <span>- May 19, 2019</span></p>
                                    </div>
                                </a>
                                <a href="#" class="rb-item">
                                    <div class="rb-pic">
                                        <img src="img/blog/recent-2.jpg" alt="">
                                    </div>
                                    <div class="rb-text">
                                        <h6>The Personality Trait That Makes...</h6>
                                        <p>Fashion <span>- May 19, 2019</span></p>
                                    </div>
                                </a>
                                <a href="#" class="rb-item">
                                    <div class="rb-pic">
                                        <img src="img/blog/recent-3.jpg" alt="">
                                    </div>
                                    <div class="rb-text">
                                        <h6>The Personality Trait That Makes...</h6>
                                        <p>Fashion <span>- May 19, 2019</span></p>
                                    </div>
                                </a>
                                <a href="#" class="rb-item">
                                    <div class="rb-pic">
                                        <img src="img/blog/recent-4.jpg" alt="">
                                    </div>
                                    <div class="rb-text">
                                        <h6>The Personality Trait That Makes...</h6>
                                        <p>Fashion <span>- May 19, 2019</span></p>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="blog-tags">
                            <h4>실시간 구매 상품</h4>
                            <div class="tag-item">
                                <a href="#">Towel</a>
                                <a href="#">Shoes</a>
                                <a href="#">Coat</a>
                                <a href="#">Dresses</a>
                                <a href="#">Trousers</a>
                                <a href="#">Men's hats</a>
                                <a href="#">Backpack</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                <div class="col-lg-12">
                <div class="bi-text">
               		<%-- <jsp:include page="${mypage_jsp }"></jsp:include> --%>
            	 <h1>관심 목록</h1>
               		<div style="height:50px"></div>
                       <div class="container">
                       <h2>찜한 클래스</h2>
 						<p>찜한 운동 프로그램 목록을 보여줍니다(youtube)</p>            
							  <table class="table table-hover">
							    <thead>
							      <tr>
							        <th>운동이름</th>
							        <th>등록일</th>
							        <th>코치 이름</th>
							      </tr>
							    </thead>
							    <tbody>
							      <tr>
							        <td>전신다이어트 유산소 운동</td>
							        <td>2017-10-13</td>
							        <td>Thankyou BUBU</td>
							      </tr>
							      <tr>
							        <td>맨몸운동 홈트레이닝</td>
							        <td>2019-03-12</td>
							        <td>바벨라토르 홈트레이닝</td>
							      </tr>
							      <tr>
							        <td>3개월 맨몸운동</td>
							        <td>2021-01-30</td>
							        <td>습관의힘제이건</td>
							      </tr>
							    </tbody>
							  </table>
							</div>
							
								<div style="height:50px"></div>
                       <div class="container">
                       <h2>찜한 홈트레이닝</h2>
 						<p>찜한 홈트레이닝 목록을 보여줍니다(hometraining_detail)</p>            
							  <table class="table table-hover">
							    <thead>
							      <tr>
							        <th>운동 부위</th>
							        <th>운동 제목</th>
							        <th>운동 난이도</th>
							        <th>운동 시간</th>
							      </tr>
							    </thead>
							    <tbody>
							      <tr>
							        <td>전신</td>
							        <td>예쁜뒷태 등운동</td>
							        <td>상</td>
							        <td>4분37초</td>
							      </tr>
							      <tr>
							        <td>상체</td>
							        <td>예쁜 상체 만들어주는 [세라밴드 상체 운동법 2탄]</td>
							        <td>중</td>
							        <td>0분51초</td>
							      </tr>
							      <tr>
							        <td>하체</td>
							        <td>틀어진 골반을 위한 [교정 스트레칭 2]</td>
							        <td>중</td>
							        <td>0분13초</td>
							      </tr>
							    </tbody>
							  </table>
							</div>
							
					<div style="height:50px"></div>
                       <div class="container">
                       <h2>찜한 제품</h2>
 						<p>장바구니에 넣은 제품 목록을 보여줍니다(hometraining_detail)</p>            
							  <table class="table table-hover">
							    <thead>
							      <tr>
							        <th>제품 사진</th>
							        <th>제품 이름</th>
							        <th>가격</th>
							      </tr>
							    </thead>
							    <tbody>
							      <tr>
							        <td>${vo.poster}</td>
							        <td>맨몸운동 홈트레이닝 팔굽혀펴기 몸짱 푸쉬업바</td>
							        <td>8490원</td>
							      </tr>
							      <tr>
							        <td>${vo.poster}</td>
							        <td>ab슬라이드 4휠 복근 탄력 운동기구 홈트레이닝</td>
							        <td>16500원</td>
							      </tr>
							      <tr>
							        <td>${vo.poster}</td>
							        <td>다이어트짐볼 55cm 블루 스트레칭도구 홈트레이닝 볼</td>
							        <td>16650원</td>
							      </tr>
							    </tbody>
							  </table>
							</div>
							
							<div style="height:50px"></div>
                       <div class="container">
                       <h2>찜한 식품</h2>
 						<p>장바구니에 넣은 식품 목록을 보여줍니다(dietfood_detail)</p>            
							  <table class="table table-hover">
							    <thead>
							      <tr>
							        <th>제품 사진</th>
							        <th>제품 이름</th>
							        <th>가격</th>
							      </tr>
							    </thead>
							    <tbody>
							      <tr>
							        <td>${vo.poster}</td>
							        <td>2개사면 +2개더/이지퀵다이어트식품/뱃살감량/S라인</td>
							        <td>41,900원</td>
							      </tr>
							      <tr>
							        <td>${vo.poster}</td>
							        <td>한성 실곤약 200g 30개 국수면 두부 고구마말랭이</td>
							        <td>21,450원</td>
							      </tr>
							      <tr>
							        <td>${vo.poster}</td>
							        <td>깔라만씨 원액100% (1L) 1+1+1</td>
							        <td>10,900원</td>
							      </tr>
							    </tbody>
							  </table>
							</div>
							
               		 </div> 
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Partner Logo Section Begin -->
    


    
</body>

</html>
                       			
                       			
                       			