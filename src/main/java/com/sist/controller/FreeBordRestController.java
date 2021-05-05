package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class FreeBordRestController {
	@Autowired
	private FreeBoardDAO fDao;
	@Autowired
	private ReplyDAO rDao;
	@Autowired
    private NoticeBoardDAO nDao;
	
	 @PostMapping("board/reply_insert.do")
	   public String board_reply_insert(int bno,String msg,int page,RedirectAttributes ra,HttpSession session)
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
		   ra.addAttribute("page", page);
		   return "redirect:reply_list.do"; // detail.do?no=1&page=1
	   }
	   
	   @PostMapping("board/reply_update.do")
	   public String board_reply_update(int no,int bno,int page,String msg,RedirectAttributes ra)
	   {
		   // 수정 => DAO
		   ReplyVO vo=new ReplyVO();
		   vo.setNo(no);
		   vo.setMsg(msg);
		   rDao.replyUpdate(vo);
		   // 수정 후에 데이터를 보내준다 
		   ra.addAttribute("bno",bno);
		   ra.addAttribute("page",page);
		   return "redirect:reply_list.do";
	   }
	   
	   @PostMapping("board/reply_to_reply_insert.do")
	   public String board_reply_to_reply(int pno,int bno, String msg,int page,RedirectAttributes ra,HttpSession session)
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
		   ra.addAttribute("page", page);
		   return "redirect:reply_list.do";
	   }
	   
	   @GetMapping("board/reply_delete.do")
	   public String board_reply_delete(int no,int bno,int page,RedirectAttributes ra)
	   {
		   // 삭제 처리 ==> DAO(service)
		   rDao.replyDelete(no);
		   ra.addAttribute("bno", bno);
		   ra.addAttribute("page", page);
		   return "redirect:reply_list.do";
	   }
	   
	   @GetMapping("board/reply_list.do")
	   public String board_reply_list(int bno, int page, Model model)
	   {
		   List<ReplyVO> rList=rDao.replyListData(bno);
		   model.addAttribute("page", page);
		   model.addAttribute("rList", rList);
		   model.addAttribute("no", bno);
		   return "board/reply_list";
	   }
	   
	   ////////////////////////  공지사항  ////////////////////////////////////
	   @RequestMapping(value="board/ndelete_ok.do")
	   public String board_ndelete_ok(int no,String pwd)
	   {
		   String msg="";
		   // 데이터베이스에 저장된 파일정보를 받는다 
	       NoticeBoardVO vo=nDao.noticeboardFileInfoData(no);
	       boolean bCheck=nDao.noticeboardDelete(no, pwd);
	       if(bCheck==true)
	       {
	    	   // 파일 지우기 => list.do이동
	    	   msg="<script>location.href=\"nlist.do\";</script>";
	    	   try
	    	   {
	    		   if(vo.getFilecount()!=0)// 파일이 있는 경우에만 삭제
	    		   {
	    			   StringTokenizer st=new StringTokenizer(vo.getFilename(),",");
	    			   while(st.hasMoreTokens())
	    			   {
	    				   File file=new File("c:\\spring-upload\\"+st.nextToken());
	    				   file.delete();
	    			   }
	    			   
	    		   }
	    	   }catch(Exception ex){}
	       }
	       else
	       {
	    	   // 스트립트 => 비밀번호가 틀립니다..
	    	   msg="<script>"
	    		  +"alert(\"비밀번호가 틀립니다!!\");"
	    		  +"history.back();"
	    		  +"</script>";
	       }
		   return msg;
	   }
	

}
