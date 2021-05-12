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

</head>
<body>
 <div style="height:50px"></div>
 <div class="container-fluid">
  <h1>수강후기 게시판</h1>
  <div class="row">
  <!-- include 이렇게 하는게 맞나요..?? -->
  <jsp:include page="../homet_board/homet_board_menu.jsp"/>
  <div class="col-lg-9">
  <table class="table">
  <tr>
   <td class="text-right">
    <a href=../homet_board/homet_boardInsert_ok.do class="btn btn-sm btn-warning">글쓰기</a> 
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
       <a href="../homet_board/homet_boardDetail.do?no=${vo.no}&page=${curpage}">${vo.subject }</a>
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
	           <li><a href="../homet_board/homet_boardlist.do?page=${i }">${i }</a></li>
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