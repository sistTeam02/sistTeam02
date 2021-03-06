<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">
.post{
width: 20em;
height: 28em;
position: relative;
right: -49em;
top: -34em;
display: table;
overflow: auto;
}
.checkout__input input{
	color:black;
}
.checkout {
    padding-top: 25px;
    padding-bottom: 60px;
}
.checkout__input input{
margin-left: 20em;
}
#checkBtn,#postBtn{
	margin-left: 3em;
	width: 6.5em;
	background-color: #ddf2bc
}
.checkout__input{
	width: 1140px;
}
#checkBtn:hover,#postBtn:hover,#btn1:hover,#findBtn:hover,#okBtn:hover{
    color: #fff;
    background-color: #7fad39;
    border-color: #7fad39;
}
#checkBtn:focus,#postBtn:focus,#btn1:focus{
	 box-shadow: 0 0 0 .2rem #ddf2bc;
}
#btn2:focus{
	box-shadow: 0 0 0 .2rem #ecd2d2;
}
#btn2:hover{
	 color: #fff;
    background-color:#9b344ae3;
    border-color: #fff;
}
#tel1,#phone1{
float:left;
width: 5em; 
}
#tel1::placeholder{
	font-size: 8pt;
}
#tel2,#phone2{
width: 10em;
float:left;
margin-left:2em; 
}
#btn1{
	margin-left: 29em;
}
#btn2{
	margin-left: 2em;
}
#btn1,#btn2{
	text-align:center;
	width: 6.5em;
	background-color: #ddf2bc;
	float: left;
	padding-left: 8px;	
}
#pwd1{
margin-left: 2em;
}
#addr1,#addr2{
	width: 27em;
}
#checkSpan{
	height:24px;
	display: block;
	text-align: left;
	margin-left: 20em;
	color: red;
	
} 
.table{
	font-size: 11pt;
}
.table th{
	background-color: #ddf2bc;
	border-bottom: 1px #0000003d solid;
}
#findBtn,#okBtn{
	background-color: #ddf2bc;
	width: 5em;
	text-align: center;
	height: 2.2em;
}
</style> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.post').hide();
	$('#checkBtn').click(function(){
 		
 		let id=$('#id').val();
		if(id.trim()=="")
		{
			
			$('#checkSpan').text("아이디를 입력하세요");
			$('#id').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/idCheck_result.do',
			data:{"id":id},
			success:function(result)
			{
				let count=result.trim();
				if(count==0)
				{
					$('#id').css("border", "3px solid #7fad39");
					$('#checkSpan').css("color","#7fad39")
					$('#checkSpan').text("사용가능한 ID입니다.");
					index=0;
				}
				else
				{	
					
					$('#checkSpan').text("중복된 ID가 존재합니다.");
					$('#checkSpan').css("color","red")
					$('#id').css("border","3px solid #9b344ae3");
					index=1;
				}	
			}
			
		});
		
 	});//아이디
 	
 	$('#postBtn').click(function(){
 		/* $('.post').show(); */
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
  <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>Register</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>Register</h2>
                        <form action="../member/register_ok.do" method="post" id="join_form">
                            <div class="group-input">
                             	<div class="checkout__input">
	                                <label for="username">Username (ID)*</label>
	                                <input type="text" id="id" name="id" style="float:left; margin-bottom: -15px;width: 11em;" autocomplete="off">
	                                <span>&nbsp;</span>
	                                <input type="button" value="중복체크" class="site-btn" style="float:left; width: 9em;" id="checkBtn" >
	                                 <div class=row">
                            			<span id="checkSpan"></span>
                           			 </div>
                               		<br>
                               		<label></label>
                                    <p>이름<span>*</span><span style="color: black;margin-left:15em; ">닉네임</span></p>
                                   <input type="text" name="name" id="name" class="input-sm"  placeholder="사용자 이름" style="float:left;width: 50%;">
                                   <input type="text" name="nickname" id="nickname" class="input-sm" placeholder="사용하실 닉네임" autocomplete="off"  style="float:left;width: 50%;">
                                </div>
                                
                                
                            </div>
                            <div class="group-input">
                                <label for="pass">Password *</label>
                                <input type="password" name="pwd" id="pwd" class="input-sm"  style="float:left;margin-bottom:15px; width: 50%" placeholder="비밀번호 입력">
		                        <!-- <input type="password" name="pwd" id="pwd1" class="input-sm"  style="float:left" placeholder="재입력"> -->
                                 <span>&nbsp;</span>
                                 <br><br><br>
                                  <p style="width: 100%">생년월일<span>*</span></p>
                                  <input type="date" size=20 name="birth" value="2021-01-01" min="1921-01-01" max="2121-12-31" >
                                <span>&nbsp;</span>
                                  <p>email<span>*</span></p>
                                   	<input type="text" size=45 name="email" id="email" class="input-sm" placeholder="user01@google.com" style="width:20em;" autocomplete="off">
                                <span>&nbsp;</span>
                               	 <p>Tel<span>*</span></p>
                                  <!--  	<input type="text" size=5 name="tel1" id="tel1" class="input-sm" value="지역번호" style="width: 9em; float: left;">
                                   	<input type="text" size=10 name="tel2" id="tel2" class="input-sm" autocomplete="off" placeholder="-포함 입력" style="width: 11em;"> -->
                                   	<input type="text" size=10 name="tel" id="tel" class="input-sm" autocomplete="off" placeholder="-포함 입력" style="width: 50%;">
                               	 <p>Phone<span>*</span></p>
                                   <!-- 	<input type="text" size=5 name="phone1" id="phone1" class="input-sm" readonly value="010" style="width: 9em; float: left;">
                                   	<input type="text" size=10 name="phone2" id="phone2" class="input-sm" autocomplete="off" placeholder="-포함 입력" style="width: 11em;"> -->
                                   	<input type="text" size=10 name="phone" id="phone" class="input-sm" autocomplete="off" placeholder="-포함 입력" style="width: 50%;">
                               <!-- 주소 1우편번호2주소 3상세주소  #######################################-->
              				<div style="height: 10px"></div>
              				
                            <div class="checkout__input">
                          		<span></span>
                                <p>Address<span>*</span></p>
                                <input type="text" name="post" id="post" class="checkout__input__add " readonly placeholder="우편번호(000-000)" style="float: left; width: 11em;">
                             	<input type="button" value="우편번호 검색" class="site-btn" id="postBtn" style="float: left; width: 9em;">
                                &nbsp;
                            </div>
                            
                         
                            <div class="checkout__input">
                                <input type="text"  placeholder="주소" name="addr1" id="addr1" style="margin-top: 15px;" readonly>
                                &nbsp;
                                <input type="text"  placeholder="상세주소" name="addr2" id="addr2" style="margin-top: -15px;" autocomplete="off">
                            </div>
     						
                               
                            </div>
                            <input type="submit" class="site-btn register-btn" id="btn1" value="REGISTER"></input>
                        </form>
                        <div class="switch-login">
                            <a href="./login.html" class="or-login">Or Login</a>
                        </div>
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