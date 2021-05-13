<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <table class="table">
     <c:if test="${vo.msg!=null }">
       <tr>
        <th width=20% class="warning text-center">관리자</th>
        <td width=30% class="text-center">${vo.id }</td>
        <th width=20% class="warning text-center">작성일</th>
        <td width=30% class="text-center">${vo.regdate }</td>
       </tr>
       <tr>
         <th width=20% class="warning text-center">답변</th>
         <td colspan="3" height="100" valign="top" class="text-left">${vo.msg }</td>
       </tr>
      </c:if>
     </table>
</body>
</html>