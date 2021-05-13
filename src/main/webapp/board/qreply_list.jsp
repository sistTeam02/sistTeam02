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
   <c:if test="${sessionScope.msg!=null}">
       <tr>
        <th width=20% class="info text-center">관리자</th>
        <td width=30% class="text-center">${id }</td>
        <th width=20% class="info text-center">작성일</th>
        <td width=30% class="text-center"><fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/></td>
       </tr>
       <tr>
         <td colspan="4" height="200" valign="top" class="text-left">
          <pre style="white-space: pre-wrap;border:none;background-color:white">${msg }</pre>
         </td>
       </tr>
    </c:if>
     </table>
</body>
</html>