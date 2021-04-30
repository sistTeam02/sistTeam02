package com.sist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.WalkDAO;
import com.sist.vo.WalkVO;

@Controller
public class WalkController {
	@Autowired
	private WalkDAO wdao;
	
	@GetMapping("walk/walk.do")
	public String walk_walk(Model model){
		List<WalkVO> list=wdao.walkAllData();
		model.addAttribute("list",list);
		model.addAttribute("main_jsp","../walk/walk.jsp");
		return "main/main";
	}
	
	@GetMapping("walk/walk_detail.do")
	   public String walk_detail(int no,Model model)
	   {
			WalkVO vo=wdao.walkDetailData(no);
			String addr=vo.getAddr();
			//System.out.println(addr);
			if(addr.contains("(")&&!addr.contains("과천"))
				addr=addr.substring(addr.indexOf("서"),addr.lastIndexOf("("));
			else if(addr.contains("과천"))
				addr=addr.substring(addr.indexOf("경"),addr.lastIndexOf("("));
			else if(addr.contains("경기"))
				addr=addr.substring(addr.indexOf("서"),addr.lastIndexOf("경"));
			else
				addr=addr.substring(addr.indexOf("서"));
			vo.setAddr(addr);
			model.addAttribute("vo",vo);
		   return "walk/walk_detail";
	   }
	
	@PostMapping("walk/walk_reply.do")
	public String walk_reply(int bno, Model model, int page){
		return "walk/walk_reply";
	}
}
