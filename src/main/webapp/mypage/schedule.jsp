<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <title>Fashi | Template</title>
    
     <style type="text/css">
     .table-hover{
     	font-size:large;
     	width:900px;
     	
     }
    body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}
     </style>
    
    
    
    <!-- Calendar -->
    <link rel='stylesheet' type='text/css' href='../css/fullcalendar.css' />
<script type='text/javascript' src='../js/jquery_selecttable.js'></script>
<script type='text/javascript' src='../js/jquery-ui-custom.js'></script>
<script type='text/javascript' src='../js/fullcalendar.min.js'></script>
	<script type='text/javascript'>

	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		var calendar = $('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
			},
			editable: true,
			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: 'Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: 'Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: 'Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: 'Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false
				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			]
		});
		
	});

</script>
</head>

<body>
   

    <!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
                    <div class="blog-sidebar">
                        <!-- <div class="search-form">
                            <h4>Search</h4>
                            <form action="#">
                                <input type="text" placeholder="Search . . .  ">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div> -->
                        <div class="blog-catagory">
                            <h4>마이페이지</h4>
                            <ul>
                                 <li><a href="like_list.jsp">운동&쇼핑몰 찜리스트 </a></li> 
                                <li><a href="buy_list.jsp">프로그램 신청 내역</a></li>
                                <li><a href="schedule.jsp">나만의 계획</a></li>
                                <li><a href="mypage_update.jsp">회원정보수정</a></li>
                            </ul>
                        </div>
                        <div class="recent-post">
                            <h4>쿠키 들어갈 자리?</h4>
                            <div class="recent-blog">
                                <a href="#" class="rb-item">
                                    <div class="rb-pic">
                                        <img src="img/blog/recent-1.jpg" alt="">
                                    </div>
                                    <div class="rb-text">
                                        <h6>The Personality Trait That Makes...</h6>
                                        <p>Fashion <span>- May 19, 2019</span></p>
                                    </div>
                                </a>
                               
                            </div>
                        </div>
                        <div class="blog-tags">
                            <h4>실시간 구매 상품</h4>
                            <div class="tag-item">
                                <a href="#">Towel</a>
                                <a href="#">Shoes</a>
                                <a href="#">Coat</a>
                                <a href="#">Dresses</a>
                                <a href="#">Trousers</a>
                                <a href="#">Men's hats</a>
                                <a href="#">Backpack</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                <div class="col-lg-12">
                <div class="bi-text">
            	 <h2>나만의 계획 세우기</h2>
               		<div style="height:50px"></div>
                       <div class="container">
 						  <div id='calendar'></div>
					   </div> 
					   
					<div style="height:50px"></div>
                       <div class="container">
                       <h2>채팅 기록 확인하기</h2>
                       <p>채팅에 기록된 내용을 출력합니다</p>
                    </div>   
                </div>
            </div>
        </div>
    </section>
    


    
</body>

</html>
                       			
                       			
                       			