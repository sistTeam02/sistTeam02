package com.sist.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.WalkDAO;
import com.sist.vo.WalkReplyVO;
import com.sist.vo.WalkVO;

@Controller
public class WalkController {
	@Autowired
	private WalkDAO wdao;
	
	@GetMapping("walk/walk.do")
	public String walk_walk(Model model){
		List<WalkVO> list=wdao.walkAllData();
		model.addAttribute("list",list);
		model.addAttribute("main_jsp","../walk/walk.jsp");
		return "main/main";
	}
	
	@GetMapping("walk/walk_detail.do")
	   public String walk_detail(int no,Model model)
	   {
			WalkVO vo=wdao.walkDetailData(no);
		
			String addr=vo.getAddr();
	
			//System.out.println(addr);
			if(addr.contains("(")&&!addr.contains("과천"))
				addr=addr.substring(addr.indexOf("서"),addr.lastIndexOf("("));
			else if(addr.contains("과천"))
				addr=addr.substring(addr.indexOf("경"),addr.lastIndexOf("("));
			else if(addr.contains("경기"))
				addr=addr.substring(addr.indexOf("서"),addr.lastIndexOf("경"));
			else
				addr=addr.substring(addr.indexOf("서"));
		
			vo.setAddr(addr);
	
			model.addAttribute("vo",vo);
		
		   return "walk/walk_detail";
	   }
	
	@GetMapping("walk/walk_reply.do")
	public String walk_reply(int bno, Model model){

	
		List<WalkReplyVO> rList=wdao.walkReplyListData(bno);

		model.addAttribute("rList", rList);
	
		model.addAttribute("no", bno);

	
		return "walk/walk_reply";
	}
	
	@GetMapping("walk/walk_reply_delete.do")
	   public String walk_reply_delete(int no,int bno,RedirectAttributes ra)
	   {
		   wdao.walkReplyDelete(no);
		   ra.addAttribute("bno", bno);
		  
		   return "redirect:walk_reply.do";
	   }
	
	 @PostMapping("walk/walk_reply_to_reply_insert.do")
	   public String walk_reply_to_reply(int pno,int bno,String msg,RedirectAttributes ra,HttpSession session)
	   {
		   // 댓글 추가 작업 ==> DAO
		   WalkReplyVO vo=new WalkReplyVO();
		   String name=(String)session.getAttribute("name");
		   String id=(String)session.getAttribute("id");
		   vo.setName(name);
		   vo.setId(id);
		   vo.setBno(bno);
		   vo.setMsg(msg);
		   wdao.walkReplyToReplyInsert(pno, vo);
		   ra.addAttribute("bno", vo.getBno());
		  
		   return "redirect:walk_reply.do";
	   }
	 
	 @PostMapping("walk/walk_reply_update.do")
	   public String walk_reply_update(int no,int bno,String msg,RedirectAttributes ra)
	   {

		   WalkReplyVO vo=new WalkReplyVO();
		   vo.setNo(no);
		   vo.setMsg(msg);
		   wdao.walkReplyUpdate(vo);

		   ra.addAttribute("bno",bno);
		 
		   return "redirect:walk_reply.do";
	   }
	 
	 @PostMapping("walk/walk_reply_insert.do")
	   public String board_reply_insert(int bno,String msg,RedirectAttributes ra,HttpSession session)
	   {
		   WalkReplyVO vo=new WalkReplyVO();
		   vo.setBno(bno);
		   vo.setMsg(msg);
		   String name=(String)session.getAttribute("name");
		   String id=(String)session.getAttribute("id");
		   vo.setName(name);
		   vo.setId(id);
		   

		   wdao.walkReplyInsert(vo);

		   ra.addAttribute("bno", bno);
		 
		   return "redirect:walk_reply.do";
	   }
}
