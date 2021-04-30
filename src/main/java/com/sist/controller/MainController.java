package com.sist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.WalkDAO;
import com.sist.vo.WalkVO;

@Controller
public class MainController {
	
	@Autowired
	private WalkDAO wdao;
	
	@GetMapping("main/main.do")
	public String main_main(Model model)
	{
		List<WalkVO> list=wdao.walkAllData();
		model.addAttribute("list",list);
		model.addAttribute("main_jsp","../main/home.jsp");
		return "main/main";
	}
	@GetMapping("main/admin.do")
	public String main_admin(Model model){
		model.addAttribute("main_jsp", "../admin/check.jsp");
		return "main/main";
	}

}
