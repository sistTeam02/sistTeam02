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
	@Autowired
	private ShopReplyDAO sDao;
	
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
						GoodsDetailVO gvo=gDao.goodsDetailData(Integer.parseInt(cookies[i].getValue()));
						cList.add(gvo.getPoster());
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
	
	// 리뷰 조회
	@GetMapping("shop/shop_reply.do")
	public String shop_reply(int pno, Model model) throws Exception
	{
		List<ShopReplyVO> rList=sDao.shopReplyListData(pno);
		model.addAttribute("rList", rList);
		model.addAttribute("no", pno);

		return "shop/shop_detail";
	}
	
	@GetMapping("shop/shop_reply_delete.do")
	public String shopReplyDelete(ShopReplyVO svo,int pno,RedirectAttributes ra) throws Exception
	{
		sDao.shopReplyDelete(svo);
		ra.addAttribute("pno", pno);
		 
		return "redirect:shop_reply.do";
	}
	
	 
	@PostMapping("shop/shop_reply_update.do")
	public String shop_reply_update(int no,int pno,String msg,RedirectAttributes ra) throws Exception
	{
		 ShopReplyVO vo=new ShopReplyVO();
		 vo.setNo(no);
		 vo.setMsg(msg);
		 sDao.shopReplyUpdate(vo);
		 ra.addAttribute("pno",pno);
		 
		 return "redirect:shop_reply.do";
	}
	 
	// 댓글 작성
	@PostMapping("shop/shop_detail_ok.do")
	public String shopReplyInsert(ShopReplyVO svo,int pno,RedirectAttributes ra,HttpSession session,Model model) throws Exception
	{
		 /*String name=(String)session.getAttribute("name");
		 String msg=(String)session.getAttribute("msg");
		 svo.setPno(pno);
		 svo.setMsg(msg);
		 svo.setName(name);*/
		 
		 sDao.shopReplyInsert(svo);
		 System.out.println("확인중controller1...");
	     ra.addAttribute("pno", svo.getPno());
	     System.out.println("확인중controller2...");
	     model.addAttribute("main_jsp", "../shop/shop_detail.jsp");
		 return "redirect:shop/shop_list.do?no="+svo.getPno();
	}

}