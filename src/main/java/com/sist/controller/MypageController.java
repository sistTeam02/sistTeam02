package com.sist.controller;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("id")
public class MypageController {
	
	@Autowired
	private MypageDAO fdao;
	@Autowired
	private MemberDAO mdao;
	
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
	public String mypage_schdule(HttpServletRequest request,String id,String page,String pageP,Model model){
				
		
		
		//세션에 저장된 아이디 가져오기
		HttpSession session=request.getSession();
		//String user_id=(String)session.getAttribute("id");

		System.out.println("id:"+id);
		
				//페이지 나누기(음식)
				if(page==null)
					page="1";
				int curpage=Integer.parseInt(page);
				Map map=new HashMap();
				int rowSize=10;
				int start=(rowSize*curpage)-(rowSize-1);
				int end=rowSize*curpage;
				map.put("start", start);
				map.put("end", end);
				
				List<Chat_foodVO> fList=fdao.mypageChatFoodListData(map);
				int totalpage=fdao.mypageChatFoodDataTotalPage(id);
				for(Chat_foodVO vo:fList){
					session.setAttribute("id",vo.getId() );
				}
				map.put("id",id);
						
						
				final int BLOCK=10;
				int startPage=((curpage-1)/BLOCK*BLOCK)+1;
				int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
				int allPage=totalpage;
				if(endPage>allPage)
					endPage=allPage;
				
				model.addAttribute("id",id);
				model.addAttribute("fList",fList);
				model.addAttribute("curpage",curpage);
				model.addAttribute("allPage",allPage);
				model.addAttribute("BLOCK",BLOCK);
				model.addAttribute("startPage",startPage);
				model.addAttribute("endPage",endPage);
				
				
				//페이지나누기(운동)
				if(pageP==null)
					pageP="1";
				int curpageP=Integer.parseInt(pageP);
				Map mapP=new HashMap();
				int rowSizeP=10;
				int startP=(rowSizeP*curpageP)-(rowSizeP-1);
				int endP=rowSizeP*curpageP;
				mapP.put("startP", startP);
				mapP.put("endP", endP);
				mapP.put("id", id);
				List<Chat_planVO> pList=fdao.mypageChatPlanListData(mapP);
				for(Chat_planVO vo:pList){
					String s=vo.getSport();
					s=s.replace("^"," ");
					vo.setSport(s);
				}
				
				int totalpageP=fdao.mypageChatPlanDataTotalPage(id);
				
				final int BLOCKP=10;
				int startPageP=((curpageP-1)/BLOCKP*BLOCKP)+1;
				int endPageP=((curpageP-1)/BLOCKP*BLOCKP)+BLOCKP;
				int allPageP=totalpageP;
				if(endPageP>allPageP)
					endPageP=allPageP;
				
				model.addAttribute("id",id);
				model.addAttribute("pList",pList);
				model.addAttribute("curpageP",curpageP);
				model.addAttribute("allPageP",allPageP);
				model.addAttribute("BLOCKP",BLOCKP);
				model.addAttribute("startPageP",startPageP);
				model.addAttribute("endPageP",endPageP);
				
				model.addAttribute("bread_jsp","../mypage/bread3.jsp");
				model.addAttribute("mypage_jsp","../mypage/mypage_schedule.jsp");
				model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
				return "main/main";
	}
	


	//회원정보수정
	@GetMapping("mypage/mypage_update.do")
	public String mypage_update(String id,Model model){
		MemberVO vo=new MemberVO();
		
		
		model.addAttribute("bread_jsp","../mypage/bread4.jsp");
		model.addAttribute("mypage_jsp","../mypage/mypage_update.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}
	//수정정보 가져오기-> 저장하기
	@PostMapping("mypage/mypage_update_ok.do")
	public String mypage_update_ok(MemberVO vo){
		fdao.mypageUpdate(vo);
		return "main/main";
	}
	
	
}
