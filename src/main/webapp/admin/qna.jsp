<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.admin_table{
	border: 2px dotted red;
    height: 62em;
    width: 68em;
    margin: 0em 5em;
}
.main_tr{
    text-align: center;
    font-size: 33pt;
    background-color: #80808033;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	mainpage_table();
});
$(document).on("click","#qna_allData",function(){
	
});
/* 첫화면테이블 */
function mainpage_table() {
		$('.admin_table').append(
			"<tr class='main_tr'><td>버튼을 선택해주세요.</td></tr>"		
		)
}
/* 전체보기함수 */
function qna_allDataList(){
	
}

</script>

</head>
<body>
	
	<table class="admin_table">
	
	</table>
</body>
</html>