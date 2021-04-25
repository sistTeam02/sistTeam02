package com.sist.controller;

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

import com.sist.dao.KcalDAO;
import com.sist.vo.KcalVO;

@RestController
public class ChatRestController {
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
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
}
