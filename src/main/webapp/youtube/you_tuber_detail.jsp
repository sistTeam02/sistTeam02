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
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section ds -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
              <!-- 사이트 바 -->
             <!--    <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    
                </div> -->
                 
                <div class="col-lg-12 order-1 order-lg-2">
                    <div class="product-show-option">
                        <div class="row">
                            <div class="col-lg-5 col-md-7">
                                <div class="select-option">
                                    <select class="sorting">
                                        <option value="">Default Sorting</option>
                                    </select>
                                    <select class="p-show">
                                        <option value="">Show:</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7">
	                            <form method="post" action="../youtube/input.do">
	                            <div class="select-option">
	                                
									  <a href="../youtube/you_tuber_detail.do?cno=${youtuberName.cno }">
									<h3>${youtuberName.channeltitle } </h3>
									</a>
									  <div class="filter-widget">
									<input type=hidden name="cno" value="${youtuberName.cno }">
									<c:if test="${sessionScope.id!=null}">
									<input type="submit"  value="수강찜" class="filter-btn">
									</c:if>
									<c:if test="${sessionScope.id==null}">
									<a href="../member/login.do"><span  class="filter-btn">로그인 이용</span></a>
									</c:if>
									</div>
	                            </div>
	                            </form>
                    		</div>
                    	</div>
                    <div class="product-list">
                        <div class="row">
                           <c:forEach var="vo" items="${ylist }">
                               <div class="col-lg-3">
                                   <a href="../youtube/you_detail.do?no=${vo.no }">
                                     <img src="${vo.thumbnails }">
                                        <div class="pi-text text-center">
	                                       <p>${vo.title }</p>
	                                       <sub>${vo.channeltitle }</sub>
	                                    </div>
	                               </a>
	                    
                               </div>
                            </c:forEach>    
                         </div>
                     </div>
             </div>
         </div>
         <div style="height:30px"></div>
        <%--  <c:forEach var="vo" items="${ylist }"> --%>
       
 	<%-- 	</c:forEach> --%>
 	
      </div>
      
       <div class="col-lg-12">
		<ul class="pagination" >
		<c:if test="${startPage>1 }">
		  <a href="../youtube/you_tuber_detail.do?cno=${cno }&page=${startPage-1}"><li class="page">&lt;</li></a>
		 </c:if>
		<c:forEach var="i" step="1" begin="${startPage }" end="${endPage }">
			<a href="../youtube/you_tuber_detail.do?cno=${cno }&page=${i}">
			<c:if test="${curpage==i}">
		  		<li class="page_active">
		  	</c:if>
		  	<c:if test="${curpage!=i }">
		  		<li class="page">
		  	</c:if>
		  ${i }</li></a>
		</c:forEach>
		<c:if test="${endPage<allPage }">
		  <a href="../youtube/you_tuber_detail.do?cno=?${cno }&page=${endPage+1}"><li class="page">&gt;</li></a>
		 </c:if>
		</ul>
		</div>
    </section>
    <!-- Product Shop Section End -->
</body>
</html>