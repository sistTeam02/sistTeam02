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
    height: 40em;
    border: 1px solid black;
    margin: 0px 11em;
}
.admin_tab_div{
	border: 1px solid black;
    background: #5e5e6b;
    color: white;
    width: 11em;
	float: left;
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
</style>
</head>

<body>
	<div class="faq-section spad">
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
	            1
	            <div class="admin_view_div">
	            
	               <jsp:include page="${admin_jsp }"></jsp:include>
	            </div>
            </div>
        </div>
    </div>
</body>
</html>