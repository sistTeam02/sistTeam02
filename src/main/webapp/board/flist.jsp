<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
  width:900px;
  margin: 0px auto;
}
h1 {
  text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
/*$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});*/
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
$(document).on("keyup","#ffind_input",function(){
	   let ss=$(this).val();
	   let fs=$(this).val();
	    if(ss!=""){
           findData(fs, ss);
	    }
	    else{
	    	$('td[id^=f]').show();
	    }
	    

})
function findData(fs,ss) {
	$.ajax({
		type:'post',
		url:'../board/ffind.do',
		data:{'fs':fs,'ss':ss},
		success:function(json){
			try
			{
			let jsonData=JSON.parse(json);
			$('td[id^=f]').hide();
			for(let i=0;i<json.length;i++)
			{
				$('#find_table').append(
			            '<tr>'
				       +'<td width=10% class="text-center">'+json[i].no+'</td>'
				       +'<td width=45% class="text-left">'
				       +'<a href="../board/fdetail.do" data-toggle="popover" title="'+json[i].subject+'" data-content="'+json[i].content+'">'+json[i].subject+'</a>'
				       +'</td>'
				       +'<td width=15% class="text-center">'+json[i].name+'</td>'
				       +'<td width=20% class="text-center">'+json[i].regdate+'</td>'
				       +'<td width=10% class="text-center">'+json[i].hit+'</td>'
				       +'</tr>'
				  );
			}
			//$('#find_table').html(Data);
			}catch(Exception)
			{
				ex.printStackTrace();
			}
			
		},error:function(error){
			alert("검색 에러");
		}
	
	})
	
}
 /*(document).on("keyup","#find_input",function(){
	 let ss=$(this).val();
	 let fs=$(this).val();
	 button++;
	 console.log(fs);
	 if(fs!=""){
	 	findData(fs, ss,button);
	 }
	 button--;
 });

function findData(fs,ss,button) {
	$.ajax({
		type:'post',
		url:'../board/ffind.do',
		data:{'fs':fs,'ss':ss},
		success:function(result){
			let json=JSON.parse(result);
			$('.find_table').remove();
			 make_tr(json,button);
		},error:function(error){
			alert("검색 에러");
		}
	
	})
}*/
</script>
</head>
<body>
 <div style="height:50px"></div>
 <div class="container-fluid">
  <h1>자유게시판</h1>
  <div class="row">
  <jsp:include page="board_menu.jsp"/>
  <div class="col-lg-9">
  <table class="table">
  <tr>
   <td class="text-right">
    <a href="../board/finsert.do" class="btn btn-sm btn-warning">글쓰기</a> 
   </td>
  </tr>
  </table>
   <table class="table" id="find_table">
    <tr class="info">
     <th width=10% class="text-center" id="no">번호</th>
     <th width=45% class="text-center" id="subject">제목</th>
     <th width=15% class="text-center" id="name">이름</th>
     <th width=20% class="text-center" id="regdate">작성일</th>
     <th width=10% class="text-center" id="hit">조회수</th>
    </tr>
    <c:forEach var="vo" items="${list }">
     <tr>
      <td width=10% class="text-center" id="fno">${vo.no }</td>
      <td width=45% id="fsubject">
       <a href="../board/fdetail.do?no=${vo.no}&page=${curpage}">${vo.subject }</a>
       </td>
      <td width=15% class="text-center" id="fname">${vo.name }</td>
      <td width=20% class="text-center" id="fregdate">${vo.dbday }</td>
      <td width=10% class="text-center" id="fhit">${vo.hit }</td>
     </tr>
    </c:forEach>
   </table>
   <table class="find_searchbar">
    <tr>
     <td class="text-left">
      Search:<select name="fs" class="input-sm">
       <option value="N">이름</option>
       <option value="S">제목</option>
       <option value="C">내용</option>
       <option value="NS">이름+제목</option>
       <option value="NC">이름+내용</option>
       <option value="SC">제목+내용</option>
       <option value="NSC">이름+제목+내용</option>
      </select>
      <input type="text" name=ss size=15 id="ffind_input">
      <button class="btn btn-sm btn0-primary">검색</button>
     </td>
     </tr>
     </table>
     <table class="table">
     <tr>
       <td class="text-center">
         <ul class="pagination">
             <li><a href="#">&lt;</a></li>
	         <c:forEach var="i" begin="${startPage }" end="${endPage }">
	           <li><a href="../board/flist.do?page=${i }">${i }</a></li>
	         </c:forEach>
	         <li><a href="#">&gt;</a></li>
	     </ul>
       </td>
     </tr>
   </table>
  </div>
 </div>
 </div>
</body>
</html>