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
#update_no{
margin-left: 77px;
display: none;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
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
	$('#qna_search').text('상품수정');
	$('#qna_search').attr('id','product_update');
	$('#temp').text('상품삭제');
	$('#temp').attr('id','product_delete');	
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
	$('#update_no').hide();
	$('#form').attr('action','../admin/insert_product.do');//폼테그 주소수정
	
});
/* 상품수정버튼 */
 $(document).on('click','#product_update',function(){
		$('.find_div').attr('class','nomal_div');//오버플로우 해제
		$('.stock_searchbar').hide();
		$('.manage_table tr').remove();
		$('.row_button button').remove();
		$('.insert_div').show();
		$('#update_no').show();
		$('#form').attr('action','../admin/update_product.do');//폼테그 주소수정

	});
 /* 상품삭제버튼 */
 $(document).on('click','#product_delete',function(){
 	$('.insert_div').hide();
 	$('.find_div').attr('class','nomal_div');//오버플로우 해제
 	$('.stock_searchbar').show();
 	$('.manage_table tr').remove();
 	$('.row_button button').remove();
 	page=1;
 	button=3;
 	getStockList(page,button);
 });
/* 품절 상태변경 버튼클릭 cno=1 goods,cno=2 food*/
$(document).on('click','.soldoutBtn',function(){
	let no=$(this).parent().prevAll('.stock_no').text();
	let cno=2;
	if(no.includes("d")){
		cno=1;
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
/* 삭제버튼 */
$(document).on('click','.deleteBtn',function(){
	$(this).parent().prev().text('삭제완료').css('color','red');
	let no=$(this).parent().prevAll('.stock_no').text();
	let cno=2;
	if(no.includes("d")){
		cno=1;
		no=no.replace(/d/g, "");
	}
	deleteShopList(no,cno);
	
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
 $(document).on("keyup","#findShop_input",function(){
	 let table=$(this).parent().prev().children().val();
	 let keyword=$(this).val();
	 button++;
	 console.log(keyword);
	 if(keyword!=""){
	 	findData(keyword, table,button);
	 }else{
		 $('.insert_div').hide();
		 $('.find_div').attr('class','nomal_div');//오버플로우 해제
		 $('.stock_searchbar').show();
		 $('.manage_table tr').remove();
		 $('.row_button button').remove();
		 getStockList(1,button-1);
	 }
	 button--;
 });
 /* 업데이트 no검색 update_no_input*/
  $(document).on("keyup","#update_no_input",function(){
	 let cno=$('.insert_input:checked').val();
	 let no=$('#update_no_input').val();
	if(no!="" && cno!=undefined){
		make_updateData(cno,no);
	}else{
		$('#title_input').val('');
		$('#price_input').val('');
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
	}else if(button==3){
		for(i=0;i<json.length;i++){
			$('.manage_table').append(
				"<tr>"+
					"<td class='stock_no'>"+json[i].stockNo+"</td>"+
					"<td>"+json[i].title+"</td>"+
					"<td class='isStock' id=isStock"+i+">"+json[i].stock+"</td>"+
					"<td><button class='deleteBtn'>삭제</button></td>"+
				"</tr>"	
			);
		}
	}else if(button==4){
		for(i=0;i<json.length;i++){
			$('.manage_table').append(
				"<tr>"+
					"<td class='stock_no'>"+json[i].stockNo+"</td>"+
					"<td>"+json[i].title+"</td>"+
					"<td class='isStock' id=isStock"+i+">"+json[i].stock+"</td>"+
					"<td><button class='deleteBtn'>삭제</button></td>"+
				"</tr>"	
			);
		}
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
			$('#isStock'+i).css('color','black');
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
function findData(keyword,table,button) {
	$.ajax({
		type:'post',
		url:'../admin/findShopStock.do',
		data:{'keyword':keyword,'table':table},
		success:function(result){
			let json=JSON.parse(result);
			$('.manage_table tr').remove();
			 $('.row_button button').remove();
			 make_tr(json,button);
			 $('.nomal_div').attr('class','find_div');
		},error:function(error){
			alert("검색 에러");
		}
	
	})
}
/* 업데이트전 데이터 가져오기 */
function make_updateData(cno,no){
	$.ajax({
		type:'post',
		data:{'cno':cno,'no':no},
		url:'../admin/shop_updateData.do',
		success:function(result){
			let json=JSON.parse(result);
			$('#title_input').val(json.title);
			let price=json.price.replace(/,/g, "");
			$('#price_input').val(price);
			$('#update_hidden_no').attr('value',json.no);
		},error:function(error){
			alert("수정불러오기 오류");
		}
		
	})
}
function deleteShopList(no,cno){
	$.ajax({
		type:'post',
		data:{'cno':cno,'no':no},
		url:'../admin/shop_deleteData.do',
		success:function(result){
			let json=JSON.parse(result);
			
		},error:function(error){
			alert("삭제 오류");
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
	    <form method="post" action="../admin/insert_product.do" enctype="multipart/form-data" id="form">
	    <table class="insert_table" id="insert_table_main">
	    	<tr>
	    		<th width=30%>카테고리</th>
	    		<td>
	    			<label>
	    			<input type="radio" value="1" name="cno" class="insert_input">식품</label>
	    			<label>
	    			<input type="radio" value="2"name="cno" class="insert_input">운동용품</label>
	    			<span id="update_no">번호 <input type="number" style="width: 70px;" id="update_no_input"></span>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th width=30%>상품명</th>
	    		<td>
	    			<input type="text" size="30" class="insert_input" name="title" id="title_input">
	    			<input type="hidden" name="no" value="1" id="update_hidden_no">
	    		</td>
	    	</tr>
	    	<tr>
	    		<th width=30%>가격</th>
	    		<td>
	    			<input type="text" size="10" class="insert_input" name="price" id="price_input">
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