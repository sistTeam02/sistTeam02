package com.sist.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;
import com.sist.vo.*;



import java.util.*;


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
	@PostMapping("mypage/schedule_date")
	public String mypage_schedule_data(String id,String month){
		String dList="";
		List<String> list=pdao.chat_dbDay(id);
		for(int i=0;i<list.size();i++){
			String db_day=list.get(i);
			String[]arr=db_day.split("\\.");
			int m=Integer.parseInt(month);
			int db_m=Integer.parseInt(arr[1]);
			if(m==db_m){
				db_day=arr[2];
				dList+=db_day+"^";
			}
		}
		dList=dList.substring(0,dList.length());
		return dList;
	}
	
}
