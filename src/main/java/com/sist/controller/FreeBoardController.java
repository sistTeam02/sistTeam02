package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.FreeBoardDAO;
import com.sist.vo.FreeBoardVO;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.SimpleFormatter;
@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardDAO fDao;
	@GetMapping("board/freeboard_list.do")
	public String freeboard_list(String page, Model model)
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		
		List<FreeBoardVO> list=fDao.freeboardListData(map);
		// 총페이지
		int totalpage=fDao.freeboardTotalPage();
		
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		int allPage=totalpage;
		
		if(endPage>allPage)
		{
			endPage=allPage;
		}
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("today", today);
		model.addAttribute("main_jsp","../board/freeboard_list.jsp");
		return "main/main";
		
	}
	// 글쓰기
	@GetMapping("board/freeboard_insert.do")
	public String freeboard_insert(Model model)
	{
		model.addAttribute("main_jsp","../board/freeboard_insert.jsp");
		return "board/freeboard_insert";
	}
	@PostMapping("board/freeboard_insert_ok.do")
	public String freeboard_insert_ok(FreeBoardVO vo)
	{
		// DAO연결
		fDao.freeboardInsert(vo);
		return "redirect:freeboard_insert.do";
	}
	// 상세보기
	@GetMapping("board/freeboard_detail.do")
	public String feeboard_detail(int no, int page, Model model)
	{
		// 데이터 읽기 => DAO연결
		FreeBoardVO vo=fDao.freeboardDetailData(no);
		model.addAttribute("vo", vo);
		model.addAttribute("page", page);
		return "board/freeboard_detail";
	}
	// 수정하기
	@GetMapping("board/freeboard_update.do")
	public String freeboard_update(int no, int page, Model model)
	{
		FreeBoardVO vo=fDao.freeboardUpdateData(no);
		model.addAttribute("vo", vo);
		model.addAttribute("page", page);
		return "board/freeboard_update.do";
	}
	@PostMapping("freeboard_update_ok.do")
	public String freeboard_update_ok(FreeBoardVO vo, int page, Model model)
	{
		boolean bCheck=fDao.freeboardUpdate(vo);
		model.addAttribute("bCheck", bCheck);
		model.addAttribute("no", vo.getNo());
		model.addAttribute("page", page);
		return "board/freeabord_update";
	}
	// 삭제하기
	@GetMapping("board/freeboard_delete.do")
	public String freeboard_delete(int no, int page, Model model)
	{
		model.addAttribute("no", no);
		model.addAttribute("page", page);
		return "board/freeboard_delete";
	}
	@PostMapping("board/freeboard_delete_ok.do")
	public String freeboard_delete(int no, int page, String pwd, Model model)
	{
		// 결과값 읽기
		System.out.println("pwd="+pwd+",no="+no);
		boolean bCheck=fDao.freeboardDelete(no, pwd);
		System.out.println("bCheck="+bCheck);
		model.addAttribute("bCheck", bCheck);
		model.addAttribute("page", page);
		return "board/freeboard_delete_ok";
	}

}































