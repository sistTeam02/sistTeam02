package com.sist.controller;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.dao.*;
import com.sist.vo.*;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Controller
public class UserBasketController {
	
	@Resource(name="user_basketDAO")
	private User_basketDAO uDao;
	/*
	 *  private String id;  // 고객 id
		private int no;     // 고유키
		private int pno;    // 제품번호
		private String title;
		private String poster;
		private int price;
		private int ordercount;  // (default 1)
		private int cno;     // 카테고리 번호
		private Date orddate;
		private int state;   // 결제상태(default 0)
	 */
	
	// 장바구니 추가
	@RequestMapping("shop/basket_insert.do")
	public String insert(int pno,String price,int su,HttpSession session,Model model)
	{
		String id=(String)session.getAttribute("id");
		String address=(String)session.getAttribute("address");
		String sp=price.replaceAll("[^0-9]", "");
		System.out.println("id:"+id);
		System.out.println("address:"+address);
		System.out.println("sp:"+sp);
		int total=Integer.parseInt(sp)*su;
		
		User_basketVO vo=new User_basketVO();
		//vo.setAddress(address);
		vo.setId(id);
		vo.setPno(pno);
		vo.setOrdercount(su);
		
		// db
		uDao.basketInsert(vo);
		/*// 장바구니에 기존 상품이 있는지 검사
		int ordercount=uDao.basketCount(vo.getNo(), id);
		if(ordercount==0)
			uDao.basketInsert(vo);  // 없으면 insert
		else{
			uDao.basketUpdate(vo);  // 있으면 update
		}*/
		return "redirect:../shop/user_basket.do";
	}
	// 장바구니 목록
	@RequestMapping("shop/user_basket.do")
	public String basketListData(HttpSession session,Model model)
	{
		String id=(String)session.getAttribute("id");
		model.addAttribute("id", id);
		model.addAttribute("main_jsp", "../shop/user_basket.jsp");
		return "main/main";
	}
	/*결제확인 목록*/
	@GetMapping("shop/user_basket_ok.do")
	public String user_basket_okMain(HttpSession session,Model model,String year,String month){
		System.out.println(year+"-"+month);
		Map map=new HashedMap();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
		String date=year+"-"+month;
		String thisdate=sdf.format(new Date());
		if(year==null){//첫번째 현재달
			date=thisdate;
		}
		map.put("date", date);
		System.out.println(date);
		map.put("id", session.getAttribute("id"));
		List<User_order_basketVO> list=uDao.userPurchaseData(map);
		System.out.println(list.size());
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../shop/user_basket_ok.jsp");
		return "main/main";
	}
	
}
