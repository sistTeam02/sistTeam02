package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("main/main.do")
	public String main_main(Model model)
	{
		model.addAttribute("main_jsp","../main/home.jsp");
		return "main/main";
	}
	@GetMapping("main/admin.do")
	public String main_admin(Model model){
		model.addAttribute("main_jsp", "../admin/check.jsp");
		return "main/main";
	}

}
