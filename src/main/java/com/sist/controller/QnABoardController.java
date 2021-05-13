package com.sist.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.QnABoardDAO;
import com.sist.dao.ReplyDAO;
import com.sist.vo.FindVO;
import com.sist.vo.QnABoardVO;
import com.sist.vo.QnABoard_ReplyVO;
import com.sist.vo.ReplyVO;


@Controller
public class QnABoardController {
	@Autowired
	   private QnABoardDAO qDao;
	   @Autowired
	   private ReplyDAO rDao;
	   
	   
	   @GetMapping("board/qlist.do")
	   public String board_qlist(String page,Model model)
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
		   List<QnABoardVO> list=qDao.qnaboardListData(map);
		   QnABoard_ReplyVO qvo=new QnABoard_ReplyVO();
		   int totalpage=qDao.qnaboardTotalPage();
		   
		   final int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   int allPage=totalpage;
		   if(endPage>allPage)
		   {
			   endPage=allPage;
		   }
		   
		   // JSP 전송 
		   model.addAttribute("qvo",qvo);
		   model.addAttribute("list", list);
		   model.addAttribute("curpage", curpage);
		   model.addAttribute("allPage", allPage);
		   model.addAttribute("BLOCK", BLOCK);
		   model.addAttribute("startPage", startPage);
		   model.addAttribute("endPage", endPage);
		   model.addAttribute("main_jsp", "../board/qlist.jsp");
		   
		   return "main/main";
	   }
	   // 글쓰기
	   @GetMapping("board/qinsert.do")
	   public String board_qinsert(Model model)
	   {
		   model.addAttribute("main_jsp", "../board/qinsert.jsp");
		   return "main/main";
	   }
	   @PostMapping("board/qinsert_ok.do")
	   public String board_qinsert_ok(QnABoardVO vo)
	   {
		   //DAO연결 
		   qDao.qnaboardInsert(vo);
		   return "redirect:qlist.do";
	   }
	   @GetMapping("board/qdetail.do")
	   public String board_qdetail(int no,int page,Model model)
	   {
		   // 데이터 읽기 => DAO연결 
		   QnABoardVO vo=qDao.qnaboardDetailData(no);
		   //List<ReplyVO> rList=service.replyListData(no);
		   model.addAttribute("vo", vo);
		   model.addAttribute("page", page);
		   model.addAttribute("main_jsp", "../board/qdetail.jsp");
		   //model.addAttribute("rList", rList);
		   return "main/main";
	   }
	   @PostMapping("board/qfind.do")
	   public String board_qfind(String fs,String ss,Model model)
	   {
		   FindVO vo=new FindVO();
		   vo.setFs(fs);
		   vo.setSs(ss);
		   Map map=new HashMap();
		   map.put("fs",fs);
		   map.put("ss", ss);
		   map.put("fsArr", vo.getFsArr());
		   List<QnABoardVO> list=qDao.qnaboardFindData(map);
		   int count=qDao.qnaboardFindDataCount(map);
		   model.addAttribute("list", list);
		   model.addAttribute("count", count);
		   model.addAttribute("main_jsp", "../board/qfind.jsp");
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
	   @GetMapping("board/qupdate.do")
	   public String board_qupdate(int no,int page,Model model)
	   {
		   // 결과값 
		   QnABoardVO vo=qDao.qnaboardUpdateData(no);
		   // 데이터연동 (DAO)
		   // 데이터를 JSP로 전송
		   model.addAttribute("vo", vo);
		   model.addAttribute("page", page);
		   model.addAttribute("main_jsp", "../board/qupdate.jsp");
		   return "main/main";
	   }
	   @PostMapping("board/qupdate_ok.do")
	   public String board_qupdate_ok(QnABoardVO vo,int page,Model model)
	   {
		   //데이터베이스 연동 
		   boolean bCheck=qDao.qnaboardUpdate(vo);
		   // update_ok.jsp => 결과값을 보내서 사용자가 볼 수 있게 만든다 
		   model.addAttribute("bCheck",bCheck);
		   model.addAttribute("no", vo.getNo());
		   model.addAttribute("page", page);
		   return "board/qupdate_ok";
	   }
	   
	   @GetMapping("board/qdelete.do")
	   public String board_qdelete(int no,int page,Model model)
	   {
		   model.addAttribute("no", no);
		   model.addAttribute("page", page);
		   return "board/qdelete";
	   }
	   
	   @PostMapping("board/qdelete_ok.do")
	   public String board_qdelete_ok(int no,String pwd,int page,Model model)
	   {
		   // 결과값 읽기 
		   System.out.println("pwd="+pwd+",no="+no);
		   boolean bCheck=qDao.qnaboardDelete(no, pwd);
		   System.out.println("bCheck="+bCheck);
		   // delete_ok.jsp로 결과값을 전송 => 사용자가 볼 수 있게 처리
		   model.addAttribute("page", page);
		   model.addAttribute("bCheck", bCheck);
		   return "board/qdelete_ok";
	   }
	   
	   /////////////////// 답변 ////////////////////////////////////////
	   @GetMapping("board/qreply_list.do")
	   public String board_qreply(int mno,Model model)
	   {
		   // 데이터 읽기 => DAO연결 
		   QnABoard_ReplyVO vo=qDao.qnaboardReplyData(mno);
		   model.addAttribute("vo", vo);
		   return "board/qreply_list";
	   }
	   
	  
	   
	   
	}


