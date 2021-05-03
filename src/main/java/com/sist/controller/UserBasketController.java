package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import javax.servlet.http.HttpSession;
@Controller
public class UserBasketController {
	@Autowired
	private User_basketDAO uDao;
	// 장바구니 리스트
	@RequestMapping("shop/user_basket.do")
	public String basketListData(User_basketVO vo,Model model,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		vo.setId(id);
		if(id==null)
		{
			return "redirect:../member/login.do";
		}
		
		return "shop/shop_list";
	}
	
	// 장바구니 목록
	/*@RequestMapping("shop/basket_insert.do")
	public String insert(Cart)*/
}
