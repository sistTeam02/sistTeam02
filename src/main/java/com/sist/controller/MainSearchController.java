package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainSearchController {
	
	@GetMapping("main/search.do")
	public String main_search(String search, Model model){

		return "main/search";
	}
	
	@GetMapping("main/search_category.do")
	public String main_search_category(String no, String search, Model model){
		if(no.equals("1")){//홈트
			
		}
		else if(no.equals("2")){//건강식품
			
		}
		else{//운동기구
			
		}
		return "main/search_category";
	}
}
