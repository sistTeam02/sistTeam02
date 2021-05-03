package com.sist.controller;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAO fdao;
	
	
	//메인으로 전송
	//관심목록(찜&장바구니)
	@GetMapping("mypage/like_list.do")
	public String mypage_like_list(Model model){
		
		model.addAttribute("bread_jsp","../mypage/bread1.jsp");
		model.addAttribute("mypage_jsp","../mypage/like_list.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}
	
	//구매정보
	@GetMapping("mypage/buy_list.do")
	public String mypage_buy_list(Model model){
		
		model.addAttribute("bread_jsp","../mypage/bread2.jsp");
		model.addAttribute("mypage_jsp","../mypage/buy_list.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}

	//나만의 계획(채팅정보 불러오기)
	@GetMapping("mypage/mypage_schedule.do")
	public String mypage_schdule(String page,Model model){
		
		//^잘라서 출력하고싶다~~~~~~
		//채팅데이터 불러오기
		/*String sList="";
		List<Chat_foodVO> fList=fdao.mypage_chat_food(id);
		List<Chat_planVO> pList=fdao.mypage_chat_plan(id);
		*/
		//페이지 나누기
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start",start);
		map.put("end", end);
		List<Chat_foodVO> list=fdao.mypageChatFoodListData(map);
		int totalpage=fdao.mypageChatFoodDataTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		int allPage=totalpage;
		if(endPage>allPage)
			endPage=allPage;
		
		
		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("allPage",allPage);
		model.addAttribute("BLOCK",BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		
		
		/*model.addAttribute("fList",fList);
		model.addAttribute("pList",pList);*/
		
		model.addAttribute("bread_jsp","../mypage/bread3.jsp");
		model.addAttribute("mypage_jsp","../mypage/mypage_schedule.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}
	//회원정보수정
	@GetMapping("mypage/mypage_update.do")
	public String mypage_update(Model model){
		
		
		model.addAttribute("bread_jsp","../mypage/bread4.jsp");
		model.addAttribute("mypage_jsp","../mypage/mypage_update.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}
	
}
