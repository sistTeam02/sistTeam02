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
    background-color: #fdf3f49c;
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
        height: 28px;
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
        text-align: center;
    padding: 35px;
}
th[class^=page]{
	cursor: pointer;
	 font-size: 16pt;
}
table[class^=table]{
	
}
.table2{
	display: none;
	width: 750px;
	height: 26em;
}
.table3{
	display: none;
    width: 750px;
    height: 600px;
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
td[id^=table3_td] img{
    width: 150px;
    height: 150px;
    border-radius: 65px;
}
.recipe_page{

    height: 4em;
	padding: 0px 39px;
}
.pageBtn{
    background-color: white;
    border-radius: 5px;
    width: 40px;
    height: 40px;
    margin: 6px 7px;
}
.pageBtn:hover{
	background-color: #648cff;
}
.pageBtn:active{
	border: 2px solid #d2bfec;
}
.ui-widget-header{
    background-color: #648cff;
}
#search_div{
 	width:20em;
 	overflow-y: auto;
 	height: 23em;
	overflow-x: hidden;
	 position: relative;
    top: 17px;
}
#search_result_table tr td{
	padding-left: 25px;
    font-size: 15pt;
}
#search_result_table tr td:hover{
	background-color: #ffc301;
    color: white;
}
#search_click_div{
    border: 2px solid black;
    width: 21em;
    height: 24em;
    position: relative;
    left: 23em;
    bottom: 22em;
}
input[type="number"] {
 width: 6em;
}
 .category_user tr th:hover{
 color: #444963bf;
 }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let today=new Date().toLocaleDateString();
today=today.replace(/(\s*)/g, "");
today=today.substring(0, today.lastIndexOf("."));
/* let todayArr=[];
todayArr=today.split(".");
today=todayArr[0]+"."+("0"+todayArr[1])+"."+todayArr[2];
console.log(today); */
/* today format변환 */
thismonth=0;
thisday=0;
let fileurl="";
let filename="";
let file="";
let page=1;
let id="";
totalpage=0;
$(document).ready(function(){
	 id=$('#sport_memo_tr').attr('user_id');
	 id=id.trim();
})
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
		let date=$('#sport_memo_date').text(today);
		/* if(date==''){ 날짜입력 삭제
			$('.phone > ul').append(
					"<li class='left'>"+
					"<div class='box' id='bot'>"+
						"<span class='message' id='bot_msg'>날짜를 입력해주세요</span>"+
					"</div>"+
				"</li>"
			);
			return;
		} */
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
			"id":id,/* id작업후수정 =======완료==============*/	
			"date":$('#sport_memo_date').text(),
			"time":$('#sport_memo_time').val(),
			"sport":sportSum
		}
		
		$.ajax({
			type:'post',
			data:{'memo':JSON.stringify(memo)},
			url:'../chat/sport_plan.do',
			success: function (result) {
				bot_msg("운동기록 완료했습니다")
			},error:function (error) {
				alert("오류");
			}	
		})
		$('.phone').scrollTop($('.phone')[0].scrollHeight);
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
		let rBtnIndex=1;
	$('#pBtn4').click(function() {
		$('.phone >ul >li').remove();
		$('.sport_memo_tr_clone').remove();
		$('#pBtn10').hide();
		  $('.sport_memo').hide();
		$('.phone > ul').append(
				"<li class='left'>"+
				"<div class='box' id='bot'>"+
					"<span class='message' id='bot_msg'>다이어트 식단을 추천해 드릴까요?</span>"+
				"</div>"+
			"</li>"+
				"<li class='left'>"+
				"<button type='button'id=recipe_Rbtn"+rBtnIndex+" class='pBtn'>추천해줘</button>"+
				"</li>"	
		);
		rBtnIndex++;
		$('button[id^=recipe_Rbtn]').click(function() { /* 추천해줘클릭 */
			$('#search_div').hide();
			$('#search_click_div').hide();
			recipe_list(page);
		});
	});

});
/*레시피 페이지클릭 */
$(document).on('click', 'button[id^=pageBtn]' , function(){
	let cPage=$(this).text();
	recipe_list(cPage);
});
/* 레시피 '<' 아이콘클릭 */
$(document).on('click', '#leftBtn' , function(){
	let cPage=$(this).next().text();
	recipe_list(Number(cPage)-10);
});
/* 레시피 '>' 아이콘클릭 */
$(document).on('click', '#rightBtn' , function(){
	let cPage=$(this).prev().text();
	recipe_list(Number(cPage)+1);
});
/* 레시피상세다이얼로그 */
$(document).on('click', 'td[id^=table3_td] > img' , function(){
	$('.recipe_detail').dialog({
		autoOpen:true,
		width:1000,
		height:1200,
		modal:true
		
	})
	$('.ui-button-icon-only').append("<i class='ti-close'></i>");
});
/* 칼로리 검색결과 클릭 */
$(document).on('click', '#search_result_table > tbody > tr' , function(){
	let kcal=$(this).children().attr('kcal');
	let gram=$(this).children().attr('gram');
	let name=$(this).children().text();
	let division=$(this).children().attr('division');
	click_result(name,kcal,gram,division);
	
});
/* 먹은 용량변경 */
$(document).on('change','#search_click_gram',function(){
	let gram=$('#search_click_gram').val();
	let name=$('#search_click_name').text();
	let division=$('#search_click_gram').attr('division');
	let kcal=Math.ceil(gram*division);
	
	click_result(name, kcal, gram, division);
});
/* 오른쪽 제어 */
$(function(){

	let year=2021;
	let month=5;
	thismonth=month;
	let hoverSwitch=0;
	$('#img_fBtn').on("change", function(e){
    	file = e.target.files;
        if(file!=null&&file!=undefined){
       		filename=file[0].name;	
       		fileurl=window.URL.createObjectURL(file[0]);
       		if(file[0].type.includes("image/")){
       			hoverSwitch=1;
       			$('#img_span').css("background-image","url("+fileurl+")");
       			$('#img_span').css("background-size","100% 100%");
       		}else{
       			hoverSwitch=0;
       			alert("이미지가 아닙니다");
       			return;
       			/*이미지가 아닐때 나중에처리 */
       		}
        }
    })
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
    }).on("click", function(e){
    	e.preventDefault();
    	$('#img_fBtn').click();
    }).on("drop", function(e){
        e.preventDefault();
     file = e.originalEvent.dataTransfer.files;
    if(file!=null&&file!=undefined){
   		filename=file[0].name;	
   		fileurl=window.URL.createObjectURL(file[0]);
   		if(file[0].type.includes("image/")){
   			hoverSwitch=1;
   			$('#img_span').css("background-image","url("+fileurl+")");
   			$('#img_span').css("background-size","100% 100%");
   		}else{
   			hoverSwitch=0;
   			alert("이미지가 아닙니다");
   			return;
   			/*이미지가 아닐때 나중에처리 */
   		}
    }
    
    });
    /* 시간버튼 클릭 */
    $('.timeBtn').click(function() {
    	$('.timeBtn').attr('value','0');
    	$('.timeBtn').css('background-color','rgb(84 91 99 / 14%)'); 
    	$(this).css("background-color", "#fdf3f4");
    	$(this).attr('value','1');
    });
    /* 이미지삭제버튼 */
	$('#img_dBtn').click(function() {
		hoverSwitch=0;
		$('#img_span').css("background-image","none");
		$('#img_span').css("background-color", "#fff");
		fileurl="";
	});
	
		$('#img_span').hover(function(){ /* 이미지칸 마우스호버 */
			if(hoverSwitch==1){
				$(this).text('');
			}else if(hoverSwitch==0){
			$(this).html('음식사진을 <br><br>넣어주세요')
			}
		},function(){
			$(this).text('');
		});
	let imgIndex=1;
	$('#img_IBtn').click(function() { /* 이미지전송버튼 */
		if(fileurl!=""){
			$('.phone > ul').append(
					"<li class='right'>"+
					"<div class='box' id=user_img"+imgIndex+">"+
					"</div>"+
				"</li>"
			);
		}
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
				send_phone();//음식저장
			},error:function(error){
				bot_msg("사진전송이 안되었어요 다시올려주세요")
			} 
			
			
			
		}); 
	});
	/* 오른쪽테이블 화면제어 */
	$('th[class^=page]').click(function() {
		let classno=$(this).attr("class");
		classno=classno.substr(4, 1);
		$('table[class^=table]').hide();
		$('.table'+classno).show();
		$('.table3').hide();
		$('#page_div > button').remove();
		$('#search_div').hide();
		$('#search_click_div').hide();
		if(classno==1){
			$('#search_div').show();
			$('#search_click_div').show();
		}
	});
	/* 검색버튼클릭 */
	$('#searchBtn').click(function(){
		$('#search_result_table tr').remove();
		keyword=$('#input_search').val();
		if(keyword.length<1){
			$('#input_search').focus();
			return;
		}
		kcal_search(keyword);
	});
	/* 검색창엔터 */
	$('#input_search').keypress(function(key) {
		if(key.keyCode==13){
			$('#search_result_table tr').remove();
			keyword=$('#input_search').val();
			if(keyword.length<1){
				$('#input_search').focus();
				return;
			}
			kcal_search(keyword);
		}
		
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
		  let strday="";
		  $.ajax({
			  type:'post',
		  	  url:'../chat/chat_dbday.do',
		  	  data:{'month':thismonth,'id':id},
		      async:false,
		  	  success:function(result){
		  		  strday=result;
		  		
		  	  },error:function(error){
		  		 
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
			  let strday="";
			  $.ajax({
				  type:'post',
			  	  url:'../chat/chat_dbday.do',
			  	  data:{'month':thismonth,'id':id},
			      async:false,
			  	  success:function(result){
			  		  strday=result;
			  		
			  	  },error:function(error){
			  		 
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
	  let strday="";
	  $.ajax({
		  type:'post',
	  	  url:'../chat/chat_dbday.do',
	  	  data:{'month':thismonth,'id':id},
	      async:false,
	  	  success:function(result){
	  		  strday=result;
	  		
	  	  },error:function(error){
	  		
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
/* 레시피리스트 호출함수 */
	
function recipe_list(page){
		$('#page_div > button').remove();
		$.ajax({
			type:'post',
			data:{'page':page},
			async:true,
			url:'../chat/chat_recipeList.do',
			success:function(result){
				let json=JSON.parse(result);
				for(i=0;i<json.length;i++){
					if(json[i].title.length>18){
						json[i].title=json[i].title.substring(0, 18)+"..."
					}
					$('#table3_td'+i).text(json[i].title);
					$('#table3_td'+i).append(
						"<img no="+json[i].no+" src="+json[i].poster+">"
					);
				totalpage=json[i].totalpage;
				page=json[i].page;
				}
				for(let k=0;k<10;k++){
					recipe_for(k,page);
				}
				if(page>10){
				$('#page_div').prepend("<button class=pageBtn id='leftBtn'><i class='ti-angle-left'></i></button>")	
				}
				if(page<(totalpage-totalpage%10)){
				$('#page_div').append("<button class=pageBtn id='rightBtn'><i class='ti-angle-right'></i></button>")
				}
				$('table[class^=table]').hide();
				$('.table3').show();
			
			},error:function(error){
				alert("레시피 호출에러");
			}
							
		})
		
		
		
	}
		
/* 레시피 페이지 호출함수 */
function recipe_for(k,page){
	let block=10;

	let startPage=Math.floor((page-1)/block)*block+1;
	let endPage=Math.floor((page-1)/block)*block+block;
	endPage>totalpage?endPage=totalpage:endPage=endPage;
	$('#page_div').append("<button class=pageBtn id=pageBtn"+(startPage+k)+">"+(Number(startPage)+Number(k))+"</button>")
}
/* 칼로리 검색함수 */
function kcal_search(keyword){
	$.ajax({
		type:'post',
		data:{'keyword':keyword},
		url:'../chat/chat_kcal.do',
		success:function(result){
			let json=JSON.parse(result);
			for(i=0;i<json.length;i++){
				kcal_maketr(json[i].name,json[i].kcal,json[i].gram);
			}
		},error:function(error){
			alert("칼로리 검색에러");
		}
	});
}
 /* 칼로리 tr생성함수 */
 function kcal_maketr(name,kcal,gram) {
	$('#search_result_table').append(
		"<tr><td kcal="+kcal+" gram="+gram+" division="+(kcal/gram)+">"+name+"</td></tr>"		
	)
	
}
 /* 검색결과 클릭 함수 */
 function click_result(name,kcal,gram,division) {
	$('#search_click_name').text(name);
	$('#search_click_kcal').val(kcal);
	$('#search_click_gram').val(gram);
	$('#search_click_gram').attr('division',division)
}
 /* 먹은 음식 화면출력함수+먹은 음식 insert *보내기클릭 안에 있어야함 */
 function send_phone(){
	 let sysdate=today;
	 let time="";
	 for(i=0; i<4;i++){
	  time=$('#timeBtn'+i).attr('value');
		 if(time=="1"){
			 time=$('#timeBtn'+i).text();
			 break;
		 }
	 }
	 let name=$('#search_click_name').text();
	 let kcal=$('#search_click_kcal').val();
	 let gram=$('#search_click_gram').val();
	 if(time.length==2){

		 user_msg(sysdate+"  "+time);
	 }else{
		 bot_msg("먹은 시간을 알려주세요");
		 return;
	 }
	 if(kcal==""){
		 bot_msg("먹은 음식을 알려주세요");
	 }else{
	 user_msg((name+"  "+gram+" 그램"+kcal+"  kcal"));
	 user_msg("저장해줘");

	 memo={
				"id":id,/* id작업후수정 =============완료========*/	
				"date":sysdate,
				"time":time,
				"fname":name,
				"fkcal":kcal,
				"fgram":gram,
				"filename":filename
			}
			$.ajax({
				type:'post',
				data:{'memo':JSON.stringify(memo)},
				url:'../chat/chat_food.do',
				success: function (result) {
					bot_msg("식단기록 완료했습니다")
				},error:function (error) {
					alert("오류");
				}	
			})
	 }
 }
 
 /* 사용자 메세지함수 */
 function user_msg(msg) {
	 $('.phone > ul').append(
				"<li class='right'>"+
				"<div class='box' id='user'>"+			
				"<span class='message' id='user_msg'>"+msg+"</span>"+
				"</div>"+
			"</li>"
			)
}
 function bot_msg(msg) {
 $('.phone > ul').append(
			"<li class='left'>"+
			"<div class='box' id='bot'>"+
				"<span class='message' id='bot_msg'>"+msg+"</span>"+
			"</div>"+
		"</li>"
	)
 }
 /* 달력안에 내용클릭함수 */
$(document).on('click', '.ti-align-left' , function(){
		  thisday=$(this).parent().text();
		  thisday=thisday.trim();
		  $('.phone >ul >li').remove();
		  $('#pBtn10').hide();
		  $('.sport_memo').hide();
			
		  $.ajax({
			  type:'post',
				data:{'date':'2021.'+thismonth+'.'+thisday,'id':id},
				url:'../chat/chat_planData.do',
				async: false,
				success: function (result) {
					$('.phone > ul').append(
							"<li class='left'>"+
							"<div class='box' id='bot'>"+
								"<span class='message' id='bot_msg'>"+thismonth+"월"+thisday+"일의 운동기록입니다</span>"+
							"</div>"+
						"</li>"
					);
					 let json=JSON.parse(result);
					
					 let ptime="";
					 let psport="";
					 if(json.length>0){
						 for(i=0;i<json.length; i++){
							psport=json[i].sport;
							ptime=json[i].time;
							psport=psport.replace(/\^/g, "세트<br>");
							psport=psport.substring(0,psport.lastIndexOf("<"));
							bot_msg(ptime);
							bot_msg(psport);
						} 
					 }else{
						 bot_msg("운동기록이 존재하지 않습니다.")
					 }
				},error:function (error) {
					alert("오류");
				}	
		  })
		  $.ajax({
			  type:'post',
				data:{'date':'2021.'+thismonth+'.'+thisday,'id':id},
				url:'../chat/chat_foodData.do',
				async: false,
				success: function (result) {
					$('.phone > ul').append(
							"<li class='left'>"+
							"<div class='box' id='bot'>"+
								"<span class='message' id='bot_msg'>"+thismonth+"월"+thisday+"일의 음식 기록입니다</span>"+
							"</div>"+
						"</li>"
					);
					 let json=JSON.parse(result);
					 if(json.length>0){
						 for(i=0;i<json.length; i++){
							let fname=json[i].foodname;
							let ftime=json[i].whenfood;
							let fkcal=json[i].foodkcal;
							let fgram=json[i].foodgram;
	
							bot_msg(ftime);
							bot_msg(fname);
							bot_msg(fkcal+" kcal   "+fgram+" g");
							
						} 
					}else{
						bot_msg("기록이 존재하지 않습니다.")
					}
				},error:function (error) {
					alert("오류");
				}	
		  })
		  image_show();
	  });
	  //아이콘 함수 -plan
function image_show(){
  let fooddate='2021.'+thismonth+'.'+thisday;
  let filecount=0;	
 	$.ajax({
		type:'get',
		data:{'fooddate':fooddate,'id':id},
		url:'../chat/total_foodfile.do',
		async:false,
		success:function(result){
			filecount=Number(result);
		},error:function(error){
			alert("이미지에러")
		}
	})
	console.log("b"+filecount);
    for(i=0;i<filecount;i++){
			$('.phone > ul').append(
					"<li class='left'>"+
					"<div class='box' id='bot'>"+
						"<span class='message' id='bot_msg'><img src='../chat/chat_food_image.do?no="+i+"&id="+id+"&fooddate="+fooddate+"'></span>"+
					"</div>"+
				"</li>"
			);
   }
 }
function getDetail(no){
	$.ajax({
		type:'post',
		data:{'no',no},
		url:'../chat/chat_recipeDetail.do',
		success:function(result){
			
		}
	
	})
}

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
						<tr id="sport_memo_tr" user_id="${sessionScope.id} ">	
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
					</ul>
				</div>
			</div>
			<div class="col-sm-7">
			  <div class="select">
			  <table class="category_user" style="width: 100%;">
			  	<tr style="border-bottom: 1px solid black;">
			  		<th class="page1">음식저장</th>
			  		<th class="page2">기록</th>
			  		<th class="page3">뭐먹지</th>
			  	</tr>
			  </table>
			  <div class="page_div" style="height: 40em">
			  	<table class="table1">
			  		<tr>
			  			<td>
			  				<button class="timeBtn" value="0" id="timeBtn0">아침</button>
			  				<button class="timeBtn" value="0" id="timeBtn1">점심</button>
			  				<button class="timeBtn" value="0" id="timeBtn2">저녁</button>
			  				<button class="timeBtn" value="0" id="timeBtn3">간식</button>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td>
			  			<input type="text" size=20 id="input_search">
			  			<button type="button" id="searchBtn">검색</button>
			  			</td>
			  		</tr>
			  	</table>
			  	<form id="fileForm" name="fileForm" enctype="multipart/form-data" method="post">
			    <table class="table1">
			    	
				</table>
				</form>
				<div id="search_div">
					<table class="table1" style="height: 360px;background-color:#fffcf5; overflow-y:auto;" id="search_result_table" >
						<!-- 칼로리별음식출력 -->
					</table>
				</div>
				<div id="search_click_div">
					<table class="table1" style="width: 336px;">
						<tr style="height: 70px;font-size: 19px;border-bottom: 2px dotted black;">
							<th colspan="2" style="text-align: center;" id="search_click_name"></th>
						</tr>
						<tr>
							<td>
								용량(g)
							</td>
							<td>
								칼로리(kcal)
							</td>
						</tr>
						<tr>
							<td>
								<input type="number"  id="search_click_gram">
							</td>
							<td>
								<input type="number"  id="search_click_kcal" disabled="disabled">
							</td>
						</tr>
						<tr>
			    		<td width="40%">
			    			<div id="img_span" name="image" style="border-radius: 7px;"></div>
			    		</td>
				  		<td>
				  			<input type="button" value="삭제" id="img_dBtn">
				  			<input type="button" value="식단기록" id="img_IBtn">
				  			<input type="file"  id="img_fBtn" style="display: none;" multiple="multiple">
				  		</td>
			  	    </tr>
					</table>
				</div>
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
				<table class="table3">
				 		<tr>
					 	<c:forEach begin="0" end="2" varStatus="s" step="1">
					 		<td id="table3_td${s.index }"><img src=""></td>
					 	</c:forEach>
				 		</tr>
				 		<tr>
					 	<c:forEach begin="3" end="5" varStatus="s" step="1">
					 		<td id="table3_td${s.index }"><img src=""></td>
					 	</c:forEach>
				 		</tr>
				 		<tr>
					 	<c:forEach begin="6" end="8" varStatus="s" step="1">
					 		<td id="table3_td${s.index }"><img src=""></td>
					 	</c:forEach>
				 		</tr>
				 	
				</table>
			    </div>
			  </div>
			  <div class="recipe_page" id="page_div">
			  		
			  </div>
			  <div class="recipe_detail">
			  	<!-- dialog -->
			  </div>
			</div>
		</div>
	</div>
</body>
</html>