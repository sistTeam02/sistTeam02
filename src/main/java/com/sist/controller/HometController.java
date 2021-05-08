package com.sist.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.HometDAO;
import com.sist.vo.HometDetailVO;
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
		
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1; // 1~10 => startPage=1 , 11~20 => 11
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 1~10 => endPage=10, 11~20 => 20
		if(endPage>totalPage)
			endPage=totalPage;
		
		//ViewResolver로 데이터를 전송
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("BLOCK", BLOCK);
		
		model.addAttribute("main_jsp", "../home_training/ht_main.jsp");
		return "main/main";
	}
	             
	@GetMapping("home_training/ht_detail_free.do")
	public String home_training_detail_free(int no, Model model) {
		System.out.println("+=============================================");
		System.out.println("no:"+no);
		HometDetailVO vo = dao.hometDetailFree(no);
		String key = vo.getVideo().substring(vo.getVideo().lastIndexOf("v")+2);
		System.out.println("키값: " + key);
		
		
		model.addAttribute("vo",vo);
		model.addAttribute("key", key);
		model.addAttribute("main_jsp", "../home_training/ht_detail_free.jsp");
		
		System.out.println("보내기-------------------------");
		return "main/main";
	}
	
	@GetMapping("home_training/ht_challenge.do")
	public String home_training_challenge(Model model) {
		System.out.println("챌린지 페이지 ===============");
		
		List<HometMainVO> cList = dao.hometChallengeListData();
		
		model.addAttribute("cList", cList);
		model.addAttribute("main_jsp", "../home_training/ht_challenge.jsp");
		return "main/main";
		
	}
}
