<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	
	// 댓글 추가
	$('#replyBtn').click(function(){
		let mno=$('#insert_bno').val();
		
		let msg=$('#insert_msg').val();
		// val() => <input> , <select> , <textarea>
		if(msg.trim()=="")
		{
			$('#insert_msg').focus();
			return;
		}
		$.ajax({
			type:'POST',
			url:'qreply_insert.do',
			data:{"mno":mno,"msg":msg},
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
		let mno=$('#update_bno'+data_no).val();
	
		let msg=$('#update_msg'+data_no).val();
		if(msg.trim()=="")
		{
			$('#update_msg'+data_no).focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'qreply_update.do',
			data:{"no":no,"mno":mno,"msg":msg},
			success:function(result)
			{
				$('#reply_data').html(result);
			}
		})
	})
	// 댓글 댓글 올리기 
	$('.rrBtn').click(function(){
		let data_no=$(this).attr("data-no");
		let pno=$('#rr_insert_pno'+data_no).val();
		let mno=$('#rr_insert_bno'+data_no).val();
		
		let msg=$('#rr_insert_msg'+data_no).val();
		if(msg.trim()=="")
		{
			$('#rr_insert_msg'+data_no).focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'qreply_to_reply_insert.do',
			data:{"pno":pno,"mno":mno,"msg":msg},
			success:function(result)
			{
				$('#reply_data').html(result);
			}
		})
	})
	// 삭제하기
	$('.delBtn').click(function(){
		
		let no=$(this).attr("data-no");
		let mno=$(this).attr("data-bno");
		let page=$(this).attr("data-page");
		$.ajax({
			type:'get',
			url:'qreply_delete.do',
			data:{"no":no,"mno":mno},
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
	<c:forEach var="qvo" items="${qList }">
       <table class="table">
        <tr>
          <td class="text-left">
           <c:if test="${qvo.group_tab>0 }">
             <c:forEach var="i" begin="1" end="${qvo.group_tab }">
               &nbsp;&nbsp;
             </c:forEach>
             <img src="icon.jpeg" width="35px" height="25px">
           </c:if>
            ${qvo.id }(${qvo.regdate })
          </td>
          <td class="text-right">
            <c:if test="${sessionScope.id!=null }">
              <c:if test="${sessionScope.id=='hong' }">
                <span class="btn1 btn-xs btn-success updateBtn" data-no="${qvo.no }">수정</span>
                <span data-no="${qvo.no }" data-bno="${no}" data-page="${page}" class="btn1 btn-xs btn-info delBtn">삭제</span>
                
              </c:if>
            </c:if>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <c:if test="${qvo.group_tab>0 }">
             <c:forEach var="i" begin="1" end="${qvo.group_tab }">
               &nbsp;&nbsp;
             </c:forEach>
            </c:if>
            <pre style="white-space: pre-wrap;border:none;background-color:white;">${qvo.msg }</pre>
          </td>
        </tr>
        <%--수정 데이터 --%>
           <tr class="updates" style="display:none" id="m${qvo.no }">
	         <td class="text-center" colspan="2">
	           <input type="hidden" name=no value="${qvo.no }" id="update_no${qvo.no }">
	           <input type="hidden" name=bno value="${no }" id="update_bno${qvo.no }">
	           
	           <textarea rows="3" cols="120" name="msg" style="float: left" id="update_msg${qvo.no }">${qvo.msg }</textarea>
	           <button class="btn2 btn-sm btn-primary uBtn" style="height: 80px;float:left"
	            data-no="${qvo.no }"
	           >댓글수정</button>
	         </td>
	        </tr>
	     <%-- 댓글올리기 --%>
	       <tr class="inserts" style="display:none" id="in${qvo.no }">
	         <td class="text-center" colspan="2">
	          <!-- <form method="post" action="reply_to_reply_insert.do"> -->
	           <input type="hidden" name=pno value="${qvo.no }" id="rr_insert_pno${qvo.no }">
	           <input type="hidden" name=bno value="${no }" id="rr_insert_bno${qvo.no }">
	           
	           <textarea rows="3" cols="120" name="msg" style="float: left" id="rr_insert_msg${qvo.no }"></textarea>
	           <input type=button class="btn1 btn-sm btn-primary rrBtn" style="width:500px;height: 80px;float:left"
	             value=댓글 data-no="${qvo.no }">
	          <!-- </form> -->
	         </td>
	        </tr>
       </table>
      </c:forEach>
      <c:if test="${sessionScope.id!=null }">
      <c:if test="${sessionScope.id=='hong' }">
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
      </c:if>
</body>
</html>