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
		}
.box{
	max-width: 75%;
	margin: 3px 17px;
}
#user{
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
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	$('#pBtn1').click(function() {
		$('#bot_msg').text('먹은걸 알려줘');
		$('#bot_msg').css("background-color", "#FFF");
		
			}
		});
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
						<li class="left">
							<div class="box" id="bot">
								<span class="message" id="bot_msg"></span>
							</div>
						</li>
					<!-- 사용자 -->
					
						<li class="right">
							<div class="box" id="user">			
								<span class="message"></span>
							</div>
						</li>		
				
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
			  <table class="table">
			  	<tr>
			  		<th>음식</th>
			  		<th>칼로리</th>
			  	</tr>
			  	<tr>
			  				
			  	</tr>
			  </table>
			  </div>
			</div>
		</div>
	</div>
</body>
</html>