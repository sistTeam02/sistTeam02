package com.sist.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DecimalFormat;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class ShopOrderController {
	
	@Resource(name="shopOrderDAO")
	private ShopOrderDAO sdao;
	// 주문
	@RequestMapping("shop/checkout.do")
	public void order(HttpSession session,ShopOrderVO ovo,ShopOrderDetailVO odvo,Model model)
	{
		MemberVO mvo=(MemberVO)session.getAttribute("member");
		String id=mvo.getId();
		
		Calendar cal=Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		String ym=year+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String ymd=ym+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum="";
		for(int i=1;i<=6;i++)
		{
			subNum+=(int)(Math.random()*10);
		}
		String ono=ymd+"_"+subNum;
		
		ovo.setOno(ono);
		ovo.setId(id);
		sdao.orderInfo(ovo);
		
		//odvo.setOdno();
		sdao.orderInfoDetail(odvo);
		model.addAttribute("main_jsp", "../shop/checkout.jsp");
		//return "redirect:";
	}
}
