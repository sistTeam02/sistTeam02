package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.controller.ShopRestController.*;
import com.sist.dao.*;
@Controller
public class GoodsController {
	// GoodsDAO 저장
	@Autowired
	private GoodsDAO gDao;
	
	@GetMapping("shop/shop_list.do")
	public String shop_list(String page,Model model,HttpServletRequest request)
	{
		try
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
			int count=gDao.goodsCount();
			
			final int BLOCK=9;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalpage)
				endPage=totalpage;
			
			model.addAttribute("list", list);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
					
			model.addAttribute("BLOCK", BLOCK);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("count", count);
			
			// 쿠키
			Cookie[] cookies=request.getCookies();
			List<String> cList=new ArrayList<String>();
			if(cookies!=null)
			{
				for(int i=cookies.length-1;i>=0;i--)
				{
					cookies[i].setPath("/");
					if(cookies[i].getName().startsWith("m"))
					{
						GoodsDetailVO vo=gDao.goodsDetailData(Integer.parseInt(cookies[i].getValue()));
						cList.add(vo.getPoster());
					}
				}
				model.addAttribute("cList", cList);
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
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
		// 데이터 전송
		model.addAttribute("gvo", gvo);
		model.addAttribute("main_jsp", "../shop/shop_detail.jsp");
		return "main/main";
	}
	// 찜하기
	@PostMapping("mypage/like_list_insert.do")
	public ActionForward goodsJjimUpdate(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		Map<String, Object> map = new HashMap<>();
		map.put("pno", request.getParameter("pno"));
		map.put("id", request.getParameter("id"));
		
		GoodsDAO gdao = GoodsDAO.getInstance();
		// 찜 확인
		int result = gdao.goodsJjimCheck(map);
		
		if(result == 0){ // 찜하기
			gdao.goodsJjimUpdate(map);
		}else{ // 찜 취소
			gdao.goodsJjimDelete(map);
		}
		model.addAttribute("main_jsp", "../mypage/like_list.jsp");
		return null;
	}
	// 찜 수량
	@PostMapping("mypage/like_list_count.do")
	public ActionForward goodsJjimCount(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter out = response.getWriter();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		GoodsDAO gdao = GoodsDAO.getInstance();
		int count = gdao.goodsJjimCount(no);
		out.println(count);
		out.close();
		model.addAttribute("main_jsp", "../mypage/like_list.jsp");
		return null;
	}
	
	// 댓글
	@GetMapping("shop/shop_reply.do")
	public String shop_reply(int pno, Model model){

	
		List<ShopReplyVO> rList=gDao.shopReplyListData(pno);
		model.addAttribute("rList", rList);
		model.addAttribute("no", pno);

		return "shop/shop_detail";
	}
	
	@GetMapping("shop/shop_reply_delete.do")
	public String shop_reply_delete(int no,int pno,RedirectAttributes ra)
	{
		gDao.shopReplyDelete(no);
		ra.addAttribute("pno", pno);
		 
		return "redirect:shop_reply.do";
	}
	
	@PostMapping("shop/shop_reply_to_reply_insert.do")
	public String shop_reply_to_reply(int pno,String msg,RedirectAttributes ra,HttpSession session)
	{
		// 댓글 추가 작업 ==> DAO
		ShopReplyVO vo=new ShopReplyVO();
		String name=(String)session.getAttribute("name");
		String id=(String)session.getAttribute("id");
		vo.setName(name);
		vo.setId(id);
		vo.setPno(pno);
		vo.setMsg(msg);
//		gDao.shopReplyToReplyInsert(pno, vo);
		ra.addAttribute("pno", vo.getPno());
		 
		return "redirect:shop_reply.do";
	}
	 
	@PostMapping("shop/shop_reply_update.do")
	public String shop_reply_update(int no,int pno,String msg,RedirectAttributes ra)
	{
		 ShopReplyVO vo=new ShopReplyVO();
		 vo.setNo(no);
		 vo.setMsg(msg);
		 gDao.shopReplyUpdate(vo);
		 ra.addAttribute("pno",pno);
		 
		 return "redirect:shop_reply.do";
	}
	 
	@PostMapping("shop/shop_reply_insert.do")
	public String board_reply_insert(int pno,String msg,RedirectAttributes ra,HttpSession session)
	{
		 ShopReplyVO vo=new ShopReplyVO();
		 vo.setPno(pno);
		 vo.setMsg(msg);
		 String name=(String)session.getAttribute("name");
		 String id=(String)session.getAttribute("id");
		 vo.setName(name);
		 vo.setId(id);

		 gDao.shopReplyInsert(vo);
	     ra.addAttribute("pno", pno);
		 return "redirect:shop_reply.do";
	}

}