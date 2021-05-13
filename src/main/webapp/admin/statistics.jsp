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
}
.box_span{
	width: 100%;
    display: block;
    height: 4em;
    border-top: 0.1px dashed #00000052;
}
.bar1{
    height: 14em;
    left: 34em;
    width: 1em;
    background-color: red;
    position: absolute;
    top: 57em;
}
.bar2{
    height: 14em;
    left: 47em;
    width: 1em;
    background-color: red;
    position: absolute;
    top: 57em;
}
.bar3{
    height: 14em;
    left: 60em;
    width: 1em;
    background-color: red;
    position: absolute;
    top: 57em;
}
.bar4{
    height: 14em;
    left: 73em;
    width: 1em;
    background-color: red;
    position: absolute;
    top: 57em;
}
.bar5{
    height: 14em;
    left: 86em;
    width: 1em;
    background-color: red;
    position: absolute;
    top: 57em;
}

.fbar{
 	height: 14em;
    width: 1em;
    background-color: green;
    position: absolute;
    top: 57em;
    left: 36em;
}
.gbar{
 	height: 14em;
    width: 1em;
    background-color: blue;
    position: absolute;
    top: 57em;
    left: 38em;
}
</style>
</head>
<body>
	<div class="statistics_box" id="box">
		<div class="col-sm-2 bar1"></div>
		<div class="col-sm-2 bar2"></div>
		<div class="col-sm-2 bar3"></div>
		<div class="col-sm-2 bar4"></div>
		<div class="col-sm-2 bar5"></div>
		<div class="col-sm-2 fbar" v-for="n in 5" v-bind:style="updatefBar(n)"></div>
		<div class="col-sm-2 gbar" v-for="n in 5" v-bind:style="updategBar(n)"></div>
		<span v-for="r in row" class="box_span"></span>
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
			arrheight:[]
			/* barCss:{bar1:false,bar2:false,bar3:false,bar4:false,bar5:false} */
		  } 
		  ,mounted:function(){
			  _this=this
				 axios.get("http://localhost/web/admin/redbar.do",{
	    				params:{
	    					month:this.month
	    				}
	    			}).then(function(response){			
	    				_this.arrheight=response.data
	    			})
	    		
		  }
		  ,
		  methods:{
			 updateBar:function(i){//1~5  
			
				 let a="left:"+(35+(i.no-1)*13)+"em";
				  //let h="height:"+i.height+"px";"{left:99+'em',height:100+'px'}" 
				  return  a;  
				},
			  updatefBar: function(i){
				  let a=37+(i-1)*13+"em";
				  return  "left:"+a;  
			  },
			  updategBar: function(i){
				  let a=39+(i-1)*13+"em";
				  return  "left:"+a;  
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