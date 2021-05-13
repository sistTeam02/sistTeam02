<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
  width:800px;
  margin: 0px auto;
}
h1 {
  text-align: center;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	let mno=${vo.no};
	$.ajax({
		type:'GET',
		url:'qreply_list.do',
		data:{'mno':mno},
		success:function(result)
		{
			$('#reply_data').html(result);
		}
	});
});
</script>
</head>
<body>
   <div style="height:50px"></div>
   <div class="container">
    <h1>상세보기</h1>
    <div class="row">
     <table class="table">
       <tr>
        <th width=20% class="info text-center">번호</th>
        <td width=30% class="text-center">${vo.no }</td>
        <th width=20% class="info text-center">작성일</th>
        <td width=30% class="text-center"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
       </tr>
       <tr>
        <th width=20% class="info text-center">아이디</th>
        <td width=30% class="text-center">${vo.id}</td>
        <th width=20% class="info text-center">조회수</th>
        <td width=30% class="text-center">${vo.hit }</td>
       </tr>
       <tr>
         <th width=20% class="info text-center">제목</th>
         <td colspan="3">${vo.subject}</td>
       </tr>
       <tr>
         <td colspan="4" height="200" valign="top" class="text-left">
          <pre style="white-space: pre-wrap;border:none;background-color:white">${vo.content }</pre>
         </td>
       </tr>
       <tr>
         <td colspan="4" class="text-right">
         <c:if test="${sessionScope.id==vo.id }">
           <a href="../board/qupdate.do?no=${vo.no }&page=${page}" class="btn btn-xs btn-success">수정</a>
           <a href="../board/qdelete.do?no=${vo.no }&page=${page}" class="btn btn-xs btn-warning">삭제</a>
          </c:if>
           <a href="../board/qlist.do?page=${page }" class="btn btn-xs btn-info">목록</a>
         </td>
       </tr>
     </table>
    </div>
    <div style="height: 30px"></div>
    <div class="row" id="reply_data">
      
    </div>
   </div>
</body>
</html>