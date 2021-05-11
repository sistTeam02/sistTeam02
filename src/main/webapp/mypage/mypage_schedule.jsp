<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.table2 {
    margin:auto; 
    border-collapse : collapse;
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
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ //제이쿼리 메인
	let year=2021;
	let month=5;
	make_cal(year,month);//밑에 만든 함수 실행

	$('.ti-angle-left').click(function() {//화살표 클릭
		  $('td[id^=date]').text('');// 달력에 모든 숫자 삭제
	if(month==1){
			year--;
			month=12;
		}else{
			month--;
		}
	make_cal(year,month);
	});
	$('.ti-angle-right').click(function() {//화살표 클릭
		  $('td[id^=date]').text('');
	if(month==12){
		 		year++;
		 		month=1;
		 	}else{
		  		month++;		 		
		 	}
	make_cal(year,month);
	});
	
});

function make_cal(year,month){
	let daynum=year*365+(Math.floor(year/4)-Math.floor(year/100)+Math.floor(year/400));
		
		  let monthArr=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
		  if(year%4==0 && year%100!=0 ||year%400==0){
				monthArr[1]=29;
			}
		  let day=0;
		  for(i=0;i<month-1;i++){
			  day+=monthArr[i];
		  }
		  day=(daynum+day)%7; /* 월요일부터  첫째날 */
		  $('#calender').text(year+'.'+month);
		  thismonth=month;
		  for(i=1;i<=monthArr[month-1];i++){
			 $('#date'+parseInt(i+day)).text(i);
		}
		  $('#calender').text(year+"."+month);
	}
//달력 클릭시 해당 날짜 정보 출력
 $(document).on('click','#dayBtn tr td',function(){
	let day=$(this).text();
	let month=$('#calender').text();
	let date=month+"."+day
	days(date,0);
	days(date,1);
	});

 
 
//달력 월 출력 함수
 function days(date,number){
	let arr=["../mypage/scheduleFood_ok.do","../mypage/schedulePlan_ok.do"]
	$.ajax({
		type:'post',
		data:{"date":date},
		url:arr[number],
		success:function(result){
			alert(result)
		}
		
	})
 } 


</script>
</head>
<body>
  			<div class="col-lg-12">
                <div class="bi-text">
 				<h2 class="title_txt">나만의 계획 세우기</h2>
               		<div style="height:50px"></div>
                       <div class="container">
                      	<h2>채팅 기록 모아보기</h2>
                      
                        <!-- 달력 -->
			<table class="table2" style="height: 1em; width: 79em;">
               <tr id="calender_tr">
                  <td style="height: 3em;text-align: right;"><i class="ti-angle-left"></i></td>
                  <td style="height: 3em;text-align: center;width: 6em;"id="calender"></td>
                  <td style="height: 3em;text-align: left;"><i class="ti-angle-right"></i></td>
               </tr>
            </table>
				<table class="table2" style="width: 79em;height: 36em;" id="dayBtn">
					<tr>
					<c:forEach begin="1" end="7" step="1" varStatus="s">
						<td id="date${s.index }"></td>
					</c:forEach>
					</tr>
					<tr>
					<c:forEach begin="8" end="14" step="1" varStatus="s">
						<td id="date${s.index }"></td>
					</c:forEach>
					</tr>
					<tr>
					<c:forEach begin="15" end="21" step="1" varStatus="s">
						<td id="date${s.index }"></td>
					</c:forEach>
					</tr>
					<tr>
					<c:forEach begin="22" end="28" step="1" varStatus="s">
						<td id="date${s.index }"></td>
					</c:forEach>
					</tr>
					<tr>
					<c:forEach begin="29" end="35" step="1" varStatus="s">
						<td id="date${s.index }"><i></i></td>
					</c:forEach>
					</tr>
						<tr>
					<c:forEach begin="36" end="42" step="1" varStatus="s">
						<td id="date${s.index }"></td>
					</c:forEach>
					</tr>
				</table>  
					<div style="height:50px"></div>
                       <div class="container">
                       <h2>채팅 기록 확인하기</h2>
                       <div style="height:20px"></div>
                       <p>채팅에 등록한 음식 목록을 출력합니다 </p> 
                       <table class="table table-hover">
							    <thead>
							      <tr>
							        <th>등록날짜</th>
							        <th>식사 시간</th>
							        <th>먹은 음식</th>
							        <th>음식 칼로리/용량(g)</th>
							      </tr>
							    </thead>
							    <tbody>
							    <c:forEach var="vo" items="${fList }">
							      <tr>
							        <td>${vo.fooddate }</td>
							        <td>${vo.whenfood }</td>
							        <td>${vo.foodname }</td>
							        <td>${vo.foodkcal}/${vo.foodgram }(g)</td>
							      </tr>
							      </c:forEach>
							    </tbody>
							  </table>
							  <table class="table">
							  	<tr>
							  		<td class="text-center">
							  			<ul class="pagination">
							  				<li><a href="#">&lt;</a></li>
							  				<c:forEach var="i" begin="${startPage }" end="${endPage }">
							  					<li><a href="../mypage/mypage_schedule.do?page=${i }">${i }</a></li>
							  				</c:forEach>
							  					<li><a href="#">&gt;</a>
							  			</ul>
							  		</td>
							  	</tr>
							  </table>
							  
							 
							</div>
							<div style="height:20px"></div>
							 <p>채팅에 기록된 운동을 출력합니다</p> 
							<table class="table table-hover">
							    <thead>
							      <tr>
							        <th>등록날짜</th>
							        <th>운동 시간</th>
							        <th>실천한 운동</th>
							      </tr>
							    </thead>
							     <tbody>
							     <c:forEach var="vo" items="${pList }">
							      <tr>
							        <td>${vo.plandate }</td>
							        <td>${vo.time }</td>
							        <td>${vo.sport }</td>
							      </tr>
							      </c:forEach>
							    </tbody>
							    </table>
							    <table class="table">
							  	<tr>
							  		<td class="text-center">
							  			<ul class="pagination">
							  				<li><a href="#">&lt;</a></li>
							  				<c:forEach var="j" begin="${startPageP }" end="${endPageP }">
							  					<li><a href="../mypage/mypage_schedule.do?pageP=${j }">${j }</a></li>
							  				</c:forEach>
							  					<li><a href="#">&gt;</a>
							  			</ul>
							  		</td>
							  	</tr>
							  </table>
							<div class="container" align="right">
							  <button type="button" class="btn btn-lg btn-default" onclick="location.href='../chat/chat_main.do'">나만의 계획 세우러 가기</button>
							</div>
						</div>
					</div>
				</div>
			

</body>

</html>
                       			
                       			
                       			