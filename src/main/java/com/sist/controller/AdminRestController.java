package com.sist.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.synth.SynthScrollBarUI;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.AdminDAO;
import com.sist.vo.DietFoodVO;
import com.sist.vo.GoodsDetailVO;
import com.sist.vo.QnABoardVO;
import com.sist.vo.QnABoard_ReplyVO;
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
	@PostMapping("admin/userQnAList.do")
	public String userQnAList(int page){
		String json="";
		try {
			int rowSize=10;
			int start=1+(page-1)*rowSize;
			int end=rowSize*page;
			Map map=new HashMap();
			map.put("start", start);
			map.put("end", end);
			List<QnABoardVO> list=dao.userQnAListData(map);
			JSONArray arr=new JSONArray();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			for(QnABoardVO vo:list){
				JSONObject obj=new JSONObject();
				obj.put("id",vo.getId());
				obj.put("no",vo.getNo());
				obj.put("subject",vo.getSubject());
				String regdate=sdf.format(vo.getRegdate());
				obj.put("regdate",regdate);
				obj.put("content",vo.getContent());
				obj.put("answer",vo.getAnswer());
				arr.add(obj);
			}
			json=arr.toJSONString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return json;
	}
	@GetMapping("admin/user_qna_totalpage.do")
	public String qnatotalpage(){
		String totalpage="";
		int total=dao.basketListTotalPage();
		totalpage=total+"";
		return totalpage;
	}
	/*답변 인서트*/
	@PostMapping("admin/qna_answerInsert.do")
	public String qna_answerInsert(String box){
		String result="성공";
		try {
			JSONParser jp=new JSONParser();
			JSONObject obj=(JSONObject)jp.parse(box);
			QnABoard_ReplyVO vo=new QnABoard_ReplyVO();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String regdate=sdf.format(new Date());
			String msg=(String)obj.get("msg");
			String strmno=(String)obj.get("mno");
			int mno=Integer.parseInt(strmno);
			vo.setMno(mno);
			vo.setMsg(msg);
			vo.setRegdate(regdate);
			dao.adminQnaInsertUpdate(vo);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			result="오류";
		}
		return result;
	}
	@PostMapping("admin/userQnAUpdata.do")
	public String adminQnAUpdateList(int page){
		String json="";
		try {
			int rowSize=10;
			int start=1+(page-1)*rowSize;
			int end=rowSize*page;
			Map map=new HashMap();
			map.put("start", start);
			map.put("end", end);
			List<QnABoardVO> list=dao.userQnAUpdateListData(map);
			JSONArray arr=new JSONArray();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			for(QnABoardVO vo:list){
				JSONObject obj=new JSONObject();
				obj.put("id",vo.getId());
				obj.put("no",vo.getNo());
				obj.put("subject",vo.getSubject());
				String regdate=sdf.format(vo.getRegdate());
				obj.put("regdate",regdate);
				obj.put("content",vo.getContent());
				obj.put("answer",vo.getAnswer());
				obj.put("msg",vo.getQnABoard_ReplyVO().getMsg());
				arr.add(obj);
			}
			json=arr.toJSONString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return json;
	}
	@GetMapping("admin/user_qna_update_totalpage.do")
	public String qnaUpdatetotalpage(){
		String totalpage="";
		int total=dao.QnAUpdateTotalpage();
		totalpage=total+"";
		return totalpage;
	}
	@PostMapping("admin/qna_answerUpdate.do")
	public String qna_answerUpdate(String box){
		String result="성공";
		try {
			JSONParser jp=new JSONParser();
			JSONObject obj=(JSONObject)jp.parse(box);
			QnABoard_ReplyVO vo=new QnABoard_ReplyVO();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String regdate=sdf.format(new Date());
			String msg=(String)obj.get("msg");
			String strmno=(String)obj.get("mno");
			int mno=Integer.parseInt(strmno);
			System.out.println(mno+"."+msg+"."+regdate);
			vo.setMno(mno);
			vo.setMsg(msg);
			vo.setRegdate(regdate);
			dao.adminQnaUpdate(vo);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			result="오류";
		}
		return result;
	}
	@PostMapping("admin/search_qnaData.do")
	public String admin_search_qnaData(int page,String keyword,String sbutton){
		String json="";
		String sc="";
		try {
			switch (sbutton) {
			case "ID":sc="id";
				break;
			case "제목":sc="subject";
				break;
			case "내용":sc="content";
				break;

			}
			Map map=new HashMap();
			map.put("keyword", keyword);
			map.put("sc", sc);
			List<QnABoardVO> list=dao.qnaSearchData(map);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			JSONArray arr=new JSONArray();
			for(QnABoardVO vo:list){
				JSONObject obj=new JSONObject();
				obj.put("id",vo.getId());
				obj.put("no",vo.getNo());
				obj.put("subject",vo.getSubject());
				String regdate=sdf.format(vo.getRegdate());
				obj.put("regdate",regdate);
				obj.put("content",vo.getContent());
				obj.put("answer",vo.getAnswer());
				arr.add(obj);
			}
			json=arr.toJSONString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return json;
	}
	/*품절관리 리스트*/
	@PostMapping("admin/manage_stockList.do")
	public String manageShopList(int page){
		String json="";
		try {
			int rowSize=20;
			int start=1+(page-1)*rowSize;
			int end=rowSize*page;
			Map map=new HashMap();
			map.put("start", start);
			map.put("end", end);
			List<DietFoodVO> list=dao.manageShopList(map);
			JSONArray arr=new JSONArray();
			for(DietFoodVO vo:list){
				JSONObject obj=new JSONObject();
				obj.put("stockNo", vo.getStockNo());
				obj.put("title", vo.getTitle());
				if(vo.getStock().equals("Y")){
					obj.put("stock", "판매중");
				}else{
					obj.put("stock", "품절");
				}
				
				arr.add(obj);
			}
			json=arr.toJSONString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return json;
	}
	@PostMapping("admin/updateShopStock.do")
	public String updateShopStock(int no,int cno){
		String result="";
		Map map=new HashMap();
		if(cno==2){
			map.put("table", "goods_list");
		}else if(cno==1){
			map.put("table", "dietfood_list");
		}
		map.put("no", no);
		dao.stockchange(map);
		return result;
	}
	@GetMapping("admin/manageShopTotalpage.do")
	public String manageShopTotalpage(){
		String totalpage="";
		int total=dao.manageShopTotalpage();
		totalpage=total+"";
		return totalpage;
	}
	@PostMapping("admin/findShopStock.do")
	public String findShopStock(String table,String keyword){
		String json="";
		JSONArray arr=new JSONArray();
		try {
			Map map=new HashMap();
			if(table.equals("식품")){
				map.put("table", "dietfood_list");
				map.put("keyword", keyword);
				List<DietFoodVO> list=dao.findShopStock(map);
				for(DietFoodVO vo:list){
					JSONObject obj=new JSONObject();
					obj.put("stockNo", "d"+vo.getNo());
					obj.put("title", vo.getTitle());
					if(vo.getStock().equals("Y")){
						obj.put("stock", "판매중");
					}else{
						obj.put("stock", "품절");
					}
					
					arr.add(obj);
				}
			}else{
				map.put("table", "goods_list");
				map.put("keyword", keyword);
				List<DietFoodVO> list=dao.findShopStock(map);
				for(DietFoodVO vo:list){
					JSONObject obj=new JSONObject();
					obj.put("stockNo", vo.getNo());
					obj.put("title", vo.getTitle());
					if(vo.getStock().equals("Y")){
						obj.put("stock", "판매중");
					}else{
						obj.put("stock", "품절");
					}
					
					arr.add(obj);
				}
			}
			
			json=arr.toJSONString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return json;
	}
	@PostMapping("admin/shop_updateData.do")
	public String admin_shop_updateData(GoodsDetailVO vo){
		String json="";
		Map map=new HashMap();
		if(vo.getCno()==1){//식품
			map.put("table", "dietfood_list");
		}else{//운동용품
			map.put("table", "goods_list");
		}
		 map.put("no", vo.getNo());
		 DietFoodVO fvo=dao.shop_updateBeforeData(map);
		 JSONObject obj=new JSONObject();
		 try {
			obj.put("no", fvo.getNo());
			obj.put("title", fvo.getTitle());
			obj.put("price", fvo.getPrice());
			json=obj.toJSONString();
		} catch (Exception ex) {
			obj.put("no", "");
			obj.put("title", "");
			obj.put("price", "");
			json=obj.toJSONString();
		}
		 
		return json;
	}
	@PostMapping("admin/shop_deleteData.do")
	public String admin_shop_deleteData(int no,int cno){
		String result="";
		Map map=new HashMap();
		if(cno==1){//식품
			map.put("table", "dietfood_detail");
			map.put("list_table", "dietfood_list");
		}else{//운동용품
			map.put("table", "goods_detail");
			map.put("list_table", "goods_list");
		}
		map.put("no", no);
		dao.deleteShopList_detail(map);
		return result;
	}
}
