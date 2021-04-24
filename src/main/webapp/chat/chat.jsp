<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 border: 1px solid black;
     height: 40em;
     margin-top: 4em;
     background-color: #fdf3f4;
     overflow-y: auto;
     overflow-x: hidden
}
.phone-button{
	 background-color: #fdf3f4;
	 height: 8em;
	 border-bottom-left-radius: 22px;
	 border-bottom-right-radius: 22px;
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
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	/* 나 머먹었어 */
	$('#pBtn1').click(function() {
		$('.phone > ul').append(
				"<li class='left'>"+
				"<div class='box' id='bot'>"+
					"<span class='message' id='bot_msg'>먹은걸 알려주세요</span>"+
				"</div>"+
			"</li>"
		);
		$('.massage').css("background-color", "#FFF");
		
		$('.phone').scrollTop($('.phone')[0].scrollHeight);	/* 스크롤처리 */
	});
	/* 안녕? */
	$('#pBtn3').click(function() {
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
$(function(){
	var fileurl="";
    //드래그앤드랍
    $("#img_span").on("dragenter", function(e){
        e.preventDefault();
        e.stopPropagation();
    }).on("dragover", function(e){
        e.preventDefault();
        e.stopPropagation();
        $(this).css("background-color", "#FFD8D8");
    }).on("dragleave", function(e){
        e.preventDefault();
        e.stopPropagation();
        $(this).css("background-color", "#FFF");
    }).on("drop", function(e){
        e.preventDefault();
    let file = e.originalEvent.dataTransfer.files;
    console.log(file);
    if(file!=null&&file!=undefined){	
   		let name=file[0].name;
   		console.log(name);
   		fileurl=window.URL.createObjectURL(file[0]);
   		if(file[0].type.includes("image/")){
   			$('#img_span').css("background-image","url("+fileurl+")");
   			$('#img_span').css("background-size","100% 100%");
   		}else{
   			alert("이미지가 아닙니다");
   			return;
   			/* 나중에처리 */
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
	$('#img_IBtn').click(function() {
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
	});
	$('th[class^=page]').click(function() {
		let classno=$(this).attr("class");
		classno=classno.substr(4, 1);
		$('table[class^=table]').hide();
		$('.table'+classno).show();
	});
	let year=2022;
	
	let month=2;/* 나중에자바로처리 */

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
	  if(day==6){  /* 일요일처리 */
		  day=-1;
	  }
	  for(i=1;i<=monthArr[month-1];i++){
		 $('#date'+parseInt(i+day)).text(i);
		 
	  }
	  
});
</script>
</head>
<body>
	<div class="wrapper">
		<div class="row1">
			<div class="col-sm-5">
				<div class="phone">
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
				</div>
				<div class="phone-button">
					<ul style="list-style: none;">
						<li><button class="pBtn" id="pBtn1">나 뭐 먹었어</button>
							<button class="pBtn" id="pBtn2">달력 보여줘?</button>
						</li>
						<li><button class="pBtn" id="pBtn3">안녕</button>
							<button class="pBtn" id="pBtn4">뭐 먹지</button>
						</li>
						<li><button class="pBtn" id="pBtn5">몸무게 변경할래</button>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-sm-7">
			  <div class="select">
			  <table class="category_user" style="width: 100%;">
			  	<tr style="border-bottom: 1px solid black;">
			  		<th class="page1">음식저장</th>
			  		<th class="page2">달력</th>
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
			    <table class="table1">
			    	<tr>
			    		<td width="40%">
			    			<div id="img_span" name="image" style="border-radius: 7px;"></div>
			    		</td>
				  		<td>
				  			<input type="button" value="삭제" id="img_dBtn">
				  			<input type="button" value="등록" id="img_IBtn">
				  		</td>
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
						<td id="date${s.index }"></td>
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