package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.WalkDAO;
import com.sist.vo.WalkVO;

@Controller
public class WalkController {
	@Autowired
	private WalkDAO wdao;
	
	@GetMapping("walk/walk.do")
	public String walk_walk(Model model){
		model.addAttribute("main_jsp","../walk/walk.jsp");
		return "main/main";
	}
	
	@GetMapping("walk/walk_detail.do")
	   public String walk_detail(String no,Model model)
	   {
		   return "walk/walk_detail";
	   }
}
