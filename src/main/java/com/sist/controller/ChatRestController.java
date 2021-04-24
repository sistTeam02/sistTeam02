package com.sist.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
	@RequestMapping("chat/chat_page.do")
	public String chat_page(String classno,Model model){
		model.addAttribute("classno", classno);
		return classno;
	}
}
