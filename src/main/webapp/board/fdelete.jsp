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
  width:350px;
  margin: 0px auto;
}
h1 {
  text-align: center;
}
</style>
</head>
<body>
    <td colspan="4" class="text-right">
        <form method=post action="fdelete_ok.do" id="frm">
           비밀번호:<input type=password name=pwd size=10 class="input-sm">
                 <input type=hidden name=no value="${no }">
                 <input type=hidden name=page value="${page }">
                 <a href="../board/fdelete.do?no=${vo.no }&page=${page}"><input type=button value="삭제" class="btn btn-sm btn-primary" id="delBtn"></a>
        </form>
    </td>
</body>
</html>
