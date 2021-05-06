package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class GoodsController {
	// GoodsDAO 저장
	@Autowired
	private GoodsDAO gDao;
	
	@GetMapping("shop/shop_list.do")
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
		
		List<GoodsVO> list=gDao.goodsListData(map);
		// 총 페이지
		int totalpage=gDao.goodsTotalPage();
		
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
		model.addAttribute("main_jsp", "../shop/shop_list.jsp");
		return "main/main";
	}
	
	// 쿠키
	@GetMapping("shop/shop_detail_before.do")
	public String shop_detail_before(int no,RedirectAttributes ra,HttpServletResponse response)
	{
		Cookie cookie=new Cookie("m"+no,String.valueOf(no));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);  // 하루 저장
		// 클라이언트로 전송
		response.addCookie(cookie);
		
		ra.addAttribute("no", no);
		return "redirect:shop_detail.do";
	}
	
	// 상세페이지
	@GetMapping("shop/shop_detail.do")
	public String shop_detail(int no,Model model)
	{
		GoodsDetailVO gvo=gDao.goodsDetailData(no);
		model.addAttribute("gvo", gvo);
		model.addAttribute("main_jsp", "../shop/shop_detail.jsp");
		return "main/main";
	}
}

