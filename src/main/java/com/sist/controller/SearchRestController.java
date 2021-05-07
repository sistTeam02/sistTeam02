package com.sist.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.SearchDAO;

@RestController
public class SearchRestController {
	
	@Autowired
	private SearchDAO sdao;
	
	@GetMapping("main/search_keyword.do")
	public String search_keyword(String keyword, String search, String page){
		String json="";
		/*
		 * 
		 */
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end",end);
		
		return json;
	}
}
