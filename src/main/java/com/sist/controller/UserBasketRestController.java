package com.sist.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.User_basketDAO;
import com.sist.vo.User_basketVO;
import com.sist.vo.User_order_basketVO;

@RestController
public class UserBasketRestController {
	
	@Autowired
	private User_basketDAO dao;
	
	@PostMapping("basket/userBasketList.do")
	public String basket_userBasketList(HttpSession session,int no){
		String json="";
		String id=(String)session.getAttribute("id");
		List<User_basketVO> list=new ArrayList<User_basketVO>();
		if(no==1){
			list=dao.basketListData(id);
		}else if(no==2){
			list=dao.basketHTListData(id);
		}
		JSONArray arr=new JSONArray();
		for(User_basketVO vo:list){
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("id", vo.getId());
			obj.put("pno", vo.getPno());
			obj.put("title", vo.getTitle());
			obj.put("poster", vo.getPoster());
			obj.put("price", vo.getPrice());
			obj.put("ordercount", vo.getOrdercount());
			obj.put("cno", vo.getCno());
			if(no==2)
				obj.put("trainer", vo.getTrainer());
			String orderDate=new SimpleDateFormat("yyyy.MM.dd").format(vo.getOrddate());
			obj.put("orddate", orderDate);
			arr.add(obj);
		}
		json=arr.toJSONString();		
		return json;
	}
	@PostMapping("basket/delete_userBasket.do")
	public void basket_delete_userBasket(int no){
		dao.basketDelete(no);
	}
	@PostMapping("basket/userBasketInsert.do")
	public String basket_userBasketInsert(String box,HttpSession session){
		String json="";
		try{
		  JSONParser jp=new JSONParser();
		  JSONArray arr=(JSONArray)jp.parse(box);
		  for(int i=0; i<arr.size(); i++){			  
		    JSONObject obj=(JSONObject) arr.get(i);	   
		    User_order_basketVO vo=new User_order_basketVO();
		    vo.setId((String)session.getAttribute("id"));
		    vo.setTitle((String)obj.get("title"));
		    String strPrice=(String)obj.get("price");
		    String strPno=(String)obj.get("pno");
		    String strcno=(String)obj.get("cno");
		    String strOrdercount=(String)obj.get("ordercount");
		    int price=Integer.parseInt(strPrice);
		    int pno=Integer.parseInt(strPno);
		    int cno=Integer.parseInt(strcno);
		    int ordercount=Integer.parseInt(strOrdercount);
		    vo.setPrice(price);
		    vo.setPno(pno);
		    vo.setCno(cno);
		    vo.setOrdercount(ordercount);
		    dao.orderbasketInsert(vo);
		  }
		  
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return json;//만약 체크박스 클릭만 결제 추가시 결제한 no만 보내서 삭제필요
	}
	
}
