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
}
.phone ul{list-style: none; width: 100%;

}
.phone ul li{width: 100%; display: inline-block;margin: 10px;}
.phone ul li.left { text-align: left; }
.phone ul li.right { text-align: right; }
.message{
	
	font-size: 18px;
	word-break: break-all;
	background-color: white;
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
</style>
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
								<span class="message">오늘 뭐먹었니</span>
							</div>
						</li>
					<!-- 사용자 -->
					<c:forEach begin="0" end="30" step="1">
						<li class="right">
							<div class="box" id="user">			
								<span class="message">몰라</span>
							</div>
						</li>		
				</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-sm-7">
			 	사용자 입력
			</div>
		</div>
	</div>
</body>
</html>