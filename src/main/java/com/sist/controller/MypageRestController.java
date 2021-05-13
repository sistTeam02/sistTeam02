package com.sist.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.sist.dao.*;
import com.sist.vo.*;



import java.util.*;

import javax.servlet.http.HttpSession;


@RestController
public class MypageRestController {
	
	@Autowired
	private MypageDAO mdao;
	@Autowired
	private Chat_planDAO pdao;
	@Autowired
	private Chat_foodDAO fdao;
	
	//마이페이지 운동 데이터
	@PostMapping("mypage/schedule_plan.do")
	public String mypage_schedule_plan(String data,String id){
		Chat_planVO vo=new Chat_planVO();
		vo.setId(id);
		vo.setPlandate(data);
		System.out.println(data);
		String json="";
		List<Chat_planVO> pList=pdao.chat_planData(vo);
		JSONArray arr=new JSONArray();
		for(Chat_planVO pvo:pList){
			JSONObject obj=new JSONObject();
			obj.put("plandate",pvo.getPlandate());
			obj.put("time", pvo.getTime());
			obj.put("sport", pvo.getSport());
			arr.add(obj);
		}
		json=arr.toJSONString();
		return json;
	}
	//마이페이지 음식데이터
	@PostMapping("mypage/schedule_food.do")
	public String mypage_schedule_food(String data,String id){
		Chat_foodVO vo=new Chat_foodVO();
		String json="";
		vo.setFooddate(data);
		vo.setId(id);
		List<Chat_foodVO> fList=fdao.chat_foodData(vo);
		JSONArray arr=new JSONArray();
		for(Chat_foodVO fvo:fList){
			JSONObject obj=new JSONObject();
			obj.put("fooddate", fvo.getFooddate());
			obj.put("whenfood", fvo.getWhenfood());
			obj.put("foodname", fvo.getFoodname());
			obj.put("foodkcal", fvo.getFoodkcal());
			obj.put("foodgram", fvo.getFoodgram());
			arr.add(obj);
		}
		json=arr.toJSONString();
		return json;
		
	}
	
	// 마이페이지 날짜 출력 데이터
	@PostMapping("mypage/schedule_date.do")
	public String mypage_schedule_data(String id,String day){
		String dList="";
		List<String> list=pdao.chat_dbDay(id);
		for(int i=0;i<list.size();i++){
			String db_day=list.get(i);
			String[]arr=db_day.split("\\.");
			int m=Integer.parseInt(day);
			int db_m=Integer.parseInt(arr[1]);
			if(m==db_m){
				db_day=arr[2];
				dList+=db_day+"^";
			}
		}
		dList=dList.substring(0,dList.length());
		return dList;
	}
	@PostMapping("mypage/scheduleFood_ok.do")
	public String mypage_scheduleFood_ok(String date,HttpSession session){
		String id=(String)session.getAttribute("id");
		String json="";
		Map map=new HashMap();
		map.put("id", id);
		map.put("fooddate",date);
		
		List<Chat_foodVO> fList=mdao.mypageFoodDayData(map);
		JSONArray arr=new JSONArray();
		for(Chat_foodVO vo:fList){
			JSONObject obj=new JSONObject();
			obj.put("id",vo.getId());
			obj.put("fooddate",vo.getFooddate());
			obj.put("whenfood", vo.getWhenfood());
			obj.put("foodname", vo.getFoodname());
			obj.put("foodkcal", vo.getFoodkcal());
			obj.put("foodgram", vo.getFoodgram());
			arr.add(obj);	
		}
		json=arr.toJSONString();
		System.out.println(json);
		return json;
	}
	
	@PostMapping("mypage/schedulePlan_ok.do")
	public String mypage_schedulePlan_ok(String date,HttpSession session){
		String id=(String)session.getAttribute("id");
		String json="";
		Map map=new HashMap();
		map.put("id", id);
		map.put("plandate",date);
		
		List<Chat_planVO> pList=mdao.mypagePlanDayData(map);
		JSONArray arr=new JSONArray();
		for(Chat_planVO vo:pList){
			JSONObject obj=new JSONObject();
			obj.put("id", vo.getId());
			obj.put("plandate", vo.getPlandate());
			obj.put("time", vo.getTime());
			obj.put("sport", vo.getSport());
			arr.add(obj);
		}
		json=arr.toJSONString();
		System.out.println(json);
		return json;
	}
	
	//찜목록 사이트 (ReactJSㅇ로 변경중)
	/*@GetMapping("mypage/like_list_plan.do")
	public String mypage_like_list(String page,HttpSession session,Model model){
		//세션에 저장된 정보 가져오기
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		
		
		//운동용품 찜목록
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=(rowSize*curpage);
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		
		List<GoodsVO> gList=mdao.mypageGoodsJjimList(map);
		int totalpage=mdao.mypageGoodsJjimCount(id);
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		int allpage=totalpage;
		if(endPage>allpage){
			endPage=totalpage;
		}
		
		
		model.addAttribute("id",id);
		model.addAttribute("gList",gList);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("BLOCK",BLOCK);
		model.addAttribute("allpage",allpage);
		model.addAttribute("bread_jsp","../mypage/bread1.jsp");
		model.addAttribute("mypage_jsp","../mypage/like_list.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}*/
	
	
}
