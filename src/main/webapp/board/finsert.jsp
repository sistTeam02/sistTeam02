<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <div style="height: 50px"></div>
  <div class="container">
   <h1>글쓰기</h1>
   <div class="row">
    <form method="post" action="../board/finsert_ok.do"><!-- .do : BoardController -->
    <table class="table table-hover">
     <tr>
       <td width=15% class="text-right info">작성자</td>
       <td width=85%>
         <input type=text name=name size=15 class="input-sm" value="${name}" readonly style="border: none;">
       </td>
     </tr>
     <tr>
       <td width=15% class="text-right info">제목</td>
       <td width=85%>
        <input type=text name=subject size=45 class="input-sm">
       </td>
     </tr>
     <tr>
       <td width=15% class="text-right info">내용</td>
       <td width=85%>
        <textarea rows="10" cols="48" name=content></textarea>
       </td>
     </tr>
     <tr>
       <td width=15% class="text-right info">비밀번호</td>
       <td width=85%>
        <input type=password name=pwd size=10 class="input-sm">
       </td>
     </tr>
     <tr>
       <td colspan="2" class="text-center">
        <input type=submit value="등록" class="btn btn-sm btn-warning">
        <input type=button value="취소" class="btn btn-sm btn-danger"
         onclick="javascript:history.back()">
       </td>
     </tr>
    </table>
    </form>
   </div>
  </div>
</body>
</html>