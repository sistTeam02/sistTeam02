package com.sist.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.ChatDAO;





@Controller
public class ChatController {
	@Autowired
	private ChatDAO dao;
	@GetMapping("chat/chat_main.do")
	public String chat_main(Model model){
		
		model.addAttribute("main_jsp", "../chat/chat.jsp");
		return "main/main";
	}
	@GetMapping("chat/chat_insert.do")
	public void chat_insertData(String fileurl){
		System.out.println(fileurl);
		System.out.println(1);
		
		
	}
}
