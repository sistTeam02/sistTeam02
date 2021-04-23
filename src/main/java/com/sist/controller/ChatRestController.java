package com.sist.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.KcalDAO;
import com.sist.vo.KcalVO;

@RestController
public class ChatRestController {
	@Autowired
	private KcalDAO dao;
	
	@PostMapping("chat/chat_userInsert.do")
	public String userInsertPage(String id,Model model){
		List<KcalVO> list=dao.kcalList();
		String Json="";
		JSONArray arr=new JSONArray();
		System.out.println(1);
		System.out.println(list.size());
		for(KcalVO vo:list){
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("name", vo.getName());
			obj.put("gram", vo.getGram());
			obj.put("kcal", vo.getKcal());
			arr.add(obj);
		}
		Json=arr.toJSONString();
		return Json;
	}
}
