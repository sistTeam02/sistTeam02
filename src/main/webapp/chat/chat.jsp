<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
<style type="text/css">
.wrapper{
	margin: 0px auto;
}
.row1{
	height: 900px;
	border: 1px solid black;
	margin: 0px auto;
	width: 84em;
}
.col-sm-5,.col-sm-7{
	float: left;
	height: 900px;
}
.phone{
	border: 7px solid #000000a8;
    height: 40em;
    margin-top: 4em;
    background-color: #fdf3f4;
    overflow-y: auto;
    overflow-x: hidden;
    border-radius: 21px;
}
.phone-button{
	 background-color: #fdf3f4;
	 height: 8em;
	 border-bottom-left-radius: 22px;
	 border-bottom-right-radius: 22px;
	 border: 7px solid #000000a8;
    border-top-left-radius: 15px;
     border-top-right-radius: 15px;
     border-top-style: hidden;
}
.select{
	 border: 1px solid black;
     height: 40em;
     margin-top: 4em;
}
.phone ul{list-style: none; width: 100%;

}
.phone ul li{width: 100%; display: inline-block;margin: 10px;}
.phone ul li.left { text-align: left; }
.phone ul li.right { text-align: right; }
.message{
	font-size: 18px;
	word-break: break-all;
	border-radius: 10px;
    padding: 4px;
    background-color: wheat;
		}
.box{
	max-width: 60%;
	margin: 3px 17px;
}
#user,div[id^=user_img]{
	float: right;
}
.pBtn{
	      background-color: #fff;
    border: 1px solid #8e8b8be8;
    width: 165px;
    display: inline-block;
    margin-top: 5px;
    border-radius: 50px;
    margin-inline-start: 57px;
}
.pBtn:hover{
	background-color: #e4898903;
}
#pbtn5{
    margin-inline: 11em;
}
#img_span{
	height: 10em;
    width: 10em;
    border: 1px dotted black;
}
th[class^=page]{
	cursor: pointer;
}
table[class^=table]{
	
}
.table2{
	display: none;
	width: 750px;
	height: 26em;
}
.table2 tr td{
	border: 1px solid #0000003b;
	text-align: left;
}
.table2 tr td:hover{
    background-color: #fdf3f46b;
}
.table1{
	float: left;
    width: 370px;
    height: 100px;
}
.table1 tr{
 height: 30px;
}
.table1 tr td{
height: 30px;
}
.timeBtn{
    background-color: rgb(84 91 99 / 14%);
    border: none;
    border-radius: 8px;
    margin: 10px 5px 0px 6px;
}
i[class^=ti-angle]{
cursor: pointer;
}
#calender_tr td{
border: none;
}
#date1,#date8,#date15,#date22,#date29,#date36{
	color: red;
}
td[id^=date]{
	    width: 90px;
}
#pBtn10{
    position: sticky;
    top: 37em;
    left: 10.5em;
    display: none;
}
#calender_tr td:hover{
	background-color: white;
}
.ti-align-left{

    left: 55px;
    font-size: 23px;
    color: #e2d534;
    cursor: pointer;
    }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let today=new Date().toLocaleDateString();
thismonth=0;
thisday=0;
var fileurl="";
let filename="";
let file="";
let id="admin"; /* 임시데이터 ===========================*/
/* 왼쪽제어 */
$(function () {
	/* 나 머먹었어 */
	$('#pBtn1').click(function() {
		$('#pBtn10').hide();
		$('.phone > ul').append(
				"<li class='left'>"+
				"<div class='box' id='bot'>"+
					"<span class='message' id='bot_msg'>음식 저장탭에서 먹은걸 알려주세요</span>"+
				"</div>"+
			"</li>"
		);
		$('.massage').css("background-color", "#FFF");
		
		$('.phone').scrollTop($('.phone')[0].scrollHeight);	/* 스크롤처리 */
	});
	/* 운동저장할래 */
	$('#pBtn2').click(function() {
		$('.phone >ul >li').remove();
		$('.sport_memo_tr_clone').remove();
		$('.sport_memo_input').val('');
		$('#pBtn10').show();
		$('.phone > ul').append(
				"<li class='left'>"+
				"<div class='box' id='bot'>"+
					"<span class='message' id='bot_msg'>여기에 저장해주세요</span>"+
				"</div>"+
			"</li>"
		);
		$('.sport_memo').show();
		$('#sport_memo_date').val(today);
		
		
	});
	/* 운동량추가 */
	let count=1;
	$('.ti-arrow-circle-down').click(function(){
		$('.sport_memo').append(
				"<tr class='sport_memo_tr_clone'>"+	
				"<td>"+
					"<input type='text' size='10' id=sport_memo_name"+count+">"+
				"</td>"+
				"<td>"+
					"<input type='text' size='5' id=sport_memo_number"+count+">"+
				"</td>"+
				"</tr>"
		);
		count++;
	});
	/* 운동량 제거 */
	$('.ti-arrow-circle-up').click(function(){
		$('.sport_memo_tr_clone:last').remove();
	});
	/* 운동저장버튼 */
	$('#pBtn10').click(function() {
		let row=$('#sport_memo_tr').length+$('.sport_memo_tr_clone').length;
		let sportSum="";
		let date=$('#sport_memo_date').val();
		if(date==''){
			$('.phone > ul').append(
					"<li class='left'>"+
					"<div class='box' id='bot'>"+
						"<span class='message' id='bot_msg'>날짜를 입력해주세요</span>"+
					"</div>"+
				"</li>"
			);
			return;
		}
		for(i=0;i<row; i++){
			let temp1=$('#sport_memo_name'+i).val();
			let temp2=$('#sport_memo_number'+i).val();
			if(temp1==''||temp2==''){
				$('.phone > ul').append(
						"<li class='left'>"+
						"<div class='box' id='bot'>"+
							"<span class='message' id='bot_msg'>빈칸을 확인해주세요</span>"+
						"</div>"+
					"</li>"
				);
				return;
			}
			sportSum+=$('#sport_memo_name'+i).val()+$('#sport_memo_number'+i).val()+"^";
		}
		 memo={
			"id":"admin",/* id작업후수정 ======================*/	
			"date":$('#sport_memo_date').val(),
			"time":$('#sport_memo_time').val(),
			"sport":sportSum
		}
		
		$.ajax({
			type:'post',
			data:{'memo':JSON.stringify(memo)},
			url:'../chat/sport_plan.do',
			success: function (result) {
				alert(result);
			},error:function (error) {
				alert("오류");
			}	
		})
	});
	/* 안녕? */
	$('#pBtn3').click(function() {
		$('#pBtn10').hide();
		$('.phone > ul').append(
				"<li class='right'>"+
				"<div class='box' id='user'>"+			
				"<span class='message' id='user_msg'>안녕?</span>"+
				"</div>"+
			"</li>"+
			"<li class='left'>"+
			"<div class='box' id='bot'>"+
				"<span class='message' id='bot_msg'>안녕하세요! 앞으로 잘부탁해요  xx와함께 건강한 다이어트 해봐요</span>"+
			"</div>"+
		"</li>"
		);
	});
	
	
});
/* 오른쪽 제어 */
$(function(){

	let year=2021;
	let month=5;
	thismonth=month;
	
    //드래그앤드랍
    $("#img_span").on("dragenter", function(e){
        e.preventDefault();
        e.stopPropagation();
    }).on("dragover", function(e){
        e.preventDefault();
        e.stopPropagation();
        $(this).css("background-color", "rgb(0 0 0 / 5%)");
    }).on("dragleave", function(e){
        e.preventDefault();
        e.stopPropagation();
        $(this).css("background-color", "#FFF");
    }).on("drop", function(e){
        e.preventDefault();
     file = e.originalEvent.dataTransfer.files;
    if(file!=null&&file!=undefined){
   		filename=file[0].name;
   		
   		
   		fileurl=window.URL.createObjectURL(file[0]);
   		if(file[0].type.includes("image/")){
   			$('#img_span').css("background-image","url("+fileurl+")");
   			$('#img_span').css("background-size","100% 100%");
   		}else{
   			alert("이미지가 아닙니다");
   			return;
   			/*이미지가 아닐때 나중에처리 */
   		}
   	
    }
    
    });
    $('.timeBtn').click(function() {
    	
    	$('.timeBtn').css('background-color','rgb(84 91 99 / 14%)'); 
    	$(this).css("background-color", "#fdf3f4");
    	var time=$(this).attr('value');
    });
	$('#img_dBtn').click(function() {
		$('#img_span').css("background-image","none");
		$('#img_span').css("background-color", "#fff");
	});
	let imgIndex=1;
	$('#img_IBtn').click(function() {/* 이미지전송버튼 */
		$('.phone > ul').append(
				"<li class='right'>"+
				"<div class='box' id=user_img"+imgIndex+">"+
				"</div>"+
			"</li>"
		);
		 $('#user_img'+imgIndex).css("background-image","url("+fileurl+")");
		$('#user_img'+imgIndex).css("background-size","100% 100%");
		$('#user_img'+imgIndex).css("width","10em").css("height", "10em"); 
		imgIndex++;
		$('.phone').scrollTop($('.phone')[0].scrollHeight);
			let fd=new FormData();
			fd.append('file', file[0]);
      $.ajax({
			type:'post',
			url:'../chat/image_upload.do',
			data:fd,
			processData: false,
	        contentType: false,
	        cache: false,
	        enctype:'multipart/form-data',
			success:function(result){
				alert("전송완료")
			},error:function(error){
				alert("파일전송에러")
			} 
			
			
			
		}); 
	});
	$('th[class^=page]').click(function() {
		let classno=$(this).attr("class");
		classno=classno.substr(4, 1);
		$('table[class^=table]').hide();
		$('.table'+classno).show();
	});
	/* 월 감소 */
	  $('.ti-angle-left').click(function() {
		  $('td[id^=date]').text('');
		if(month==1){
			year--;
			month=12;
		}else{
	  		month--;
		}
		let daynum=year*365+(parseInt(year/4)-parseInt(year/100)+parseInt(year/400));
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
		  let strday="";
		  $.ajax({
			  type:'post',
		  	  url:'../chat/chat_dbday.do',
		  	  data:{'month':thismonth,'id':id},
		      async:false,
		  	  success:function(result){
		  		  strday=result;
		  		
		  	  },error:function(error){
		  		  alert("에러");
		  	  }
		  });
		  let arr=strday.split("^");
		  for(i=1;i<=monthArr[month-1];i++){
			 $('#date'+parseInt(i+day)).text(i);
			 for(j=0;j<arr.length;j++){
				 if(arr[j]==i){
					 $('#date'+parseInt(i+day)).append( /* 달력에 아이콘추가 */
							  "&nbsp;&nbsp;<i class='ti-align-left'></i>"	  
					  );
				 }
			 }
		  }
		  
	  });
	/* 월증가 */
	  $('.ti-angle-right').click(function() {
		  $('td[id^=date]').text('');
		 	if(month==12){
		 		year++;
		 		month=1;
		 	}else{
		  		month++;		 		
		 	}
		 	let daynum=year*365+(parseInt(year/4)-parseInt(year/100)+parseInt(year/400));
			
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
			  let strday="";
			  $.ajax({
				  type:'post',
			  	  url:'../chat/chat_dbday.do',
			  	  data:{'month':thismonth,'id':id},
			      async:false,
			  	  success:function(result){
			  		  strday=result;
			  		
			  	  },error:function(error){
			  		  alert("에러");
			  	  }
			  });
			  let arr=strday.split("^");
			  for(i=1;i<=monthArr[month-1];i++){
				 $('#date'+parseInt(i+day)).text(i);
				 for(j=0;j<arr.length;j++){
					 if(arr[j]==i){
						 $('#date'+parseInt(i+day)).append(
								  "&nbsp;&nbsp;<i class='ti-align-left'></i>"	  
						  );
					 }
				 }
			  }
		  });
	let daynum=year*365+(parseInt(year/4)-parseInt(year/100)+parseInt(year/400));
	
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
	  let strday="";
	  $.ajax({
		  type:'post',
	  	  url:'../chat/chat_dbday.do',
	  	  data:{'month':thismonth,'id':id},
	      async:false,
	  	  success:function(result){
	  		  strday=result;
	  		
	  	  },error:function(error){
	  		  alert("에러");
	  	  }
	  });
	  let arr=strday.split("^");
	  for(i=1;i<=monthArr[month-1];i++){
		 $('#date'+parseInt(i+day)).text(i);
		 for(j=0;j<arr.length;j++){
			 if(arr[j]==i){
				 $('#date'+parseInt(i+day)).append(
						  "&nbsp;&nbsp;<i class='ti-align-left'></i>"	  
				  );
			 }
		 }
	  }
	  /* 달력안에 내용클릭 */
	  $('.ti-align-left').click(function() {
		  thisday=$(this).parent().text();
		  $('.phone >ul >li').remove();
		  $('#pBtn10').hide();
		  $('.sport_memo').hide();
		  let date="2021.04.25";/* 임시데이터 클릭한 날짜*/
		  if(thismonth<10&& !thismonth.toString().includes("0")){
			thismonth="0"+thismonth;
			
		  }
		  if(thisday<10&& !thisday.toString().includes("0")){
			  thisday="0"+thisday;
		  }
		  thisday=thisday.trim();
		  $.ajax({
			  type:'post',
				data:{'date':'2021.'+thismonth+'.'+thisday,'id':id},
				url:'../chat/chat_total.do',
				success: function (result) {
					$('.phone > ul').append(
							"<li class='left'>"+
							"<div class='box' id='bot'>"+
								"<span class='message' id='bot_msg'>"+thismonth+"월"+thisday+"일의 기록입니다</span>"+
							"</div>"+
						"</li>"
					);
					alert(result);
					 let json=JSON.parse(result);
					
					 let ptime="";
					let psport="";
					 for(i=0;i<json.length; i++){
						psport=json[i].sport;
						ptime=json[i].time;
						psport=psport.replace(/\^/g, "세트<br>");
						psport=psport.substring(0,psport.lastIndexOf("<"));
						$('.phone > ul').append(
								"<li class='left'>"+
								"<div class='box' id='bot'>"+
									"<span class='message' id='bot_msg'>"+ptime+"</span>"+
								"</div>"+
								"</li>"+
								"<li class='left'>"+
								"<div class='box' id='bot'>"+
									"<span class='message' id='bot_msg'>"+psport+"</span>"+
								"</div>"+
								"</li>"  
						);
					} 
				},error:function (error) {
					alert("오류");
				}	
		  })
	  });
});
</script>
</head>
<body>
	<div class="wrapper">
		<div class="row1">
			<div class="col-sm-5">
				<div class="phone">
					<table class="sport_memo" style="display: none;margin: 90px;">
						<tr>
							<td>
								<input type="text" size="10" id="sport_memo_date" disabled="disabled">
							</td>
							<td>
								<select id="sport_memo_time">
									<option>아침</option>
									<option>점심</option>
									<option>저녁</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>운동</th>
							<th>세트수</th>
						</tr>
						<tr id="sport_memo_tr">	
							<td>
								<input type="text" size="10" class="sport_memo_input" id="sport_memo_name0">
							</td>
							<td>
								<input type="text" size="5" class="sport_memo_input" id="sport_memo_number0">
								<i class="ti-arrow-circle-down" style="cursor: pointer;"></i>
								<i class="ti-arrow-circle-up" style="cursor: pointer;"></i>
							</td>
						</tr>
					</table>
					<ul>  
					<!-- 봇 -->
						<!-- <li class="left">
							<div class="box" id="bot">
								<span class="message" id="bot_msg"></span>
							</div>
						</li> -->
					<!-- 사용자 -->
					
						<!-- <li class="right">
							<div class="box" id="user">			
								<span class="message" id="user_msg"></span>
							</div>
							 <div class="box" id="user_img">
							
							</div> 
						</li> -->		
				
					</ul>
					<button class="pBtn" id="pBtn10" type="button">저장해줘</button>
				</div>
				<div class="phone-button">
					<ul style="list-style: none;">
						<li><button type="button" class="pBtn" id="pBtn1">나 뭐 먹었어</button>
							<button type="button" class="pBtn" id="pBtn2">운동 저장할래</button>
						</li>
						<li><button type="button" class="pBtn" id="pBtn3">안녕</button>
							<button type="button" class="pBtn" id="pBtn4">뭐 먹지</button>
						</li>
						<li><button type="button" class="pBtn" id="pBtn5">몸무게 변경할래</button>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-sm-7">
			  <div class="select">
			  <table class="category_user" style="width: 100%;">
			  	<tr style="border-bottom: 1px solid black;">
			  		<th class="page1">음식저장</th>
			  		<th class="page2">기록</th>
			  		<th class="page3">추천?</th>
			  	</tr>
			  </table>
			  <div class="page_div">
			  	<table class="table1">
			  		<tr>
			  			<td>
			  				<button class="timeBtn" value="1">아침</button>
			  				<button class="timeBtn" value="2">점심</button>
			  				<button class="timeBtn" value="3">저녁</button>
			  				<button class="timeBtn" value="4">간식</button>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td>
			  			<input type="text" size=20>
			  			</td>
			  		</tr>
			  	</table>
			  	<form id="fileForm" name="fileForm" enctype="multipart/form-data" method="post">
			    <table class="table1">
			    	<tr>
			    		<td width="40%">
			    			<div id="img_span" name="image" style="border-radius: 7px;"></div>
			    		</td>
				  		<td>
				  			<input type="button" value="삭제" id="img_dBtn">
				  			<input type="button" value="사진보여주기" id="img_IBtn">
				  			<input type="file"  id="img_fBtn" style="display: none;">
				  		</td>
			  	    </tr>
				</table>
				</form>
				<table class="table1" style="height: 400px;background-color:#ffd47b;" >
					<tr>
						<td>VueJS로 음식출력</td>
					</tr>
					<tr>
						<td>음식출력</td>
					</tr>
				</table>
				<!-- 달력 -->
				<table class="table2" style="height: 1em;">
					<tr id="calender_tr">
						<td style="height: 3em;text-align: right;"><i class="ti-angle-left"></i></td>
						<td style="height: 3em;text-align: center;width: 6em;"id="calender"></td>
						<td style="height: 3em;text-align: left;"><i class="ti-angle-right"></i></td>
					</tr>
				</table>
				<table class="table2">
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
			    </div>
			  </div>
			</div>
		</div>
	</div>
</body>
</html>