package com.sist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.SearchDAO;
import com.sist.dao.WalkDAO;
import com.sist.vo.DietFoodVO;
import com.sist.vo.GoodsVO;
import com.sist.vo.KeywordVO;

@Controller
public class MainSearchController {
	@Autowired
	private SearchDAO sdao;
	
	
	@GetMapping("main/search.do")
	public String main_search(String search, Model model){
		String keyword=search;
		sdao.searchInsert(keyword);
		List<KeywordVO> klist=sdao.keywordList();
		List<GoodsVO> glist=sdao.searchGoods(search);
		List<DietFoodVO> dlist=sdao.searchDietfood(search);
		model.addAttribute("klist",klist);
		model.addAttribute("glist",glist);
		model.addAttribute("dlist",dlist);
		model.addAttribute("search",search);
		model.addAttribute("main_jsp","../main/search.jsp");
		return "main/main";
	}
	
	@GetMapping("main/search_category.do")
	public String main_search_category(String no, String search, String page, Model model){
		String keyword=search;
		sdao.searchInsert(keyword);
		Map map=new HashMap();
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowsize=12;
		int start=(rowsize*curpage)-(rowsize-1);
		int end=rowsize*curpage;
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		int totalpage=0;
		final int BLOCK=10;
		int startPage=0;
		int endPage=0;
		int allPage=0;
		/*if(no.equals("1")){//홈트
			
		}*/
		/*else*/ if(no.equals("2")){//건강식품
			List<DietFoodVO> dlist=sdao.searchDietfoodAll(map);
			totalpage=sdao.searchDietfoodAllPage(search);
			model.addAttribute("list",dlist);
			startPage=((curpage-1)/BLOCK*BLOCK)+1;
			endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			allPage=totalpage;
			if(endPage>allPage)
				   endPage=allPage;
		}
		else if(no.equals("3")){//운동기구
			List<GoodsVO> glist=sdao.searchGoodsAll(map);
			totalpage=sdao.searchGoodsAllPage(search);
			model.addAttribute("list",glist);
			startPage=((curpage-1)/BLOCK*BLOCK)+1;
			endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			allPage=totalpage;
			if(endPage>allPage)
				   endPage=allPage;
		}
		model.addAttribute("no",no);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("curpage",curpage);
		model.addAttribute("search",search);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("main_jsp","../main/search_category.jsp");
		return "main/main";
	}
}
