package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import javax.annotation.Resource;
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
		vo.setAddress(address);
		vo.setId(id);
		vo.setPno(pno);
		vo.setOrdercount(su);
		vo.setTotal_price(total);
		vo.setPrice(Integer.parseInt(sp));
		
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
		List<User_basketVO> uList=uDao.basketListData(id);  // 장바구니 정보
//		Map<String,Object> map=new HashMap<String,Object>();
//		int money=uDao.basketMoney(id);  // 장바구니 전체 금액 호출
//		// 로그인 안되어있으면, 로그인 페이지로 이동
//		if(id==null)
//		{
//			return "redirect:../member/login.do";
//		}
//		map.put("uList", uList);  // 장바구니 정보 map에 저장
//		map.put("ordercount", uList.size());  // 장바구니 상품의 유무
//		map.put("money", money);  // 장바구니 전체 금액
		model.addAttribute("uList", uList);
		model.addAttribute("main_jsp", "../shop/user_basket.jsp");
		return "main/main";
	}
//	
//	// 장바구니 삭제
//	@RequestMapping("shop/basket_delete.do")
//	public String basketDelete(@RequestParam int no)
//	{
//		uDao.basketDelete(no);
//		return "redirect:../shop/user_basket.do";
//	}
//	
//	// 장바구니 수정
//	@RequestMapping("shop/basket_update.do")
//	public String basketUpdate(@RequestParam int[] ordercount,@RequestParam int[] pno,HttpSession session)
//	{
//		// session의 id
//		String id=(String)session.getAttribute("id");
//		// 레코드의 갯수만큼 반복문 실행
//		for(int i=0;i<pno.length;i++)
//		{
//			User_basketVO vo=new User_basketVO();
//			vo.setId(id);
//			vo.setOrdercount(ordercount[i]);
//			vo.setPno(pno[i]);
//			uDao.basketUpdate(vo);
//		}
//		return "redirect:../shop/user_basket.do";
//	}
}
