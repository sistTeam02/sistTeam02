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
.find_div{
overflow-y:auto;
overflow-x:hidden;
height: 40em;  
}
.insert_table{
    width: 42em;
    height: 17em;
}
.insert_table th{
	text-align: right;
	height: 4em;
}
.insert_table_Btn{
	 margin: 0px 20px;
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
	$('#qna_UpdateData').text('상품등록');
	$('#qna_UpdateData').attr('id','product_insert');
	$('.insert_div').hide();
	mainpage_table();//첫화면 생성
});
/* 품절관리버튼 */
$(document).on('click','#manage_stock',function(){
	$('.insert_div').hide();
	$('.find_div').attr('class','nomal_div');//오버플로우 해제
	$('.stock_searchbar').show();
	$('.manage_table tr').remove();
	$('.row_button button').remove();
	page=1;
	button=1;
	getStockList(page,button);
});
/* 상품등록버튼 */
$(document).on('click','#product_insert',function(){
	$('.find_div').attr('class','nomal_div');//오버플로우 해제
	$('.stock_searchbar').hide();
	$('.manage_table tr').remove();
	$('.row_button button').remove();
	$('.insert_div').show();
	
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
/* 페이지화살표 클릭 */
 $(document).on('click','#moveBtn_l',function(){
	 let a=$(this).next().text();
	 $('.manage_table tr').remove();
	 $('.row_button button').remove();
	 getStockList(Number(a)-10,button);
 });
 $(document).on('click','#moveBtn_r',function(){
	 let a=$(this).prev().text();
	 $('.manage_table tr').remove();
	 $('.row_button button').remove();
	 getStockList(Number(a)+1,button);
 });
 /* 페이지 클릭 */
  $(document).on('click','.pageBtn',function(){
  	page=$(this).text();
  	button=1;
  	$('.manage_table tr').remove();
  	$('.row_button button').remove();
	getStockList(page,button);
  	
  }); 
/* 검색어 입력 */
 $(document).on("keydown","#findShop_input",function(){
	 let table=$(this).parent().prev().children().val();
	 let keyword=$(this).val();
	 console.log(keyword);
	 if(keyword!=""){
	 	findData(keyword, table);
	 }
 });
 $(function(){
		let fileindex=1;
	$('.plusBtn').click(function() {
		$('#insert_table_main').append(
					"<tr class='insert_input_clone'>"+
    		"<th width=30%>상세 이미지</th>"+
    		"<td>"+
    			"<input type='file' name=file"+fileindex+" size='20' style='background-color: #f1f8ff;' class='insert_input'>"+
    		"</td>"+
    	"</tr>"
		);
		fileindex++;
	});
	$('.minusBtn').click(function() {
		$('.insert_input_clone').last().remove();
		
	});
	$('#backBtn').click(function() {
		$('input[class^=insert_input]').val('');
	});
 });
/* 첫화면테이블 */
function mainpage_table() {
		$('.manage_table').append(
			"<tr class='main_manage_tr'><td>버튼을 선택해주세요.</td></tr>"		
		)
}
/* 상품리스트가져오기 */
function getStockList(page,button) {
	let totalpage=getTotalpage();
	$.ajax({
		type:'post',
		data:{'page':page},
		url:'../admin/manage_stockList.do',
		success:function(result){
			let json=JSON.parse(result);
			 make_tr(json,button);
			 let startpage=Math.floor((page-1)/10)*10+1;
			 let endpage=Math.floor((page-1)/10)*10+10;
			 if(endpage>totalpage){
				 endpage=totalpage}
			 for(i=startpage;i<=endpage;i++){
			 	make_pageBtn(i, button);
			 }
			 pageBtn_makeicon(page, totalpage);
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
	}else if(button==2){
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
	let count=$('.isStock').length;
	for(i=0;i<count;i++){
		let str=$('#isStock'+i).text();
		if(str.includes("품절")){
			$('#isStock'+i).css('color','red');
			$('#isStock'+i).next().children().text("품절취소");
		}else{
			$('#isStock'+i).next().children().text("품절처리");
		}
	}
}
/* 토탈페이지 */
function getTotalpage() {
	let totalpage="";
	$.ajax({
		type:'get',
		url:'../admin/manageShopTotalpage.do',
		async: false,
		success:function(result){
			totalpage=result;
		},error:function(error){
			alert("총페이지 불러오기 에러");
		}
	
	})
	return totalpage;
}
/* 페이지만들기 */
function make_pageBtn(page,button) {
	$('.row_button').append(
			"<button class=pageBtn id=pageBtn"+page+" buttonnum="+button+">"+page+"</button>"
		);
	}
/* 페이지 화살표만들기 */
function pageBtn_makeicon(page,totalpage) {
	if(page>10){
	$('.row_button').prepend(
			"<button class=moveBtn id=moveBtn_l><i class=ti-angle-left></i></button>"
		);
	}
	if(totalpage>10 && page+10<totalpage){
	$('.row_button').append(
			"<button class=moveBtn id=moveBtn_r><i class=ti-angle-right></i></button>"
		);
	}
}
/* 검색 데이터가져오기 admin/findShopStock.do*/
function findData(keyword,table) {
	$.ajax({
		type:'post',
		url:'../admin/findShopStock.do',
		data:{'keyword':keyword,'table':table},
		success:function(result){
			let json=JSON.parse(result);
			button=2
			$('.manage_table tr').remove();
			 $('.row_button button').remove();
			 make_tr(json,button);
			 $('.nomal_div').attr('class','find_div');
		},error:function(error){
			alert("검색 에러");
		}
	
	})
}
function make_insertTable(){
	
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
					상품 검색: <input type="text" size="15" id="findShop_input">
				</td>
			</tr>	
	</table>
	<div class="find_div">
	<table class="manage_table">
		
	</table>
	</div>
	<div class="row_button">

    </div>
    <div class="insert_div" style="display:none;">
	    <form method="post" action="../admin/insert_product.do" enctype="multipart/form-data">
	    <table class="insert_table" id="insert_table_main">
	    	<tr>
	    		<th width=30%>카테고리</th>
	    		<td>
	    			<label>
	    			<input type="radio" value="1" name="cno" class="insert_input">식품</label>
	    			<label>
	    			<input type="radio" value="2"name="cno" class="insert_input">운동용품</label>
	    		</td>
	    			
	    	</tr>
	    	<tr>
	    		<th width=30%>상품명</th>
	    		<td>
	    			<input type="text" size="30" class="insert_input" name="title">
	    		</td>
	    	</tr>
	    	<tr>
	    		<th width=30%>가격</th>
	    		<td>
	    			<input type="text" size="10" class="insert_input" name="price">
	    		</td>
	    	</tr>
	    	<tr>
	    		<th width=30%>목록 이미지</th>
	    		<td>
	    			<input type="file" name=file0 size="20" style="background-color: #f1f8ff;" class="insert_input">&nbsp;&nbsp;&nbsp;<button type="button" class="plusBtn">추가</button><button type="button" class="minusBtn">삭제</button>
	    		</td>
	    	</tr>
	    </table>    
    <table class="insert_table" style="text-align: center;">
    	<tr>
    		<td>
    			<button type="submit" class="insert_table_Btn">완료</button>
    			<button type="button" class="insert_table_Btn" id="backBtn">지우기</button>
    		</td>
    	</tr>
    </table>
    </form>
    </div>
</body>
</html>