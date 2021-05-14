package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class DietFoodController {
	// DietFoodDAO 저장
	@Autowired
	private DietFoodDAO dDao;
	
	@GetMapping("shop/dfood_list.do")
	public String shop_list(String page,Model model,HttpServletRequest request)
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
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		model.addAttribute("list", list);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("curpage", curpage);
		
		// 쿠키 (SpringRecipeProject)
		Cookie[] cookies=request.getCookies();
		List<String> cList=new ArrayList<String>();
		if(cookies!=null)
		{
			for(int i=cookies.length-1;i>=0;i--)
			{
				cookies[i].setPath("/");
				if(cookies[i].getName().startsWith("m"))
				{
					DietFoodDetailVO vo=dDao.dfoodDetailData(Integer.parseInt(cookies[i].getValue()));
					cList.add(vo.getPoster());
				}
			}
			model.addAttribute("cList", cList);
		}
		model.addAttribute("main_jsp", "../shop/dfood_list.jsp");
		return "main/main";
	}
	// 쿠키
	@GetMapping("shop/dfood_detail_before.do")
	public String shop_detail_before(int no,RedirectAttributes ra,HttpServletResponse response)
	{
		Cookie cookie=new Cookie("m"+no,String.valueOf(no));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);  // 하루 저장
		// 클라이언트로 전송
		response.addCookie(cookie);
		
		ra.addAttribute("no", no);
		return "redirect:dfood_detail.do";
	}
	
	// 상세 페이지
	@RequestMapping("shop/dfood_detail.do")
	public String dfood_detail(int no,Model model)
	{
		DietFoodDetailVO vo=dDao.dfoodDetailData(no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../shop/dfood_detail.jsp");
		return "main/main";
	}
}
