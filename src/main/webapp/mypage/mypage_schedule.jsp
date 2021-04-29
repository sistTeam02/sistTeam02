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
}
.table2 {
    margin:auto; 
}

.table2{
    border-collapse : collapse;
    border-bottom : 1px solid #648CFF;
};
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ //제이쿼리 메인
	let year=2021;
	let month=5;
	make_cal(year,month);//밑에 만든 함수 실행

	$('.ti-angle-right').click(function() {//화살표 클릭
		  $('td[id^=date]').text('');// 달력에 모든 숫자 삭제
	if(month==1){
			year--;
			month=12;
		}else{
			month--;
		}
	make_cal(year,month);
	});
	$('.ti-angle-left').click(function() {//화살표 클릭
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


</script>
</head>
<body>
  			<div class="col-lg-12">
                <div class="bi-text">
 				<h2>나만의 계획 세우기</h2>
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
				<table class="table2" style="width: 79em;height: 36em;">
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
                       <p>채팅에 기록된 내용을 출력합니다</p> 
                       <table class="table table-hover">
							    <thead>
							      <tr>
							        <th>등록날짜</th>
							        <th>식사 시간</th>
							        <th>먹은 음식</th>
							        <th>음식 칼로리/용량(g)</th>
							        <th>운동 시간</th>
							        <th>운동 종류</th>
							      </tr>
							    </thead>
							    <tbody>
							      <tr>
							        <td>전신</td>
							        <td>예쁜뒷태 등운동</td>
							        <td>상</td>
							        <td>4분37초</td>
							        <td>4분37초</td>
							        <td>4분37초</td>
							      </tr>
							      <tr>
							        <td>상체</td>
							        <td>예쁜 상체 만들어주는 [세라밴드 상체 운동법 2탄]</td>
							        <td>중</td>
							        <td>0분51초</td>
							        <td>4분37초</td>
							        <td>4분37초</td>
							      </tr>
							      <tr>
							        <td>하체</td>
							        <td>틀어진 골반을 위한 [교정 스트레칭 2]</td>
							        <td>중</td>
							        <td>0분13초</td>
							        <td>4분37초</td>
							        <td>4분37초</td>
							      </tr>
							    </tbody>
							  </table>
							</div>
							<div class="container" align="right">
							  <button type="button" class="btn btn-lg btn-default" onclick="location.href='../chat/chat_main.do'">나만의 계획 새우러 가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>

</body>

</html>
                       			
                       			
                       			