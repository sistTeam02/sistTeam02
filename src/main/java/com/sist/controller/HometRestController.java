/*package com.sist.controller;

import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.HometDAO;
import com.sist.vo.HometDetailVO;
import com.sist.vo.HometMainVO;

@RestController
public class HometRestController {
	@Autowired
	private HometDAO dao;
	
	@GetMapping("home_training/ht_main.do")
	public String homet_main(Model model) {
		model.addAttribute("main_jsp", "../home_training/ht_main.jsp");
		return "main/main";
	}
	
	@GetMapping(value="home_training/homet_ht_main.do", produces="text/plain;charset=UTF-8")
	public String homet_main(String page) {
		String json = "";
		try {
			if (page == null) {
				page = "1";
			}
			int curpage = Integer.parseInt(page);
			Map map = new HashMap();
			int rowSize = 10;
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
	
	@GetMapping("home_training/home_main_total.do")
	public String homet_main_total() {
		int total = dao.hometTotalPage();
		return String.valueOf(total);
	}

}
*/