package com.sist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.AdminDAO;
import com.sist.vo.User_order_basketVO;

@RestController
public class AdminRestController {
	@Autowired
	private AdminDAO dao;
	
	@GetMapping("admin/user_purchaseList.do")
	public String purchaseList(int page){
		String json="";
		try {
			int rowSize=10;
			int start=1+(page-1)*rowSize;
			int end=rowSize*page;
			Map map=new HashMap();
			map.put("start", start);
			map.put("end", end);
			List<User_order_basketVO> list=dao.basketList(map);
			JSONArray arr=new JSONArray();
			for(User_order_basketVO vo:list){
				JSONObject obj=new JSONObject();
				obj.put("id",vo.getId());
				obj.put("no",vo.getNo());
				obj.put("pno",vo.getPno());
				obj.put("cno",vo.getPno());
				obj.put("title",vo.getTitle());
				obj.put("state",vo.getState());
				obj.put("price",vo.getPrice());
				obj.put("ordercount",vo.getOrdercount());
				arr.add(obj);
			}
			json=arr.toJSONString();
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		return json;
	}
	@GetMapping("admin/user_purchaseList_totalpage.do")
	public String totalpage(){
		String totalpage="";
		int total=dao.basketListTotalPage();
		totalpage=total+"";
		return totalpage;
	}
	@PostMapping("admin/save_state.do")
	public String save_state(String box){
		String result="";
		try{
			Map map=new HashMap();
			JSONParser jp=new JSONParser();
			JSONArray arr=(JSONArray)jp.parse(box);
				
		for(int i=0;i<arr.size();i++){
			JSONObject obj=(JSONObject)arr.get(i);
				String strno=(String)obj.get("no");
				String strState=(String)obj.get("state");
				int no=Integer.parseInt(strno);
				int state=Integer.parseInt(strState);
				map.put("state",state );
				map.put("no",no);
				dao.order_basketUpdate(map);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return result;
	}
	
}
