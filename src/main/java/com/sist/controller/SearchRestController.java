package com.sist.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.sist.dao.SearchDAO;
import com.sist.vo.DietFoodVO;
import com.sist.vo.GoodsVO;

@Controller
public class SearchRestController {
	
	@Autowired
	private SearchDAO sdao;
	
	@RequestMapping(value="main/json.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String json(Model model, String search){
		List<String> slist=sdao.searchAutocomplete(search);
		String[] arr=new String[slist.size()];
		arr=slist.toArray(arr);
		Gson gson=new Gson();
		return gson.toJson(arr);
	}
}
