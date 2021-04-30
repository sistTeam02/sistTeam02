<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.admin_row{
    width: 90em;
    height: 70em;
    border: 1px solid black;
    margin: 0px 11em;
}
.admin_tab_div{
	border: 1px solid black;
    background: #5e5e6b;
    color: white;
    width: 11em;
	float: left;
	height: 100%;
}
.admin_tab{
list-style: none;
}
.admin_tab li{
	height: 3em;
    padding-left: 1em;
    padding-top: 9px
}
.admin_view_div{
float: left;
}
.admin_button_table{
	width: 38eml;
	margin-left: 29em;
	margin-bottom: 10px;
	margin-top: 10px;
}
.admin_button{
	margin: 0px 14px;
    width: 74px;
    border-radius: 9px;
    background-color: #f8f9faa8;
}
</style>
</head>

<body>
	<table class="admin_button_table">
	<tr>
		<td><button class="admin_button" id="qna_allData">전체보기</button>
			<button class="admin_button">버튼</button>
			<button class="admin_button">버튼</button>
			<button class="admin_button">버튼</button></td>
	</tr>
	</table>
	<div class="faq-section spad" style="padding-top: 5px;">
        <div class="container" style="margin: 0px;">
            <div class="admin_row">
	            <div class="admin_tab_div">
	            	<ul class="admin_tab">
	            		<li><a href="../main/admin_main.do?no=0">QnA관리</a></li>
	            		<li>공지사항</li>
	            		<li>쇼핑몰관리</li>
	            		<li>통계</li>
	            	</ul>
	            </div>
	            <div class="admin_view_div">
	            
	               <jsp:include page="${admin_jsp }"></jsp:include>
	            </div>
            </div>
        </div>
    </div>
</body>
</html>