<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.page {
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0px;
  font-family: Arial;
  color: #000000;
  font-size: 15px;
  background: #ffffff;
  padding: 10px 15px 10px 15px;
  border: solid #d6d6d6 2px;
  text-decoration: none;
}

.page:hover {
  background: #e0e0e0;
  text-decoration: none;
}
.page_active {
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0px;
  font-family: Arial;
  color: #ffffff;
  font-size: 15px;
  background: #648bff;
  padding: 10px 15px 10px 15px;
  text-decoration: none;
  border: solid #648bff 2px;
}

.page_active:hover {
  text-decoration: none;
}

.pagination{
	 justify-content: center; 
}
.btn {
  -webkit-border-radius: 15;
  -moz-border-radius: 15;
  border-radius: 15px;
  font-family: Arial;
  color: #ffffff;
  font-size: 15px;
  background: #648bff;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
}

.btn:hover {
  background: #3cb0fd;
  text-decoration: none;
  color: #ffffff;
}
</style>

</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="../main/main.do"><i class="fa fa-home"></i> Home</a>
                        <span>'${search }'의 
            <c:if test="${no==1 }">무료 홈 트레이닝</c:if>
            <c:if test="${no==4 }">유튜브 홈 트레이닝</c:if>
            <c:if test="${no==2 }">건강 식품</c:if>            
            <c:if test="${no==3 }">운동 기구 /용품</c:if>       
                         검색 결과</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
        	
            <div class="row">         
                    <div class="product-list">
                        <div class="row">
                           <c:forEach var="vo" items="${list }">
                               <div class="col-lg-3">
                               <c:if test="${no==2 }">
                                  <a href="../shop/dfood_detail.do?no=${vo.no }">     
                               </c:if>
                               <c:if test="${no==3 }">
                                  <a href="../shop/shop_detail_before.do?no=${vo.no }">
                               </c:if>
                               <c:if test="${no==1 }">
                                  <a href="#">
                               </c:if>
                                <c:if test="${no==4 }">
                                  <a href="../youtube/you_detail.do?no=${vo.no }">
                               </c:if>
                               		<c:if test="${no!=4 }">
                                     <img src="${vo.poster }">
                                    </c:if>
                                    <c:if test="${no==4 }">
                                     <img src="${vo.thumbnails }">
                                    </c:if>
 
                                        <div class="pi-text text-center">
	                                       <p>${vo.title }</p>
	                                    </div>
	                              </a>
	                          
	                              <c:if test="${no!=1 && no!=4 }">
	                              <div class="product-price text-center" style="font-size:13pt;font-weight:bold;color:#648cff;height:55px">
	                              	<c:if test="${no!=3 }">
	                                  <span>${vo.price }&nbsp;원</span>
	                                 </c:if>
	                                 <c:if test="${no==3 }">
	                                 	<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price}" />&nbsp;원</span>
	                                 </c:if>
	                              </div>
	                              </c:if>
                               </div>
                            </c:forEach>    
                         </div>
                     </div>
         </div>
<!-- pagination -->
		<div style="height:30px"></div>
		<ul class="pagination" >
		<c:if test="${startPage>1 }">
		  <a href="../main/search_category.do?no=${no }&search=${search }&page=${startPage-1}"><li class="page">&lt;</li></a>
		 </c:if>
		<c:forEach var="i" step="1" begin="${startPage }" end="${endPage }">
			<a href="../main/search_category.do?no=${no }&search=${search }&page=${i}">
			<c:if test="${curpage==i}">
		  		<li class="page_active">
		  	</c:if>
		  	<c:if test="${curpage!=i }">
		  		<li class="page">
		  	</c:if>
		  ${i }</li></a>
		</c:forEach>
		<c:if test="${endPage<allPage }">
		  <a href="../main/search_category.do?no=${no }&search=${search }&page=${endPage+1}"><li class="page">&gt;</li></a>
		 </c:if>
		</ul>
      </div>
    </section>
    <!-- Product Shop Section End -->
</body>
</html>