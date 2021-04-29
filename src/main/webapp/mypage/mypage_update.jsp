<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.post').hide();
 	$('#postBtn').click(function(){
 		$('.post').show();
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
				//$('.post').css("overflow","auto");
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
 		if(index==1){//아이디 중복인데 회원가입 버튼누름
 			$('#id').focus();
 		}else{
 			$('#join_form').submit();
 		}
 	});//중복이 안되어야 가입가능
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
                        <h2>회원 정보 수정</h2>
                        <form action="#">
                            <div class="group-input">
                                <label for="username">Username (ID)*</label>
                                <input type="text" id="username" style="float:left;">
                                <span>&nbsp;</span>
                                
                            </div>
                            <div class="group-input">
                                <label for="pass">Password *</label>
                                <input type="text" id="pass">
                                <input type="text" id="con-pass"  placeholder="Confirm Password *">
                                 <span>&nbsp;</span>
                                  <p>생년월일<span>*</span></p>
                                  <input type="date" size=20 name="birth" value="2021-01-01" min="1921-01-01" max="2121-12-31" >
                                <span>&nbsp;</span>
                                  <p>email<span>*</span></p>
                                   	<input type="text" size=45 name="email" id="email" class="input-sm" placeholder="user01@google.com" style="width:20em;" autocomplete="off">
                                <span>&nbsp;</span>
                                  <p>TEL</p>
                                        <p>Phone<span>*</span></p>
                                       	<input type="text" size=5 name="phone1" id="phone1" class="input-sm" readonly value="010" >
                                       	<input type="text" size=10 name="phone2" id="phone2" class="input-sm" autocomplete="off" placeholder="-포함 입력">
                               
                               <!-- 주소 1우편번호2주소 3상세주소  #######################################-->
              				<div class="row">
                            <div class="checkout__input">
                          		<span></span>
                                <p>Address<span>*</span></p>
                                <input type="text" name="post" id="post" class="checkout__input__add " readonly placeholder="우편번호(000-000)" style="float: left; width: 11em;">
                             	<input type="button" value="우편번호 검색" class="btn btn-sm" id="postBtn" style="float: left; width: 9em; margin-left: 7em;">
                                &nbsp;
                            </div>
                            </div>
                            <div class="row">
                            <div class="checkout__input">
                                <input type="text"  placeholder="주소" name="addr1" id="addr1" readonly>
                                &nbsp;
                                <input type="text"  placeholder="상세주소" name="addr2" id="addr2" style="margin-top: -15px;" autocomplete="off">
                            </div>
     						</div>
                               
                            </div>
                            <button type="submit" class="site-btn register-btn">수정하기</button>
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