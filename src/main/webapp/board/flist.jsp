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
<script>
/*$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});*/
$(document).on(function(){
	$('.ffind_input').keyup(function(){
		
})
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
   <table class="table">
    <tr class="info find">
     <th width=10% class="text-center">번호</th>
     <th width=45% class="text-center">제목</th>
     <th width=15% class="text-center">이름</th>
     <th width=20% class="text-center">작성일</th>
     <th width=10% class="text-center">조회수</th>
    </tr>
    <c:forEach var="vo" items="${list }">
     <tr id="find_table">
      <td width=10% class="text-center">${vo.no }</td>
      <td width=45%>
       <a href="../board/fdetail.do?no=${vo.no}&page=${curpage}">${vo.subject }</a>
       </td>
      <td width=15% class="text-center">${vo.name }</td>
      <td width=20% class="text-center"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/> </td>
      <td width=10% class="text-center">${vo.hit }</td>
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
     <!--  <div style="height:30px"></div>
     <ul class="pagination" >
		<c:if test="${startPage>1 }">
		  <a href="../board/flist.do?page=${startPage-1}"><li class="page">&lt;</li></a>
		 </c:if>
		<c:forEach var="i" step="1" begin="${startPage }" end="${endPage }">
			<a href="../board/flist.do?page=${i}">
			<c:if test="${curpage==i}">
		  		<li class="page_active">
		  	</c:if>
		  	<c:if test="${curpage!=i }">
		  		<li class="page">
		  	</c:if>
		  ${i }</li></a>
		</c:forEach>
		<c:if test="${endPage<allPage }">
		  <a href="../board/flist.do?page=${endPage+1}"><li class="page">&gt;</li></a>
		 </c:if>
		</ul> -->
  </div>
 </div>
 </div>
</body>
</html>