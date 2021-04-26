package com.sist.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.parser.Parser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.Chat_foodDAO;
import com.sist.dao.Chat_planDAO;
import com.sist.dao.KcalDAO;
import com.sist.vo.Chat_foodVO;
import com.sist.vo.Chat_planVO;
import com.sist.vo.KcalVO;

@RestController
public class ChatRestController {
	@Autowired
	private Chat_planDAO pdao;
	@Autowired
	private Chat_foodDAO fdao;
	@PostMapping("chat/sport_plan.do")
	public String chat_sport_insert(String memo){
		String result="success!!";
		try{
			JSONParser jp=new JSONParser();
			JSONObject obj=(JSONObject)jp.parse(memo);
			System.out.println("id:"+obj.get("id"));
			System.out.println("date:"+obj.get("date"));
			System.out.println("time:"+obj.get("time"));
			System.out.println("sport:"+obj.get("sport"));
			Chat_planVO vo=new Chat_planVO();
			vo.setId((String) obj.get("id"));
			vo.setPlandate((String) obj.get("date"));
			vo.setTime((String) obj.get("time"));
			vo.setSport((String) obj.get("sport"));
			//pdao.chat_planInsertData(vo);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
	@PostMapping("chat/chat_total.do")
	public String chat_total_data(String date,String id){
		System.out.println(date);
		System.out.println(id);
		Chat_planVO vo=new Chat_planVO();
		Chat_foodVO fvo=new Chat_foodVO();
		vo.setId(id);
		vo.setPlandate(date);
		String json="";
		List<Chat_planVO> pList=pdao.chat_planData(vo);
		fvo.setFooddate(date);
		fvo.setId(id);
		List<Chat_foodVO> fList=fdao.chat_foodData(fvo);
		JSONArray arr=new JSONArray();
		for(Chat_planVO pvo:pList){
			JSONObject obj=new JSONObject();
			obj.put("plandate",pvo.getPlandate() );
			obj.put("time",pvo.getTime() );
			obj.put("sport",pvo.getSport() );
			arr.add(obj);
		}
		/*for(Chat_foodVO fovo:fList){ 사진 처리한후에 하자
			JSONObject obj=new JSONObject();
			obj.put("fooddate",fovo.getFooddate() );
			obj.put("whenfood",fovo.getWhenfood() );
			obj.put("foodname",fovo.getFoodname() );
			obj.put("foodkcal",fovo.getFoodkcal() );
			arr.add(obj);
		}*/
		json=arr.toJSONString();
		return json;
	}
}
