package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class DietFoodController {
	// DietFoodDAO 저장
	@Autowired
	private DietFoodDAO dDao;
	
	@GetMapping("shop/dfood_list.do")
	public String shop_list(String page,Model model)
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		
		List<DietFoodVO> list=dDao.dfoodListData(map);
		// 총 페이지
		int totalpage=dDao.dfoodTotalPage();
		
		final int BLOCK=9;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		int allPage=totalpage;
		if(endPage>allPage)
			endPage=allPage;
		
		model.addAttribute("list", list);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("main_jsp", "../shop/dfood_list.jsp");
		return "main/main";
	}
	
	@RequestMapping("shop/dfood_detail.do")
	public String dfood_detail(int uno,Model model)
	{
		DietFoodDetailVO vo=dDao.dfoodDetailData(uno);
		model.addAttribute("vo", vo);
		return "shop/dfood_detail";
	}
}
