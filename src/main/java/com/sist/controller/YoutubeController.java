package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.Homet_pay_inputVO;
import com.sist.vo.User_basketVO;
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
	@GetMapping("youtube/you_tuber.do")
	public String youtuber_list(String page,Model model)
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
		
		List<YoutubeVO> list=yDao.listYoutuber(map);
		
		// 총 페이지
		int totalpage=yDao.youtuberTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		int allPage=totalpage;
		if(endPage>allPage)
			endPage=allPage;

		model.addAttribute("list",list);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("main_jsp","../youtube/you_tuber.jsp");
		return "main/main";
	}
	
	@GetMapping("youtube/you_tuber_detail.do")
	public String ByYoutuber_list(String page,Model model,int cno)
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
		
		map.put("cno", cno);
		YoutubeVO youtuberName=yDao.youtuberName(cno);
		
		List<YoutubeVO> ylist=yDao.listByYoutuber(map);
		// 총 페이지
		int totalpage=yDao.totalpageByYoutuber(cno);
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		int allPage=totalpage;
		if(endPage>allPage)
			endPage=allPage;
		
		
		model.addAttribute("youtuberName",youtuberName);
		model.addAttribute("cno",cno);
		model.addAttribute("ylist",ylist);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("main_jsp","../youtube/you_tuber_detail.jsp");
		
		
		return "main/main";
	}
	/*
	 * ID                  VARCHAR2(40)   
NO         NOT NULL NUMBER         
PNO                 NUMBER         
TITLE               VARCHAR2(1000) 
POSTER              VARCHAR2(400)  
PRICE               VARCHAR2(100)  
ORDERCOUNT          NUMBER         
CNO                 NUMBER         
ORDDATE             DATE           
STATE               NUMBER         
ADDRESS             VARCHAR2(500)  
TRAINER             VARCHAR2(200)  
	 */
	//수강신청
	/*@PostMapping("youtube/input.do")
	public String youtube_input(int cno,HttpSession session,Model model)
	{	
		
		String id=(String)session.getAttribute("id");
		
		Homet_pay_inputVO vo = new Homet_pay_inputVO();
		vo.setCno(cno);
		vo.setId(id);
		
		yDao.hometPayInputInsert(vo);
	
		return "redirect:../youtube/you_tuber_detail.do?cno="+cno;
	}*/
	@PostMapping("youtube/input.do")
	public String youtube_input(int cno,HttpSession session,Model model)
	{	
		
		String id=(String)session.getAttribute("id");
		
		User_basketVO vo = new User_basketVO();
		YoutubeVO title = yDao.youtuberName(cno);
		vo.setId(id);
		vo.setPno(cno);
		vo.setTitle(title.getChanneltitle());
		vo.setTrainer(title.getChanneltitle());
		vo.setPoster(title.getPoster());
		
		yDao.youtubeBasketInsert(vo);
	
		return "redirect:../youtube/you_tuber_detail.do?cno="+cno;
	}
	
	
	
}
