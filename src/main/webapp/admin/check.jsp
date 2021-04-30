<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#check_container{

    height: 56em;

}
.row_button{
    height: 3em;
    padding: 0px 36em;
    text-align: center;
}
.pageBtn,.moveBtn{
    background-color: white;
    border-radius: 5px;
    width: 40px;
    height: 40px;
    margin: 6px 7px;
}
.okBtn{
    background: #ff6464;
    border: 1px solid #a76767;
    width: 78px;
    border-radius: 11px;
    height: 3em;
    padding: 0px;
    color: #f7ebeb;
}
.cokBtn{
	background: #648cff;
    border: 1px solid #c797ff;
    width: 78px;
    border-radius: 11px;
    height: 3em;
    padding: 0px;
    color: #000000;
}
.row_sBtn{
    text-align: right;
    padding-right: 24.9em;
}
.sBtn{
    background: #ff6464;
    border: 1px solid #a76767;
    width: 78px;
    border-radius: 11px;
    height: 3em;
    padding: 0px;
    color: #f7ebeb;
    cursor: pointer;
    
}

.sBtn:hover{
	background: #648cff;
    transition-delay: 0.1s;
}
.pageBtn:hover,moveBtn:hover{
    background-color: #648cff;
}
.modal{
}
.modal_content{

}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	let totalpage=db_totalpage();
$(document).ready(function(){
	let page=1;
	list_data(page);
	
});
/* 페이지이동 이벤트 */
$(document).on('click','button[class^=pageBtn]',function(){
	$('#basket_tbody > tr').remove();
	let page=$(this).text();
	list_data(page);
});
/* 승인버튼 이벤트*/
$(document).on('click','button[class^=okBtn]',function(){
	$(this).attr('class','cokBtn');
	$(this).text('승인완료');
	$(this).attr('value',"1");
});
/* 승인취소버튼 이벤트*/
$(document).on('click','button[class^=cokBtn]',function(){
	$(this).attr('class','okBtn');
	$(this).text('승인대기');
	$(this).attr('value',"0");
});
/* 저장버튼 이벤트*/
$(document).on('click','.sBtn',function(){
	saveBtn();
});
/* 페이지10개이동 */
$(document).on('click','#moveBtn_r',function(){
	let a=$(this).prev().text();
	list_data(a+1);
});
/* 페이지10개이동 */
$(document).on('click','#moveBtn_l',function(){
	let a=$(this).next().text();
	list_data(a-10);
});
/* 리스트가져오기 10개씩 */
function list_data(page) {
	$.ajax({
		type:'get',
		data:{'page':page},
		url:'../admin/user_purchaseList.do',
		success:function(result){
			$('.pageBtn').remove();
			$('.moveBtn').remove();
			let json=JSON.parse(result);
			let endpage=totalpage;
			let startpage=Math.floor((page-1)/10)*10+1;
			make_tr(json);
			okbtn_text();
			same_id_del();
			for(i=startpage;i<=startpage+9;i++){
				if(i>endpage){
					break;
				}
				make_pageBtn(i);
			}
			pageBtn_makeicon(page);
		},error:function(error){
			alert("구매내역출력오류")
		}	
	})
}
/* 가져온데이터로 테이블 row만들기 */
function make_tr(json) {
	for(i=0;i<json.length;i++){
		$('#basket_tbody').append(
			"<tr class="+json[i].id+">"+
               "<td class='cart-pic'id=id"+i+">"+json[i].id+"</td>"+
                                    "<td class='cart-title'>"+
                                        "<h5>"+json[i].title+"</h5>"+
                                    "</td>"+
                                    "<td class='p-price'>"+json[i].price+"</td>"+
                                    "<td class='qua-col'>"+
                                        "<div class='quantity'>"+
                                            "<div class='pro-qty'>"+
                                                "<input type='text' value="+json[i].ordercount+">"+
                                            "</div>"+
                                        "</div>"+
                                    "</td>"+
                                    "<td class='total-price'>"+(json[i].price*json[i].ordercount)+"</td>"+
                                   " <td> <button class=okBtn id=okBtn"+i+" value="+json[i].state+" no="+json[i].no+"></button></td>"+
                                "</tr>"
		);
	}
}
/* 페이지 버튼생성 */
function make_pageBtn(page) {
	$('.row_button').append(
			"<button class=pageBtn id=pageBtn"+page+">"+page+"</button>"
		);
	}
	/* 총페이지가져오기 */
function db_totalpage() {
	let db_total="";
	$.ajax({
		type:'get',
		url:'../admin/user_purchaseList_totalpage.do',
		async: false,
		success:function(result){
			db_total=result;
			},error:function(){
				alert("totalpage오류")
			}
		});
	return db_total;
}
	/* 승인버튼 대기완료 구분생성 */
function okbtn_text() {
	for(i=0;i<10;i++){
		let state=$('#okBtn'+i).attr('value');
		if(state=="0"){
			$('#okBtn'+i).text('승인대기');
			$('#okBtn'+i).attr('class','okBtn');
		}else{
			$('#okBtn'+i).text('승인완료');
			$('#okBtn'+i).attr('class','cokBtn');
		}
		
	}
}
	/* 같은 아이디 맨윗줄제외 지우기 */
function same_id_del(){
	for(i=0;i<9;i++){
		for(j=i+1;j<10;j++){
		let id=$('#id'+i).text();
		let id2=$('#id'+j).text();
			if(id==id2){
				$('#id'+j).text('');
				
			}else{
				l=j;		
			}
			
		}
		 
	}
}
/* 저장버튼 함수 */
function saveBtn() {
		let box=[];
		for(i=0;i<10;i++){
			let state=$('#okBtn'+i).attr('value');
			let no=$('#okBtn'+i).attr('no');
			 box[i]= {"state":state,"no":no}
		}
		$.ajax({
			type:'post',
			data:{'box':JSON.stringify(box)},
			url:'../admin/save_state.do',
			success:function(result){
			window.location.href="../main/admin.do";
			},error:function(error){
				alert("상태 저장실패");
			}
		
		});
}
/* 페이지 화살표 아이콘생성 */
function pageBtn_makeicon(page) {
	if(totalpage>10){
	$('.row_button').prepend(
			"<button class=moveBtn id=moveBtn_l><i class=ti-angle-left></i></button>"
		);
	}
	if(page>10){
	$('.row_button').append(
			"<button class=moveBtn id=moveBtn_r><i class=ti-angle-right></i></button>"
		);
	}
}
</script>
<body>
	
	<section class="shopping-cart spad">
        <div class="container" id="check_container">
            <div class="row">
                <div class="col-lg-12" style="height: 893px;">
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th class="p-name">상품명</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>합계</th>
                                    <th>승인여부</th>
                                </tr>
                            </thead>
                            <tbody id="basket_tbody">
                             
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row_sBtn">
        	<button type="button" class="sBtn">저장</button>
        </div>
        <div class="row_button">
        	
        </div>
    </section>
</body>
</html>