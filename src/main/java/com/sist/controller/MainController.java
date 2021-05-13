package com.sist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.DietFoodDAO;
import com.sist.dao.GoodsDAO;
import com.sist.dao.WalkDAO;
import com.sist.vo.DietFoodVO;
import com.sist.vo.GoodsVO;
import com.sist.vo.WalkVO;

@Controller
public class MainController {
	
	@Autowired
	private WalkDAO wdao;
	
	@Autowired
	private DietFoodDAO dDao;
	
	@Autowired
	private GoodsDAO gDAO;
	@GetMapping("main/main.do")
	public String main_main(Model model)
	{
		Map map=new HashMap();
		map.put("start", 1);
		map.put("end", 6);
		Map gmap=new HashMap();
		gmap.put("start", 255);
		gmap.put("end", 255);
		
		List<WalkVO> list=wdao.walkAllData();
		List<DietFoodVO> foodlist=dDao.dfoodListData(map);
		List<GoodsVO> goodslist=gDAO.goodsListData(gmap);
		model.addAttribute("list",list);
		model.addAttribute("foodlist",foodlist);
		model.addAttribute("goodslist",goodslist);
		model.addAttribute("main_jsp","../main/home.jsp");
		return "main/main";
	}
	@GetMapping("main/admin.do")
	public String main_admin(Model model){
		model.addAttribute("main_jsp", "../admin/check.jsp");
		return "main/main";
	}

}
