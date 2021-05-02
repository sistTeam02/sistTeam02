<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.stock_searchbar{
	display: none;
}
.main_manage_tr td{
    font-size: 24pt;
    text-align: center;
    width: 39em;
    height: 8em;
    background-color: #d6f9f9;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let page=1;
$(document).ready(function() {
	/* 버튼변경 */
	$('#qna_allData').text('품절관리');
	$('#qna_allData').attr('id','manage_stock');
	
	
	mainpage_table();//첫화면 생성
});
/* 품절관리버튼 */
$(document).on('click',function(){
	$('.stock_searchbar').show();
	$('.manage_table tr').remove();
	page=50;
	getStockList(page);
});


/* 첫화면테이블 */
function mainpage_table() {
		$('.manage_table').append(
			"<tr class='main_manage_tr'><td>버튼을 선택해주세요.</td></tr>"		
		)
}
/* 상품리스트가져오기 */
function getStockList(page) {
	$.ajax({
		type:'post',
		data:{'page':page},
		url:'../admin/manage_stockList.do',
		success:function(result){
			alert(result);
		},error:function(error){
			alert("상품리스트 출력에러")
		}
		
	})
}
</script>
</head>
<body>
	<table class="stock_searchbar">
			<tr>
				<td>
					<select>
						<option>식품</option>
						<option>운동용품</option>
					</select>
				</td>
				<td>
					상품 검색: <input type="text" size="15">
				</td>
			</tr>	
	</table>
	<table class="manage_table">
		
	</table>
</body>
</html>