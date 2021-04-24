<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
    padding: 7px;
    background-color: wheat;
		}
.box{
	max-width: 75%;
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
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {

	$('#pBtn1').click(function() {
		$('.phone > ul').append(
				"<li class='left'>"+
				"<div class='box' id='bot'>"+
					"<span class='message' id='bot_msg'>먹은걸 알려줘</span>"+
				"</div>"+
			"</li>"
		);
		$('.massage').css("background-color", "#FFF");
		
		$('.phone').scrollTop($('.phone')[0].scrollHeight);	/* 스크롤처리 */
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
			  		<th>음식저장</th>
			  		<th>달력</th>
			  		<th>추천?</th>
			  	</tr>
			  </table>
			    <table class="table">
			    	<tr>
			    		<td width="40%">
			    			<div id="img_span" name="image"></div>
			    		</td>
				  		<td>
				  			<input type="button" value="삭제" id="img_dBtn">
				  			<input type="button" value="등록" id="img_IBtn">
				  		</td>
			  	    </tr>
			    </table>
			  </div>
			</div>
		</div>
	</div>
</body>
</html>