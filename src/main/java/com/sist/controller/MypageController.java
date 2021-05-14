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
	//관심목록(찜목록 불러오기)
	@GetMapping("mypage/like_list.do")
	public String mypage_like_list(String page,String pageF,HttpSession session,Model model){
		//세션에 저장된 정보 가져오기
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		
		
		//운동용품 찜목록
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=(rowSize*curpage);
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		
		List<GoodsVO> gList=fdao.mypageGoodsJjimList(map);
		int totalpage=fdao.mypageGoodsJjimCount(id);
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		int allpage=totalpage;
		if(endPage>allpage){
			endPage=totalpage;
		}
		model.addAttribute("id",id);
		model.addAttribute("gList",gList);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("BLOCK",BLOCK);
		model.addAttribute("allpage",allpage);
		
		//식품 찜목록
		if(pageF==null)
			pageF="1";
		int curpageF=Integer.parseInt(pageF);
		int rowSizeF=10;
		int startF=(curpageF*rowSizeF)-(rowSizeF-1);
		int endF=(rowSizeF*curpageF);
		Map mapF=new HashMap();
		mapF.put("startF", startF);
		mapF.put("endF", endF);
		mapF.put("id", id);
		
		List<DietFoodVO> dList=fdao.mypageFoodJjimList(mapF);
		int totalpageF=fdao.mypageFoodJjimCount(id);
		
		final int BLOCKF=10;
		int startPageF=((curpageF-1)/BLOCKF*BLOCKF)+1;
		int endPageF=((curpageF-1)/BLOCKF*BLOCKF)+BLOCKF;
		int allpageF=totalpageF;
		if(endPageF>allpageF){
			endPageF=totalpageF;
		}
		
		model.addAttribute("id",id);
		model.addAttribute("dList",dList);
		model.addAttribute("startPageF",startPageF);
		model.addAttribute("endPageF",endPageF);
		model.addAttribute("BLOCKF",BLOCKF);
		model.addAttribute("allpageF",allpageF);
		
		
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
	public String mypage_schdule(HttpSession session,String page,String pageP,Model model){
				
		
		
		//세션에 저장된 정보 가져오기
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		
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
				map.put("id", id);
				List<Chat_foodVO> fList=fdao.mypageChatFoodListData(map);
				int totalpage=fdao.mypageChatFoodDataTotalPage(id);
				
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
	public String mypage_update(Model model,HttpSession session){
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		MemberVO vo=fdao.mypageUpdateAllData(id);
		System.out.println(vo);
		
		
		model.addAttribute("vo",vo);
		model.addAttribute("bread_jsp","../mypage/bread4.jsp");
		model.addAttribute("mypage_jsp","../mypage/mypage_update.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "main/main";
	}
	//수정정보 가져오기-> 저장하기
	@PostMapping("mypage/mypage_update_ok.do")
	public String mypage_update_ok(MemberVO vo,Model model){
		
		fdao.mypageUpdate(vo);
		
		model.addAttribute("id",vo.getId());
		model.addAttribute("pwd",vo.getPwd());
		model.addAttribute("name",vo.getName());
		model.addAttribute("birth",vo.getBirth());
		model.addAttribute("tel",vo.getTel());
		model.addAttribute("phone",vo.getPhone());
		model.addAttribute("email",vo.getEmail());
		model.addAttribute("post",vo.getPost());
		model.addAttribute("nickname",vo.getNickname());
		model.addAttribute("addr1",vo.getAddr1());
		model.addAttribute("addr2",vo.getAddr2());
		
		model.addAttribute("bread_jsp","../mypage/bread4.jsp");
		model.addAttribute("mypage_jsp","../mypage/mypage_update_ok.jsp");
		model.addAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "redirect:../mypage/mypage_update.do";
	}
	
	
}


















