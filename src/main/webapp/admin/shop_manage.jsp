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


/* 품절 상태변경 버튼클릭 cno=1 goods,cno=2 food*/
$(document).on('click','.soldoutBtn',function(){
	let no=$(this).parent().prevAll('.stock_no').text();
	let cno=1;
	if(no.includes("d")){
		cno=2;
		no=no.replace(/d/g, "");
	}
	let text=$(this).parent().prev().text();
	if(text=="품절"){
		$(this).parent().prev().text('판매중');
	}else{
		$(this).parent().prev().text('품절');
	}
	updateStock(no,cno);
	
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
					"<td class='isStock' id=isStock"+i+">"+json[i].stock+"</td>"+
					"<td><button class='soldoutBtn'></button></td>"+
				"</tr>"	
			);
		}
		makeText_soldoutBtn();
	}	
}
/* 품절업데이트 버튼클릭후*/
function updateStock(no,cno) {
		$.ajax({
			type:'post',
			data:{'no':no,'cno':cno},
			url:'../admin/updateShopStock.do',
			success:function(result){
				makeText_soldoutBtn();
			},error:function(error){
				alert("품절 업데이트 오류");
			}
				
		})
}
/*품절 버튼 text생성*/
function makeText_soldoutBtn() {
	for(i=0;i<20;i++){
		let str=$('#isStock'+i).text();
		if(str.includes("품절")){
			$('#isStock'+i).next().children().text("품절취소");
		}else{
			$('#isStock'+i).next().children().text("품절처리");
		}
	}
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