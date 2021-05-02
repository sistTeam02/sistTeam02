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
let button=1;
$(document).ready(function() {
	/* 버튼변경 */
	$('#qna_allData').text('품절관리');
	$('#qna_allData').attr('id','manage_stock');
	
	
	mainpage_table();//첫화면 생성
});
/* 품절관리버튼 */
$(document).on('click','#manage_stock',function(){
	$('.stock_searchbar').show();
	$('.manage_table tr').remove();
	page=1;
	button=1;
	getStockList(page,button);
});


/* 품절 상태변경 버튼클릭 */
$(document).on('click','.soldoutBtn',function(){
	let no=$(this).parent().prevAll('.stock_no').text();
	alert(no);
});
/* 첫화면테이블 */
function mainpage_table() {
		$('.manage_table').append(
			"<tr class='main_manage_tr'><td>버튼을 선택해주세요.</td></tr>"		
		)
}
/* 상품리스트가져오기 */
function getStockList(page,button) {
	$.ajax({
		type:'post',
		data:{'page':page},
		url:'../admin/manage_stockList.do',
		success:function(result){
			let json=JSON.parse(result);
			 make_tr(json,button);
		},error:function(error){
			alert("상품리스트 출력에러")
		}
		
	})
}
function make_tr(json,button){
	if(button==1){
		for(i=0;i<json.length;i++){
			$('.manage_table').append(
				"<tr>"+
					"<td class='stock_no'>"+json[i].stockNo+"</td>"+
					"<td>"+json[i].title+"</td>"+
					"<td class='isStock'>"+json[i].stock+"</td>"+
					"<td><button class='soldoutBtn'>품절처리</button></td>"+
				"</tr>"	
			);
		}
	}	
}
/* 품절업데이트 버튼클릭후*/
function updateStock(text,no,cno) {
		
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