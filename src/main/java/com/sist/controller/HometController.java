package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HometController {
	@GetMapping("home_training/ht_main.do")
	public String home_training_main(Model model){
		
		model.addAttribute("main_jsp", "../home_training/ht_main.jsp");
		return "main/main";
	}
}
