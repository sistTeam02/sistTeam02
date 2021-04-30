<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
   <div style="height:50px"></div>
   <div class="container">
     <div class="row">
		
		<table class=table>
			<tr>
				<td colspan=2><img src=${vo.poster } width="100%" height="100%"></td>
			</tr>
			<tr>
				<td colspan=2><h3>${vo.title }</h3></td>
			</tr>
			<tr>
				<td width=30%>주소</td>
				<td width=70%>${vo.addr}</td>
			</tr>
			<tr>
				<td width=30%>교통 정보</td>
				<td width=70%>${vo.subwayinfo}</td>
			</tr>
			<tr>
				<td width=30%>태그</td>
				<td width=70%>${vo.tag}</td>
			</tr>
		</table>
     </div>
     
     <div id="map2" style="width:100%;height:350px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a5e5e4eddca40e65faccd16040cbc2a&libraries=services"></script>
		<script>
		
		
		var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		var addr_='${vo.addr}';
		console.log(addr_);
		var title_='${vo.title}';
		console.log(title_);
		// 지도를 생성합니다    
		var map2 = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		
		geocoder.addressSearch(addr_, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map2,
		            position: coords
		        });
		        
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+title_+'</div>'
		        });
		        infowindow.open(map2, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map2.setCenter(coords);
		    } 
		});    
		map2.relayout();
		</script>
		
		<div style="height:30px"></div>
		 <div class="row" id="reply_data">
      
    	</div>
   </div>
</body>
</html>