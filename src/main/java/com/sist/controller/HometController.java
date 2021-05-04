package com.sist.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.HometDAO;
import com.sist.vo.HometMainVO;

@Controller
public class HometController {
	
	@Autowired
	private HometDAO dao;
	
	@GetMapping("home_training/ht_main.do")
	public String home_training_main(String page, Model model){
		
		System.out.println("page:" + page);
		if(page == null) {
			page ="1";
		}
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 10;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;
		map.put("start", start);
		map.put("end", end);
		// WHERE num BETWEEN #{start} AND #{end} => Map을 지정하는 경우에는 반드시 키명을 설정
		List<HometMainVO> list = dao.hometListData(map);
		int totalPage = dao.hometTotalPage();
		
		//ViewResolver로 데이터를 전송
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalPage", totalPage);
		
		model.addAttribute("main_jsp", "../home_training/ht_main.jsp");
		return "main/main";
	}
}
