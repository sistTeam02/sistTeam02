<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2{
     text-decoration: overline #648CFF;
     }
.table-hover{
    font-size:large;
    width:1000px;
    border-bottom : 1px solid #648CFF;
 }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.post').hide();
	
 	
 	$('#postBtn').click(function(){
 		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode);
				$('#addr1').val(data.address);
			}
		}).open();
 	});
	$('#findBtn').click(function(){
	
		let dong=$('#dong').val();
		if(dong.trim()=="")
		{
			$('#dong').attr("placeholder","동을 입력하세요")
			$('#dong').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/post_result.do',
			data:{"dong":dong},
			success:function(result)
			{
				$('#print').html(result);
				$('#result_table tr').click(function(){
					let total=$(this)					
					total=total.text().trim();
					let zip=total.substring(0,7);
					let addr=total.substring(7).trim();
					console.log(total);
					console.log(zip);
					console.log(addr);
									
					$('#post').attr("value",function(code){
						
						return zip;
					});
					$('#addr1').attr("value",function(code){
						
						return addr;
					});
				});
			}
		})
	});//주소가져오기
	$('#okBtn').click(function(){
		$('.post').hide();
	});
	$('#btn1').click(function(){
 			$('#join_form').submit();
 	});
});


</script>


</head>
<body>
    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>회원정보 수정</h2>
                        <form action="../mypage/mypage_update_ok.do" method="post" id="join_form">
                            <div class="group-input">
                             	<div class="checkout__input">
	                                <label for="id">Username (ID)*</label>
	                                <input type="text" id="id" name="id" style="float:left; margin-bottom: -15px;width: 11em;" autocomplete="off" value=${vo.id } readonly>
	                                <span>&nbsp;</span>
	                                 <div class="row">
                            			<span id="checkSpan"></span>
                           			 </div>
                               		<br>
                               		<label></label>
                               		<br>
                                    <p>이름<span>*</span><span style="color: black;margin-left:15em; ">닉네임</span></p>
                                   <input type="text" name="name" id="name" class="input-sm"  placeholder="사용자 이름" style="float:left;width: 50%;" value="${vo.name }">
                                   <input type="text" name="nickname" id="nickname" class="input-sm" placeholder="사용하실 닉네임" autocomplete="off"  style="float:left;width: 50%;" value="${vo.nickname }">
                                </div>
                                
                                
                            </div>
                            <div class="group-input">
                                <label for="pwd">Password *</label>
                                <input type="password" name="pwd" id="pwd" class="input-sm"  style="float:left;margin-bottom:15px; width: 50%" placeholder="비밀번호 입력" value="${vo.pwd }">
		                        <span>&nbsp;</span>
                                 <br><br><br><br><br>
                                  <p style="width: 100%">생년월일<span>*</span></p>
                                  <input type="date" size=20 name="birth" min="1921-01-01" max="2121-12-31" value="${vo.birth }" readonly>
                                <span>&nbsp;</span>
                                  <p>email<span>*</span></p>
                                   	<input type="text" size=45 name="email" id="email" class="input-sm" placeholder="user01@google.com" style="width:20em;" autocomplete="off" value="${vo.email }">
                                <span>&nbsp;</span>
                               	 <p>Tel<span>*</span></p>
                                   	<input type="text" size=10 name="tel" id="tel" class="input-sm" autocomplete="off" placeholder="-포함 입력" style="width: 50%;" value="${vo.tel }" }>
                               	 <p>Phone<span>*</span></p>
                                   	<input type="text" size=10 name="phone" id="phone" class="input-sm" autocomplete="off" placeholder="-포함 입력" style="width: 50%;" value="${vo.phone }">
                               <!-- 주소 1우편번호2주소 3상세주소  #######################################-->
              				<div style="height: 10px"></div>
              				
                            <div class="checkout__input">
                          		<span></span>
                                <p>Address<span>*</span></p>
                                <input type="text" name="post" id="post" class="checkout__input__add " readonly placeholder="우편번호(000-000)" style="float: left; width: 11em;" value="${vo.post }">
                             	<input type="button" value="우편번호 검색" class="site-btn" id="postBtn" style="float: left; width: 9em;">
                                &nbsp;
                            </div>
                            
                         
                            <div class="checkout__input">
                                <input type="text"  placeholder="주소" name="addr1" id="addr1" style="margin-top: 15px;" readonly value="${vo.addr1 }">
                                &nbsp;
                                <input type="text"  placeholder="상세주소" name="addr2" id="addr2" style="margin-top: -15px;" autocomplete="off" value="${vo.addr2 }">
                            </div>
     						
                               
                            </div>
                            <input type="submit" class="site-btn register-btn" id="updateBtn" value="수정하기"></input>
                            <input type="button" class="site-btn register-btn" onclick="javascript:history.back()" value="취소"></input>
                        </form>
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Register Form Section End -->
     <div class="post">
            	<table class="table" style="height: 105px; border: 1px solid black;">
            	<tr>
            	<td colspan="2" >
            	<input type=text name="dong" size=10 class="input-sm" id="dong" style="margin-left: 6px;border-radius: 7px;    width: 134px;
				    height: 29px;margin-right: 7px;">
         		  <input type=button value="검색" class="btn btn-sm " id="findBtn">
         		   <input type=button value="확인" class="btn btn-sm " id="okBtn">
        	 	</td>
        	 </tr>
            		<tr>
            		<th class="text-center" width="30%">우편번호</th>
            		<th class="text-center" width="70%">주소</th>
            		</tr>
            	</table>
            	<table class=table id="print" style="height: 350px;border:1px white; ">
            	</table>
            </div>
    
</body>
</html>