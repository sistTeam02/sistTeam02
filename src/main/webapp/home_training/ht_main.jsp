<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
  margin: 0px auto;
}
h1 {
  text-align: center;
}
</style>

</head>

<body>
    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    <div class="filter-widget">
                        <h4 class="fw-title">Categories</h4>
                        <ul class="filter-catagories">
                             <li><a href="../home_training/ht_main.do">무료 강의</a></li>
                            <li><a href="../home_training/ht_pay.do">유료 강의</a></li>
                            <li><a href="../home_training/ht_challenge.do">30일 챌린지</a></li>
                        </ul>
                    </div>
                    
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="product-show-option">
                        <div class="row">
                            <div class="col-lg-7 col-md-7">
                                <div class="select-option">
                                    <select class="sorting">
                                        <option value="">Default Sorting</option>
                                    </select>
                                    <select class="p-show">
                                        <option value="">Show:</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-5 text-right">
                                <p>Show 01- 09 Of 36 Product</p>
                            </div>
                        </div>
                    </div>
                    <div class="product-list">
                    	<div id="app">
                        <div class="row">
                        <!-- vue.js foreach -->
                        <div>
                            <div class="col-lg-4 col-sm-6" v-for="vo in homet_free">
                                <div class="product-item">
                                    <div class="pi-pic">
                                    	<a :href="'../home_training/ht_detail_free.do?no='+vo.no">
                                        	<img :src="vo.poster " alt="">
                                        </a>
                                        <div class="sale pp-sale">Sale</div>
                                        <div class="icon">
                                            <i class="icon_heart_alt"></i>
                                        </div>
                                        <ul>
                                            <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                            <li class="quick-view"><a href="#">+ Quick View</a></li>
                                            <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="pi-text">
                                        <div class="catagory-name">{{vo.title}}</div>
                                        <a href="#">
                                            <h5>{{vo.part }}</h5>
                                        </a>
                                        <div>
                                            <span>{{vo.good }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                    <!-- 페이지 나누기  -->
                   
				    </div>
				    </div>
				    <!-- 페이지 나누기 -->
				     <div class="row" style="display: block;">
				      <div class="text-center">
				       <button class="btn btn-sm btn-danger" v-on:click="showPrevPage()">이전</button>
				        {{curpage}} page / {{totalpage}} pages
				       <button class="btn btn-sm btn-info" v-on:click="showNextPage()">다음</button>
				      </div>
				    </div>
				    </div>
				    <!--  -->
				    
				    <script>
				    new Vue({
				    	 el:'#app',
				    	 data:{
				    		 homet_free:[],
				    		 curpage:1,
				    		 totalpage:1
				    	 },
				    	 mounted:function(){
				    		 axios.get("http://211.238.142.200/web/home_training/homet/homet_ht_main.do",{
				    			 params:{
				    				 page:this.curpage
				    			 }
				    		 }).then(response=>{
				    			 this.homet_free=response.data
				    			 console.log("aaa")
				    		 });
				    		 
				    		 axios.get("http://211.238.142.200/web/home_training/home_main_total.do").then(response=>{
				    			 console.log(response)
				    			 this.totalpage=response.data
				    		 })
				    	 },
				    	 methods:{
				    		 showPrevPage(){
				    			 this.curpage=this.curpage>1?this.curpage-1:this.curpage;
				    			 axios.get("http://211.238.142.200/web/home_training/homet/homet_ht_main.do",{
				    				 params:{
				    					 page:this.curpage
				    				 }
				    			 }).then(response=>{
				    				 this.homet_free=response.data
				    				 console.log(this.homet_free);
				    			 })
				    		 },
				    		 showNextPage(){
				    			 this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
				    			 axios.get("http://211.238.142.200/web/home_training/homet/homet_ht_main.do",{
				    				 params:{
				    					 page:this.curpage
				    				 }
				    			 }).then(response=>{
				    				 this.homet_free=response.data
				    				 console.log(this.curpage);
				    			 })
				    		 }
				    	 }
				     })
				    </script>
					    </div>
					    <!-- 페이지 나누기 끝 -->
                </div>
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->

    <!-- Partner Logo Section Begin -->
    <div class="partner-logo">
        <div class="container">
            <div class="logo-carousel owl-carousel">
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-1.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-2.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-3.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-4.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
 
   
</body>

</html>