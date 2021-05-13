<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type X-UA-Compatible" content="text/html; charset=UTF-8; IE=edge">
<title>Insert title here</title>
	<meta name="description" content="Colo Shop Template">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="Fashi, unica, creative, html">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<!-- <link rel="stylesheet" type="text/css" href="../styles/bootstrap4/bootstrap.min.css"> -->
	<link href="../plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" href="../plugins/themify-icons/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="../plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="../styles/single_styles.css">
	<link rel="stylesheet" type="text/css" href="../styles/single_responsive.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <!-- <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css"> -->
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let u=0;
let i=0;
$(function(){
	$('.btn1').css("cursor","pointer");
	$('.updateBtn').click(function(){
		$('.updates').hide();
		$('.inserts').hide();
		let no=$(this).attr("data-no");
		if(u==0)
		{
			$('#m'+no).show();
			$(this).text("취소");
			u=1;
		}
		else
		{
			$('#m'+no).hide();
			$(this).text("수정");
			u=0;
		}
	})
	$('.insertBtn').click(function(){
		$('.updates').hide();
		$('.inserts').hide();
		let no=$(this).attr("data-no");
		if(i==0)
		{
			$(this).text("취소");
			$('#in'+no).show();
			i=1;
		}
		else
		{
			$(this).text("댓글");
			$('#in'+no).hide();
			i=0;
		}
	});
	
	// 댓글 작성
	$('#replyBtn').click(function(){
		let bno=$('#insert_pno').val();
		
		let msg=$('#insert_msg').val();
		// val() => <input> , <select> , <textarea>
		if(msg.trim()=="")
		{
			$('#insert_msg').focus();
			return;
		}
		$.ajax({
			type:'POST',
			url:'shop_reply_insert.do',
			data:{"pno":pno,"msg":msg},
			success:function(result)
			{
				$('#reply_data').html(result);
			}
		})
	});
	// 댓글 수정 
	$('.uBtn').click(function(){
		let data_no=$(this).attr("data-no");
		let no=$('#update_no'+data_no).val();
		let bno=$('#update_bno'+data_no).val();
	
		let msg=$('#update_msg'+data_no).val();
		if(msg.trim()=="")
		{
			$('#update_msg'+data_no).focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'shop_reply_update.do',
			data:{"no":no,"pno":pno,"msg":msg},
			success:function(result)
			{
				$('#reply_data').html(result);
			}
		})
	})
	/* // 대댓글 올리기 
	$('.rrBtn').click(function(){
		let data_no=$(this).attr("data-no");
		let pno=$('#rr_insert_pno'+data_no).val();
		let bno=$('#rr_insert_bno'+data_no).val();
		
		let msg=$('#rr_insert_msg'+data_no).val();
		if(msg.trim()=="")
		{
			$('#rr_insert_msg'+data_no).focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'shop_reply_to_reply_insert.do',
			data:{"pno":pno,"bno":bno,"msg":msg},
			success:function(result)
			{
				$('#reply_data').html(result);
			}
		})
	}) */
	// 삭제하기
	$('.delBtn').click(function(){
		
		let no=$(this).attr("data-no");
		let bno=$(this).attr("data-bno");
		let page=$(this).attr("data-page");
		$.ajax({
			type:'get',
			url:'shop_reply_delete.do',
			data:{"no":no,"pno":pno},
			success:function(result)
			{
				$('#reply_data').html(result);
			}
		})
	})
	
})
</script>
</head>
<body>
							<c:forEach var="svo" items="${rList }">
						       <table class="table">
						        <tr>
						          <td class="text-left">
						           <c:if test="${svo.group_tab>0 }">
						             <c:forEach var="i" begin="1" end="${svo.group_tab }">
						               &nbsp;&nbsp;
						             </c:forEach>
						             <img src="icon.jpeg" width="35px" height="25px">
						           </c:if>
						            ${svo.name }(${svo.dbday })
						          </td>
						          <td class="text-right">
						            <c:if test="${sessionScope.id!=null }">
						              <c:if test="${sessionScope.id==svo.id }">
						                <span class="btn1 btn-xs btn-success updateBtn" data-no="${svo.no }">수정</span>
						                <span data-no="${svo.no }" data-pno="${pno}" data-page="${page}" class="btn1 btn-xs btn-info delBtn">삭제</span>
						                
						              </c:if>
						              <span class="btn1 btn-xs btn-danger insertBtn" data-no="${svo.no }">댓글</span>
						            </c:if>
						          </td>
						        </tr>
						        <tr>
						          <td colspan="2">
						            <c:if test="${svo.group_tab>0 }">
						             <c:forEach var="i" begin="1" end="${svo.group_tab }">
						               &nbsp;&nbsp;
						             </c:forEach>
						            </c:if>
						            <pre style="white-space: pre-wrap;border:none;background-color:white;">${svo.msg }</pre>
						          </td>
						        </tr>
						        <%--수정 데이터 --%>
						           <tr class="updates" style="display:none" id="m${svo.no }">
							         <td class="text-center" colspan="2">
							           <input type="hidden" name=no value="${svo.no }" id="update_no${svo.no }">
							           <input type="hidden" name=bno value="${no }" id="update_bno${svo.no }">
							           
							           <textarea rows="3" cols="120" name="msg" style="float: left" id="update_msg${svo.no }">${svo.msg }</textarea>
							           <button class="btn2 btn-sm btn-primary uBtn" style="height: 80px;float:left"
							            data-no="${svo.no }"
							           >댓글수정</button>
							         </td>
							        </tr>
							     <%-- 댓글올리기 --%>
							       <tr class="inserts" style="display:none" id="in${svo.no }">
							         <td class="text-center" colspan="2">
							          <!-- <form method="post" action="reply_to_reply_insert.do"> -->
							           <input type="hidden" name=pno value="${svo.no }" id="rr_insert_pno${svo.no }">
							           <input type="hidden" name=bno value="${no }" id="rr_insert_bno${svo.no }">
							           
							           <textarea rows="3" cols="120" name="msg" style="float: left" id="rr_insert_msg${svo.no }"></textarea>
							           <input type=button class="btn1 btn-sm btn-primary rrBtn" style="height: 80px;float:left"
							             value=댓글 data-no="${svo.no }">
							          <!-- </form> -->
							         </td>
							        </tr>
						       </table>
						      </c:forEach>
						      <c:if test="${sessionScope.id!=null }">
							      <table class="table">
							        <tr>
							         <td class="text-center">
							           <input type="hidden" name=bno value="${no }" id="insert_bno">
							          
							           <textarea rows="3" cols="120" name="msg" style="float: left" id="insert_msg"></textarea>
							           <input type=button class="btn2 btn-sm btn-primary" style="height: 80px;float:left" id="replyBtn"
							           value="댓글쓰기">
							         </td>
							        </tr>
							      </table>
						      </c:if>

</body>
</html>