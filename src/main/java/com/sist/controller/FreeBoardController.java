package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.*;
import com.sist.vo.FindVO;
import com.sist.vo.FreeBoardVO;
import com.sist.vo.ReplyVO;

import java.util.*;

import javax.servlet.http.HttpSession;
@Controller
public class FreeBoardController {
   @Autowired
   private FreeBoardDAO fDao;
   @Autowired
   private ReplyDAO rDao;
   
   
   @GetMapping("board/flist.do")
   public String board_flist(String page,Model model)
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
	   int totalpage=fDao.freeboardTotalPage();
	   
	   // JSP 전송 
	   model.addAttribute("list", list);
	   model.addAttribute("curpage", curpage);
	   model.addAttribute("totalpage", totalpage);
	   model.addAttribute("main_jsp", "../board/flist.jsp");
	   
	   return "main/main";
   }
   // 글쓰기
   @GetMapping("board/finsert.do")
   public String board_insert(Model model)
   {
	   model.addAttribute("main_jsp", "../board/finsert.jsp");
	   return "main/main";
   }
   @PostMapping("board/finsert_ok.do")
   public String board_finsert_ok(FreeBoardVO vo)
   {
	   //DAO연결 
	   fDao.freeboardInsert(vo);
	   return "redirect:flist.do";
   }
   @GetMapping("board/fdetail.do")
   public String board_fdetail(int no,int page,Model model)
   {
	   // 데이터 읽기 => DAO연결 
	   FreeBoardVO vo=fDao.freeboardDetailData(no);
	   List<ReplyVO> rList=rDao.replyListData(no);
	   model.addAttribute("vo", vo);
	   model.addAttribute("page", page);
	   model.addAttribute("main_jsp", "../board/fdetail.jsp");
	   //model.addAttribute("rList", rList);
	   return "main/main";
   }
   @PostMapping("board/ffind.do")
   public String board_ffind(String fs,String ss,Model model)
   {
	   FindVO vo=new FindVO();
	   vo.setFs(fs);
	   vo.setSs(ss);
	   Map map=new HashMap();
	   map.put("fs",fs);
	   map.put("ss", ss);
	   map.put("fsArr", vo.getFsArr());
	   List<FreeBoardVO> list=fDao.freeboardFindData(map);
	   int count=fDao.freeboardFindDataCount(map);
	   model.addAttribute("list", list);
	   model.addAttribute("count", count);
	   model.addAttribute("main_jsp", "../board/ffind.jsp");
	   return "main/main";
   }
   /*
    *   사용자 
    *    1)          2)                   3)
    *   .do  ==> BoardController <==> BoardDAO <==> 오라클
    *                | Model  4)
    *              ViewResolver
    *                | request 5)
    *               JSP
    */
   // Error 405(get/post)
   @GetMapping("board/fupdate.do")
   public String board_fupdate(int no,int page,Model model)
   {
	   // 결과값 
	   FreeBoardVO vo=fDao.freeboardUpdateData(no);
	   // 데이터연동 (DAO)
	   // 데이터를 JSP로 전송
	   model.addAttribute("vo", vo);
	   model.addAttribute("page", page);
	   model.addAttribute("main_jsp", "../board/fupdate.jsp");
	   return "main/main";
   }
   @PostMapping("board/fupdate_ok.do")
   public String board_fupdate_ok(FreeBoardVO vo,int page,Model model)
   {
	   //데이터베이스 연동 
	   boolean bCheck=fDao.freeboardUpdate(vo);
	   // update_ok.jsp => 결과값을 보내서 사용자가 볼 수 있게 만든다 
	   model.addAttribute("bCheck",bCheck);
	   model.addAttribute("no", vo.getNo());
	   model.addAttribute("page", page);
	   return "board/fupdate_ok";
   }
   
   @GetMapping("board/fdelete.do")
   public String board_fdelete(int no,int page,Model model)
   {
	   model.addAttribute("no", no);
	   model.addAttribute("page", page);
	   return "board/fdelete";
   }
   
   @PostMapping("board/fdelete_ok.do")
   public String board_fdelete_ok(int no,int page,String pwd,Model model)
   {
	   // 결과값 읽기 
	   System.out.println("pwd="+pwd+",no="+no);
	   boolean bCheck=fDao.freeboardDelete(no, pwd);
	   System.out.println("bCheck="+bCheck);
	   // delete_ok.jsp로 결과값을 전송 => 사용자가 볼 수 있게 처리 
	   model.addAttribute("bCheck", bCheck);
	   model.addAttribute("page", page); // list.jsp => no(X) , page(O)
	   return "board/fdelete_ok";
   }
   
  
   
   
}































