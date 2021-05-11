package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.YoutubeVO;

@Controller
public class YoutubeController {
	
	@Autowired
	private YoutubeDAO yDao;
	//유튜브페이지 이동
	
	@GetMapping("youtube/you_list.do")
	public String youtube_page(String page,Model model)
	{	
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		
		List<YoutubeVO> list=yDao.youtubeListData(map);
		// 총 페이지
		int totalpage=yDao.youtubeTotalPage();
		
		final int BLOCK=10;
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
		
		model.addAttribute("main_jsp","../youtube/you_list.jsp");
		return "main/main";
	}
	
	@GetMapping("youtube/you_detail.do")
	public String youtube_detail(int no,Model model)
	{
		YoutubeVO vo = yDao.detailYoutubeData(no);
		
		model.addAttribute("vo",vo);
		
		model.addAttribute("main_jsp","../youtube/you_detail.jsp");
		return "main/main";
	}
	
	
	
	
	
}
