<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.admin_row{
    width: 94em;
    height: 70em;
    border: 1px solid black;
    margin: 0px 11em;
}
.admin_tab_div{
	border: 1px solid black;
    background: #5e5e6b;
    color: white;
    width: 8.2em;
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
    width: 78px;
    border-radius: 9px;
    background-color: #f8f9faa8;
}
.pageBtn,.moveBtn{
    background-color: white;
    border-radius: 5px;
    width: 40px;
    height: 40px;
    margin: 6px 7px;
}
.pageBtn:hover,moveBtn:hover{
    background-color: #648cff;
}
</style>
</head>

<body>
	<table class="admin_button_table">
	<tr>
		<td><button class="admin_button" id="qna_allData" @click="monthBtn()">전체보기</button>
			<button class="admin_button" id="qna_UpdateData">답변수정</button>
			<button class="admin_button" id="qna_search">QnA검색</button>
			<button class="admin_button" id="temp">미정</button></td>
	</tr>
	</table>
	<div class="faq-section spad" style="padding-top: 5px;">
        <div class="container" style="margin: 0px;">
            <div class="admin_row">
	            <div class="admin_tab_div">
	            	<ul class="admin_tab">
	            		<li><a href="../main/admin_main.do?no=0">QnA관리</a></li>
	            		<li><a href="../main/admin_main.do?no=1">쇼핑몰관리</a></li>
	            		<li><a href="../main/admin_main.do?no=2">통계</a></li>
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