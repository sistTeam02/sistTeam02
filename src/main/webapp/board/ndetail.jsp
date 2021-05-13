<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <th width=20% class="info text-center">작성자</th>
        <td width=30% class="text-center">${vo.name}</td>
        <th width=20% class="info text-center">조회수</th>
        <td width=30% class="text-center">${vo.hit }</td>
       </tr>
       <tr>
         <th width=20% class="info text-center">제목</th>
         <td colspan="3">${vo.subject}</td>
       </tr>
       <tr>
         <tr>
           <th width=20% class="info text-center">첨부파일</th>
           <td colspan="3">
             <ul style="list-style-type: none">
               <c:forEach var="f" items="${fn }" varStatus="s">
                 <li><a href="download.do?fn=${f }">${f }</a>(${fs[s.index]}Bytes)</li>
               </c:forEach>
             </ul>
           </td>
         </tr>
         <td colspan="4" height="200" valign="top" class="text-left">
          <pre style="white-space: pre-wrap;border:none;background-color:white">${vo.content }</pre>
         </td>
       </tr>
       <tr>
         <td colspan="4" class="text-right">
          <c:if test="${sessionScope.name=='홍길동' }">
           <a href="../board/nupdate.do?no=${vo.no }&page=${page}" class="btn btn-xs btn-success">수정</a>
           <a href="../board/ndelete.do?no=${vo.no }&page=${page}" class="btn btn-xs btn-warning">삭제</a>
          </c:if>
           <a href="../board/nlist.do?page=${page }" class="btn btn-xs btn-info">목록</a>
         </td>
       </tr>
     </table>
    </div>
   </div>
</body>
</html>
