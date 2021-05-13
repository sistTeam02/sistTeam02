<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function(){
	$('#qna_allData').text('월매출');
	$('#qna_allData').attr('id','month');
	$('#qna_UpdateData').text('테스트2');
	$('#qna_UpdateData').attr('id','test2');
	$('#qna_search').text('테스트3');
	$('#qna_search').attr('id','test3');
	$('#temp').text('테스트4');
	$('#temp').attr('id','test4');
});
$(document).on('click','#month',function(){
	
});
</script>
<style type="text/css">
.statistics_box{
	border: 2px solid black;
    width: 70em;
    height: 40em;
    margin: 10em 0em 0em 6em; 
    position: relative;
}
.box_span{
	width: 100%;
    display: block;
    height: 4em;
    border-top: 0.1px dashed #00000052;
}
.bar1,.fbar1,.gbar1{
    height: 14em;
    width: 1em;
	left:4em;
    background-color: red;
    position: absolute;
}
.bar2,.fbar2,.gbar2{
    height: 14em;
    width: 1em;
    left:17em;
    background-color: red;
    position: absolute;
}
.bar3,.fbar3,.gbar3{
    height: 14em;
    width: 1em;
    left:30em;
    background-color: red;
    position: absolute;
}
.bar4,.fbar4,.gbar4{
    height: 14em;
    width: 1em;
    left:43em;
    background-color: red;
    position: absolute;
}
.bar5,.fbar5,.gbar5{
    height: 14em;
    left:57em;
    width: 1em;
    background-color: red;
    position: absolute;

}

.fbar1,.fbar2,.fbar3,.fbar4,.fbar5 {
    background-color: #30f90c;
    margin: 0px 38px;
}
.gbar1,.gbar2,.gbar3,.gbar4,.gbar5 {
    background-color: #3d53c1;
    margin: 0px 77px;
}
#box_ul li{
	position: absolute;
	height: 630px;
	width: 1em;
}
#box_ul li span{
	bottom: 0px;
}
</style>
</head>
<body>
	<div class="statistics_box" id="box">
	<ul style="list-style-type: none;position: relative;" id="box_ul">
		<li><span class="col-sm-2 bar1":style="updateBar(0)"></span></li>  <!-- 음식 -->
		<li><span class="col-sm-2 bar2":style="updateBar(1)"></span></li>
		<li><span class="col-sm-2 bar3":style="updateBar(2)"></span></li>
		<li><span class="col-sm-2 bar4":style="updateBar(3)"></span></li>
		<li><span class="col-sm-2 bar5":style="updateBar(4)"></span></li>
		<li><span class="col-sm-2 fbar1":style="updatefBar(0)"></span></li> <!-- 기구 -->
		<li><span class="col-sm-2 fbar2":style="updatefBar(1)"></span></li>
		<li><span class="col-sm-2 fbar3":style="updatefBar(2)"></span></li>
		<li><span class="col-sm-2 fbar4":style="updatefBar(3)"></span></li>
		<li><span class="col-sm-2 fbar5":style="updatefBar(4)"></span></li>
		<li><span class="col-sm-2 gbar1":style="updategBar(0)"></span></li>  <!-- 홈트 -->
		<li><span class="col-sm-2 gbar2":style="updategBar(1)"></span></li>
		<li><span class="col-sm-2 gbar3":style="updategBar(2)"></span></li>
		<li><span class="col-sm-2 gbar4":style="updategBar(3)"></span></li>
		<li><span class="col-sm-2 gbar5":style="updategBar(4)"></span></li>
		<span v-for="r in row" class="box_span"></span>
	</ul>
	</div>
	<table id="barText"style="width: 70em;margin-left: 6em;text-align: center;">
		<tr>
			<td>{{makeMonth(4)}}월</td>
			<td>{{makeMonth(3)}}월</td>
			<td>{{makeMonth(2)}}월</td>
			<td>{{makeMonth(1)}}월</td>
			<td>{{month}}월</td>
		<tr>
	</table>
	<template id="drowbar">
		
	</template>

	<script>
	let em="em";
		Vue.component('makebar', {
			template:'#drowbar'
		})

	  let box=new Vue({  
		  el:'#box',
		  data:{
			row: 10,
			month:5,
			arrheight:[{height:'',no:''}],
			arrheight2:[{height:'',no:''}],
			arrheight3:[{height:'',no:''}]
			
		  } 
		  ,mounted:function(){
			  _this=this
				 axios.get("http://localhost/web/admin/redbar.do",{
	    				params:{
	    					month:this.month,
	    					cno:1
	    				}
	    			}).then(function(response){			
	    				_this.arrheight=response.data
	    			});
			  axios.get("http://localhost/web/admin/redbar.do",{
  				params:{
  					month:this.month,
  					cno:2
  				}
  			}).then(function(response){			
  				_this.arrheight2=response.data
  			});
			  axios.get("http://localhost/web/admin/redbar.do",{
	  				params:{
	  					month:this.month,
	  					cno:3
	  				}
	  			}).then(function(response){			
	  				_this.arrheight3=response.data
	  			});
		  }
		  ,
		  methods:{
			 updateBar:function(i){//1~5  
				let a=this.arrheight[i].height;
				// let a="heght:"+(35+(i.no-1)*13)+"em";
				console.log(a);
				  return  "height:"+a+"px";  
				},
			  updatefBar: function(i){
				  let a=this.arrheight2[i].height;
				  return  "height:"+a+"px";  
			  },
			  updategBar: function(i){
				  let a=this.arrheight3[i].height;
				  return  "height:"+a+"px";  
			  }
		  }
		  
	  })
	 new Vue({
		el:'#barText',
		data:{
			month:5
		},methods:{
			makeMonth: function(i){		
				let m=this.month;
				if((m-i)<=0){
					m=m+12;
				}
				return (m-i)
			}
		}
	}) 
	</script>
</body>
</html>