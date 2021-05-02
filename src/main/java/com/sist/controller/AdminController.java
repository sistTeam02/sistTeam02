package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@GetMapping("main/admin_main.do")
	public String main_qna(Model model, String no){
		
		if(no==null)
			no="0";
		int page=Integer.parseInt(no);
		String[] arr={
				"../admin/qna.jsp",
				"../admin/shop_manage.jsp"
		};
		
		model.addAttribute("admin_jsp", arr[page]);
		model.addAttribute("main_jsp", "../admin/admin_main.jsp");
		return "main/main";
	}
}
