<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
	 <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="header-top">
            <div class="container">
                <div class="ht-left">
                  
                </div>
                <div class="ht-right">
                         <a href="../member/login.do" class="login-panel"><i class="fa fa-user"></i>Login</a>
                         <a href="../member/register.do" class="login-panel"><i class="fa fa-user"></i>Sign Up</a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="../main/main.do">
                                <img src="../img/logo.png">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <button type="button" class="category-btn">All Categories</button>
                            <div class="input-group">
                                <input type="text" placeholder="What do you need?">
                                <button type="button"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                            <li class="heart-icon">
                                <a href="#">
                                    <i class="icon_heart_alt"></i>
                                    <span>1</span>
                                </a>
                            </li>
                            <li class="cart-icon">
                                <a href="#">
                                    <i class="icon_bag_alt"></i>
                                    <span>3</span>
                                </a>
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="si-pic"><img src="../img/select-product-1.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>$60.00 x 1</p>
                                                            <h6>Kabino Bedside Table</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="si-pic"><img src="../img/select-product-2.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>$60.00 x 1</p>
                                                            <h6>Kabino Bedside Table</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="select-total">
                                        <span>total:</span>
                                        <h5>$120.00</h5>
                                    </div>
                                    <div class="select-button">
                                        <a href="#" class="primary-btn view-card">VIEW CARD</a>
                                        <a href="#" class="primary-btn checkout-btn">CHECK OUT</a>
                                    </div>
                                </div>
                            </li>
                            <li class="cart-price">User01님</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>쇼핑몰</span>
                        <ul class="depart-hover">
                            <li class="active"><a href="../shop/shop_list.do">운동 기구 & 용품</a></li>
                            <li><a href="#">다이어트 & 건강 식품</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
						<li class="active"><a href="../main/main.do">Home</a></li>
						<li><a href="#">홈트레이닝</a>
                            <ul class="dropdown">
                                <li><a href="#">홈트레이닝 목록</a></li>
                                <li><a href="#">수강후기 게시판</a></li>
                            </ul>
                        </li>
                        <li><a href="#">커뮤니티</a>
                            <ul class="dropdown">
                                <li><a href="../board/freeboard_list.do">자유게시판(운동팁 공유)</a></li>
                                <li><a href="#">고객문의 게시판</a></li>
                                <li><a href="#">공지사항</a></li>
                            </ul>
                        </li>
                        <li><a href="../walk/walk.do">산책로</a>
                            <ul class="dropdown">
                                <li><a href="../walk/walk.do">산책로 추천맵</a></li>
                            </ul>
                        </li>
					<li><a href="../chat/chat_main.do">채팅</a></li>
                        <li><a href="../mypage/like_list.do">마이페이지</a>
                            <ul class="dropdown">
                                <li><a href="../mypage/like_list.do">운동&쇼핑몰 찜리스트</a></li>
                                <li><a href="../mypage/buy_list.do">프로그램 신청 내역</a></li>
                                <li><a href="../mypage/mypage_schedule.do">나만의 계획</a></li>
                                <li><a href="../mypage/mypage_update.do">회원정보 수정</a></li>
                            </ul>
                        </li>
                        <li><a href="#">쇼핑</a>
                            <ul class="dropdown">
                                <li><a href="./blog-details.html">장바구니</a></li>
                                <li><a href="./shopping-cart.html">주문확인</a></li>
                                <li><a href="../main/admin.do">관리자 임시페이지</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->
</body>
</html>