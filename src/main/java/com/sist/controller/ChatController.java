package com.sist.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.Chat_foodDAO;





@Controller
public class ChatController {
	@Autowired
	private Chat_foodDAO dao;
	@GetMapping("chat/chat_main.do")
	public String chat_main(Model model){
		
		model.addAttribute("main_jsp", "../chat/chat.jsp");
		return "main/main";
	}
}
