<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fashi | Template</title>
<style type="text/css">
     .table-hover{
     	font-size:large;
     	width:900px;
     	border-bottom : 1px solid #648CFF;
     }
     h2{
     text-decoration: overline #648CFF;
     }
     .title_txt{
	text-decoration:overline #648CFF;
	text-align:center;
	font-weight: bold;
}
     </style>
</head>
<body>
  			<div class="col-lg-12">
                <div class="bi-text">
 				<h2 class="title_txt">관심 목록</h2>
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
							<div class="container" align="right">
							  <button type="button" class="btn btn-lg btn-default" onclick="location.href='#'">다른 운동 보러 가기</button>
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
							<div class="container" align="right">
							  <button type="button" class="btn btn-lg btn-default" onclick="location.href='#'">다른 운동 하러 가기</button>
							</div>
							
					<div style="height:50px"></div>
                       <div class="container">
                       <h2>찜한 제품</h2>
 						<p>장바구니에 넣은 제품 목록을 보여줍니다(goods_detail)</p>            
							  <table class="table table-hover">
							    <thead>
							      <tr>
							        <th>제품 사진</th>
							        <th>제품 이름</th>
							        <th>가격</th>
							      </tr>
							    </thead>
							    <tbody>
							      <c:forEach var="gvo" items="${list }">
							      <tr>
							        <td>${gvo.poster}</td>
							        <td>${gvo.title }</td>
							        <td><fmt:formatNumber value="${gvo.price }"/>&nbsp;원</td>
							      </tr>
<%-- 							      <tr>
							        <td>${vo.poster}</td>
							        <td>ab슬라이드 4휠 복근 탄력 운동기구 홈트레이닝</td>
							        <td>16500원</td>
							      </tr>
							      <tr>
							        <td>${vo.poster}</td>
							        <td>다이어트짐볼 55cm 블루 스트레칭도구 홈트레이닝 볼</td>
							        <td>16650원</td>
							      </tr> --%>
							      </c:forEach>
							    </tbody>
							  </table>
							</div>
							<div class="container" align="right">
							  <button type="button" class="btn btn-lg btn-default" onclick="location.href='#'">지금 제품 구매하러 가기</button>
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
							<div class="container" align="right">
							  <button type="button" class="btn btn-lg btn-default" onclick="location.href='#'">지금 제품 구매하러 가기</button>
							</div>
						</div>
					</div>
					

</body>

</html>
                       			
                       			
                       			