package com.sist.controller;

import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.dao.HometDAO;
import com.sist.vo.HometDetailVO;
import com.sist.vo.HometMainVO;
import com.sist.vo.HometPayVO;

@Controller
public class HometController {
	
	@Autowired
	private HometDAO dao;
	
	@GetMapping("home_training/ht_main.do")
	public String homet_main(Model model) {
		model.addAttribute("main_jsp", "../home_training/ht_main.jsp");
		return "main/main";
	}
	
	@GetMapping(value="home_training/homet/homet_ht_main.do",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String home_training_main(String page, Model model){
		
		String json = "";
		try {
			if (page == null) {
				page = "1";
			}
			int curpage = Integer.parseInt(page);
			Map map = new HashMap();
			int rowSize = 12;
			int start = (rowSize * curpage) - (rowSize - 1);
			int end = (rowSize * curpage);
			map.put("start", start);
			map.put("end", end);
			List<HometMainVO> list = dao.hometListData(map);
			JSONArray arr = new JSONArray();
			for (HometMainVO vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("title", vo.getTitle());
				obj.put("title_link", vo.getTitle_link());
				obj.put("poster", vo.getPoster());
				obj.put("part", vo.getPart());
				obj.put("good", vo.getGood());
				arr.add(obj);
			}
			json = arr.toJSONString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return json;
	}
	
	@GetMapping(value="home_training/home_main_total.do",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String homet_main_total() {
		int total = dao.hometTotalPage();
		return String.valueOf(total);
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
	
	@GetMapping("home_training/ht_pay.do")
	public String home_training_pay(String page, Model model) {
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
		List<HometPayVO> pList = dao.hometPayListData(map);
		
		
		model.addAttribute("pList",pList);
		model.addAttribute("main_jsp", "../home_training/ht_pay.jsp");
		return "main/main";
	}
	
	@GetMapping("home_training/ht_detail_pay.do")
	public String home_training_pay_detail(int no, Model model) {
		
		HometPayVO vo = dao.hometPayDetail(no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../home_training/ht_detail_pay.jsp");
		return "main/main";
	}
	
	@GetMapping("home_training/ht_challenge.do")
	public String home_training_challenge(Model model) {
		
		model.addAttribute("main_jsp", "../home_training/ht_challenge.jsp");
		return "main/main";
		
	}
	
	
	@GetMapping(value="home_training/homet/homet_ht_challenge.do",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String home_training_challenge(String page, Model model){
		 
		String json = "";
		try {
			if (page == null) {
				page = "1";
			}
			int curpage = Integer.parseInt(page);
			Map map = new HashMap();
			int rowSize = 12;
			int start = (rowSize * curpage) - (rowSize - 1);
			int end = (rowSize * curpage);
			map.put("start", start);
			map.put("end", end);

			List<HometMainVO> list = dao.hometChallengeListData(map);
			JSONArray arr = new JSONArray();
			for (HometMainVO vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("title", vo.getTitle());
				obj.put("title_link", vo.getTitle_link());
				obj.put("poster", vo.getPoster());
				obj.put("part", vo.getPart());
				obj.put("good", vo.getGood());
				arr.add(obj);
			}
			json = arr.toJSONString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return json;
	}
	
	@GetMapping(value="home_training/homet_challenge_total.do",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String homet_challenge_total() {
		int total = dao.hometChallengeTotalPage();
		return String.valueOf(total);
	}
    
	@GetMapping("home_training/ht_challenge_detail.do")
	public String home_training_challenge_detail(int no, Model model) {
		System.out.println("챌린지 디테일 페이지==================");
		
		HometDetailVO vo = dao.hometChallengeDetail(no);
		String key = vo.getVideo().substring(vo.getVideo().lastIndexOf("v")+2);
		
		model.addAttribute("key", key);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../home_training/ht_challenge_detail.jsp");
		return "main/main";
	}
	
	
	
	
	
	
}
