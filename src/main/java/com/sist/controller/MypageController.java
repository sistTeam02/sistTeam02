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
	
	
	
	//메인으로 전송
	//관심목록(찜&장바구니)
	@GetMapping("mypage/like_list.do")
	public String mypage_like_list(Model model){
		model.addAttribute("mypage_jsp","../mypage/like_list.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}
	
	//구매정보
	@GetMapping("mypage/buy_list.do")
	public String mypage_buy_list(Model model){
		model.addAttribute("mypage_jsp","../mypage/buy_list.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}

	//나만의 계획(채팅정보 불러오기)
	@GetMapping("mypage/mypage_schedule.do")
	public String mypage_schdule(Model model){
		model.addAttribute("mypage_jsp","../mypage/mypage_schedule.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}
	//회원정보수정
	@GetMapping("mypage/mypage_update.do")
	public String mypage_update(Model model){
		
		model.addAttribute("mypage_jsp","../mypage/mypage_update.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}
	
}
