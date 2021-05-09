package com.sist.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.SearchDAO;
import com.sist.vo.DietFoodVO;
import com.sist.vo.GoodsVO;

@RestController
public class SearchRestController {
	
	@Autowired
	private SearchDAO sdao;
	
	@GetMapping("main/search_keyword.do")
	public String search_keyword(String keyword, String search, String page, String no){
		String json="";
		/*
		 * 
		 */
		try{
			sdao.searchInsert(search);
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			Map map=new HashMap();
			int rowsize=12;
			int start=(rowsize*curpage)-(rowsize-1);
			int end=rowsize*curpage;
			map.put("start", start);
			map.put("end", end);
			map.put("search", search);
			map.put("keyword", keyword);
			int totalpage=0;
			final int BLOCK=10;
			int startPage=0;
			int endPage=0;
			int allPage=0;
			List<String> klist=new ArrayList<String>();
			JSONArray arr=new JSONArray();
			int i=0;
			if(keyword==null){
				/*if(no.equals("1")){//홈트
				klist=sdao.hometKeyword();
			}*/
			/*else*/ if(no.equals("2")){//건강식품
				List<DietFoodVO> dlist=sdao.searchDietfoodAll(map);
				totalpage=sdao.searchDietfoodAllPage(search);
				klist=sdao.foodsKeyword();
				
				startPage=((curpage-1)/BLOCK*BLOCK)+1;
				endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
				allPage=totalpage;
				if(endPage>allPage)
					   endPage=allPage;
				for(DietFoodVO vo:dlist){
					JSONObject obj=new JSONObject();
					obj.put("no", vo.getNo());
					obj.put("title", vo.getTitle());
					obj.put("poster", vo.getPoster());
					obj.put("price", vo.getPrice());
					if(i==0){
						obj.put("curpage", curpage);
						obj.put("totalpage", totalpage);
						obj.put("BLOCK", BLOCK);
						obj.put("startPage", startPage);
						obj.put("endPage", endPage);
						obj.put("allPage", allPage);
						obj.put("no", no);
						obj.put("keyword", keyword);
						obj.put("search", search);
					}
					arr.add(obj);
					i++;
				}
				}
				else if(no.equals("3")){//운동기구
					List<GoodsVO> glist=sdao.searchGoodsAll(map);
					totalpage=sdao.searchGoodsAllPage(search);
					klist=sdao.goodsKeyword();
					
					startPage=((curpage-1)/BLOCK*BLOCK)+1;
					endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
					allPage=totalpage;
					if(endPage>allPage)
						   endPage=allPage;
					for(GoodsVO vo:glist){
						JSONObject obj=new JSONObject();
						obj.put("no", vo.getNo());
						obj.put("title", vo.getTitle());
						obj.put("poster", vo.getPoster());
						obj.put("price", vo.getPrice());
						if(i==0){
							obj.put("curpage", curpage);
							obj.put("totalpage", totalpage);
							obj.put("BLOCK", BLOCK);
							obj.put("startPage", startPage);
							obj.put("endPage", endPage);
							obj.put("allPage", allPage);
							obj.put("no", no);
							obj.put("keyword", keyword);
							obj.put("search", search);
						}
						arr.add(obj);
						i++;
					}
				}
			}
			else{
				if(no.equals("1")){
					
				}
				else if(no.equals("2")){
					List<DietFoodVO> dlist=sdao.foodsKeywordSearch(map);
					totalpage=sdao.foodsKeywordPage(map);
					startPage=((curpage-1)/BLOCK*BLOCK)+1;
					endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
					allPage=totalpage;
					if(endPage>allPage)
						   endPage=allPage;
					for(DietFoodVO vo:dlist){
						JSONObject obj=new JSONObject();
						obj.put("no", vo.getNo());
						obj.put("title", vo.getTitle());
						obj.put("poster", vo.getPoster());
						obj.put("price", vo.getPrice());
						if(i==0){
							obj.put("curpage", curpage);
							obj.put("totalpage", totalpage);
							obj.put("BLOCK", BLOCK);
							obj.put("startPage", startPage);
							obj.put("endPage", endPage);
							obj.put("allPage", allPage);
							obj.put("no", no);
							obj.put("keyword", keyword);
							obj.put("search", search);
						}
						arr.add(obj);
						i++;
					}
				}
				else{
					List<GoodsVO> glist=sdao.goodsKeywordSearch(map);
					totalpage=sdao.goodsKeywordPage(map);
					startPage=((curpage-1)/BLOCK*BLOCK)+1;
					endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
					allPage=totalpage;
					if(endPage>allPage)
						   endPage=allPage;
					for(GoodsVO vo:glist){
						JSONObject obj=new JSONObject();
						obj.put("no", vo.getNo());
						obj.put("title", vo.getTitle());
						obj.put("poster", vo.getPoster());
						obj.put("price", vo.getPrice());
						if(i==0){
							obj.put("curpage", curpage);
							obj.put("totalpage", totalpage);
							obj.put("BLOCK", BLOCK);
							obj.put("startPage", startPage);
							obj.put("endPage", endPage);
							obj.put("allPage", allPage);
							obj.put("no", no);
							obj.put("keyword", keyword);
							obj.put("search", search);
						}
						arr.add(obj);
						i++;
					}
				}
			}
			json=arr.toJSONString();
		}
		catch(Exception ex){}
		return json;
	}
}
