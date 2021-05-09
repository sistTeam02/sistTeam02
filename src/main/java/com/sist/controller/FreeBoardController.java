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
	   
	   final int BLOCK=5;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   int allPage=totalpage;
	   if(endPage>allPage)
	   {
		   endPage=allPage;
	   }
	   
	   // JSP 전송 
	   model.addAttribute("list", list);
	   model.addAttribute("curpage", curpage);
	   model.addAttribute("allPage", allPage);
	   model.addAttribute("BLOCK", BLOCK);
	   model.addAttribute("startPage", startPage);
	   model.addAttribute("endPage", endPage);
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
   public String board_fdetail(int no,Model model)
   {
	   // 데이터 읽기 => DAO연결 
	   FreeBoardVO vo=fDao.freeboardDetailData(no);
	   //List<ReplyVO> rList=rDao.replyListData(no);
	   model.addAttribute("vo", vo);
	   model.addAttribute("main_jsp", "../board/fdetail.jsp");
	   //model.addAttribute("rList", rList);
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
   public String board_fupdate(int no,Model model)
   {
	   // 결과값 
	   FreeBoardVO vo=fDao.freeboardUpdateData(no);
	   // 데이터연동 (DAO)
	   // 데이터를 JSP로 전송
	   model.addAttribute("vo", vo);
	   model.addAttribute("main_jsp", "../board/fupdate.jsp");
	   return "main/main";
   }
   @PostMapping("board/fupdate_ok.do")
   public String board_fupdate_ok(FreeBoardVO vo,Model model)
   {
	   //데이터베이스 연동 
	   boolean bCheck=fDao.freeboardUpdate(vo);
	   // update_ok.jsp => 결과값을 보내서 사용자가 볼 수 있게 만든다 
	   model.addAttribute("bCheck",bCheck);
	   model.addAttribute("no", vo.getNo());
	   return "board/fupdate_ok";
   }
   
   @GetMapping("board/fdelete.do")
   public String board_fdelete(int no,Model model)
   {
	   model.addAttribute("no", no);
	   return "board/fdelete";
   }
   
   @PostMapping("board/fdelete_ok.do")
   public String board_fdelete_ok(int no,String pwd,Model model)
   {
	   // 결과값 읽기 
	   System.out.println("pwd="+pwd+",no="+no);
	   boolean bCheck=fDao.freeboardDelete(no, pwd);
	   System.out.println("bCheck="+bCheck);
	   // delete_ok.jsp로 결과값을 전송 => 사용자가 볼 수 있게 처리 
	   model.addAttribute("bCheck", bCheck);
	   return "board/fdelete_ok";
   }
   
   
   @PostMapping("board/reply_insert.do")
   public String board_reply_insert(int bno,String msg,RedirectAttributes ra,HttpSession session)
   {
	   ReplyVO vo=new ReplyVO();
	   vo.setBno(bno);
	   vo.setMsg(msg);
	   String name=(String)session.getAttribute("name");
	   String id=(String)session.getAttribute("id");
	   vo.setName(name);
	   vo.setId(id);
	   
	   // ReplyDAO로 전송 
	   rDao.replyInsert(vo);
	   // .do?bno=10&page=1
	   ra.addAttribute("bno", bno);
	   return "redirect:reply_list.do"; // detail.do?no=1&page=1
   }
   
   @PostMapping("board/reply_update.do")
   public String board_reply_update(int no,int bno,String msg,RedirectAttributes ra)
   {
	   // 수정 => DAO
	   ReplyVO vo=new ReplyVO();
	   vo.setNo(no);
	   vo.setMsg(msg);
	   rDao.replyUpdate(vo);
	   // 수정 후에 데이터를 보내준다 
	   ra.addAttribute("bno",bno);
	   return "redirect:reply_list.do";
   }
   
   @PostMapping("board/reply_to_reply_insert.do")
   public String board_reply_to_reply(int pno,int bno, String msg,RedirectAttributes ra,HttpSession session)
   {
	   // 댓글 추가 작업 ==> DAO
	   ReplyVO vo=new ReplyVO();
	   String name=(String)session.getAttribute("name");
	   String id=(String)session.getAttribute("id");
	   vo.setName(name);
	   vo.setId(id);
	   vo.setBno(bno);
	   vo.setMsg(msg);
	   rDao.replyToReplyInsert(pno, vo);
	   ra.addAttribute("bno", vo.getBno());
	   return "redirect:reply_list.do";
   }
   
   @GetMapping("board/reply_delete.do")
   public String board_reply_delete(int no,int bno,RedirectAttributes ra)
   {
	   // 삭제 처리 ==> DAO(service)
	   rDao.replyDelete(no);
	   ra.addAttribute("bno", bno);
	   return "redirect:reply_list.do";
   }
   
   @GetMapping("board/reply_list.do")
   public String board_reply_list(int bno, Model model)
   {
	   List<ReplyVO> rList=rDao.replyListData(bno);
	   model.addAttribute("rList", rList);
	   model.addAttribute("no", bno);
	   return "board/reply_list";
   }
   
   
  
   
   
}































