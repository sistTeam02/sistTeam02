package com.sist.controller;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@Autowired
	private MemberDAO dao;
	
	//관심목록(찜&장바구니)
	@GetMapping("mypage/mypage.do")
		public String mypage_mypage(int id,MemberVO vo,Model model){
		
		model.addAttribute("id",id);
		return "mypage/main";
	}
	//구매정보
	@GetMapping("mypage/buy_list.do")
	public String mypage_buy_list(int id,MemberVO vo,Model model){
		
		model.addAttribute("id",id);
		return "mypage/buy_list";
	}

	//나만의 계획(채팅)
	@GetMapping("mypage/schedule.do")
	public String mypage_schdule(int id,Model model){
		
		model.addAttribute("id",id);
		return "mypage/schedule";
	}
	//회원정보수정
	@GetMapping("mypage/update.do")
	public String mypage_update(int id,Model model){
		
		//MemberVO vo=
		//model.addAttribute("vo",vo);
		return "mypage/update";
	}
	
}
