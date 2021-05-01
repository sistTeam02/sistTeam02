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
    height: 100%;
    width: 68em;
    margin: 0em 5em;
}

.main_tr{
    text-align: center;
    font-size: 33pt;
    height:9em;
    background-color: #80808033;
}
.row_button{
    height: 3em;
    padding: 0px 36em;
    text-align: center;
}
.qna_tr{
	background-color: #fbfbfb;
    border: 1px double black;
    height: 48px;
}
.qna_tr_content{
display: none;
}
.qna_textarea{
	width: 100%;
    height: 18em;
    overflow-x: hidden;
    overflow-y: auto;
    border: none;
    padding-left: 35px;
    padding-top: 18px;
    resize: none;
}
.answer_textarea{
    width: 100%;
    resize: none;
    height: 8em;
    margin-left: 25px;
    background-color: #f5f4f3;
    margin-bottom: 15px;
}
.qna_iBtn,.qna_cBtn{
    background-color: white;
    border-radius: 5px;
    width: 70px;
    height: 40px;
    margin: 6px 7px;	
}
.pna_iBtn:hover{
	background-color: #648cff;
}
.iBtn_td{
	text-align: center;
	width: 130px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	mainpage_table();
});
/* 전체보기클릭 이벤트 */
$(document).on("click","#qna_allData",function(){
	$('.admin_table tr').remove();
	let page=1;
	qna_allDataList(page);
	
});
/* 페이지이동 이벤트 */
$(document).on('click','button[class^=pageBtn]',function(){
	$('.admin_table tr').remove();
	let page=$(this).text();
	qna_allDataList(page);
});
/* QnA tr클릭 */
$(document).on("click",".qna_tr",function(){
	$('.qna_tr_content').hide();
	$('.admin_qna_textarea_tr').remove();
	let content_id=$(this).next().attr('id');
	$(this).next().show();
	let qnaboard_no=$(this).attr('no');
	answer_inputMake(content_id,qnaboard_no);
});
/* 등록버튼클릭 */
$(document).on("click","button[class^=qna_iBtn]",function(){
	let qnaboard_no=$(this).parent().parent().attr('no');
	answer_data(qnaboard_no);
});
/* qna취소버튼클릭 */
$(document).on("click",".qna_cBtn",function(){
	$('.qna_tr_content').hide();
	$('.admin_qna_textarea_tr').remove();
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
/* 첫화면테이블 */
function mainpage_table() {
		$('.admin_table').append(
			"<tr class='main_tr'><td>버튼을 선택해주세요.</td></tr>"		
		)
}
/* 전체보기함수 */
function qna_allDataList(page){
	let totalpage=db_totalpage();
	$.ajax({
		type:'post',
		data:{'page':page},
		url:'../admin/userQnAList.do',
		success:function(result){
			$('.pageBtn').remove();
			$('.moveBtn').remove();
			let json=JSON.parse(result);
			let startpage=Math.floor((page-1)/10)*10+1;
			make_tr(json);
			endpage=totalpage;
			for(i=startpage;i<=startpage+9;i++){
				if(i>endpage){
					break;
				}
				make_pageBtn(i);
			}
			pageBtn_makeicon(page,totalpage);
		},error:function(error){
			alert("QnA리스트 호출 에러")
		}
		
	})
}
/* 가져온데이터로 테이블 row만들기 */
function make_tr(json) {
	for(i=0;i<json.length;i++){
		$('.admin_table').append(
			"<tr class='qna_tr' no="+json[i].no+" id=qna_tr"+i+">"+
			 "<td>"+json[i].no+"</td>"+
               "<td id=id"+i+">"+json[i].id+"</td>"+
                                    "<td>"+json[i].subject+"</td>"+
                                    "<td>"+json[i].regdate+"</td>"+
                                    "<td>"+json[i].answer+"</td>"+                          
                                "</tr>"+
                          "<tr class='qna_tr_content' id=qna_content_tr"+i+"><td colspan=5><textarea class='qna_textarea'>"+json[i].content+"</textarea></td></tr>"
		);
	}
}
function db_totalpage() {
	let db_total="";
	$.ajax({
		type:'get',
		url:'../admin/user_qna_totalpage.do',
		async: false,
		success:function(result){
			db_total=result;
			},error:function(){
				alert("totalpage오류")
			}
		});
	return db_total;
}
/* 페이지 버튼생성 */
function make_pageBtn(page) {
	$('.row_button').append(
			"<button class=pageBtn id=pageBtn"+page+">"+page+"</button>"
		);
	}
/* 페이지 화살표 아이콘생성 */
function pageBtn_makeicon(page,totalpage) {
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
/* input,insert버튼생성 =>트랜잭션 써야됨  댓글 insert하고 state update하고*/
function answer_inputMake(id,no) {
	$('#'+id).after(
		"<tr class='admin_qna_textarea_tr' no="+no+"><td colspan=4><textarea class='answer_textarea'></textarea></td>"+
			"<td colspan=1 class='iBtn_td'>"+
			"<button class='qna_iBtn'>등록</button>"+
			"<button class='qna_cBtn'>취소</button>"+
			"</td>"+
		"</tr>"		
	);
}
/* 데이터전송 */
function answer_data(no) {
	let msg=$('.answer_textarea').val();
	box={/* qna번호+답변 */
			"mno":no,
			"msg":msg
	}
	$.ajax({
		type:'post',
		data:{'box':JSON.stringify(box)}, 
		url:'../admin/qna_answerInsert.do',
		success:function(result){
			alert("답변 insert성공");
		},error:function(error){
			alert("답변 insert오류");
		}
	})
}
</script>

</head>
<body>
	
	<table class="admin_table">
	
	</table>
	<div class="row_button">
        	
    </div>
</body>
</html>