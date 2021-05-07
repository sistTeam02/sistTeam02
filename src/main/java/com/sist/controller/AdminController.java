package com.sist.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Connection.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sist.dao.AdminDAO;
import com.sist.vo.GoodsDetailVO;

@Controller
public class AdminController {
	@Autowired
	private AdminDAO dao;
	@GetMapping("main/admin_main.do")
	public String main_qna(Model model, String no){
		
		if(no==null)
			no="0";
		int page=Integer.parseInt(no);
		String[] arr={
				"../admin/qna.jsp",
				"../admin/shop_manage.jsp"
		};
		
		model.addAttribute("admin_jsp", arr[page]);
		model.addAttribute("main_jsp", "../admin/admin_main.jsp");
		return "main/main";
	}
	@PostMapping("admin/insert_product.do")
	public String admin_insert_product(MultipartHttpServletRequest request,Model model,GoodsDetailVO vo){
		String list_filename="";
		String detail_filename="";
		Iterator<String> itr=request.getFileNames();
		Map map=new HashMap();
		int i=0;
		while(itr.hasNext()){
			MultipartFile mpf=request.getFile(itr.next());//파일명 입력
			 String filename=mpf.getOriginalFilename();
			 String filepath="C:/upload/"+filename;
			 if(i==0){
				 list_filename=filename;
			 }else{
				 detail_filename+=filename+"^";
			 }
			 i++;
			 try {
				mpf.transferTo(new File(filepath));
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
			if(vo.getCno()==1){//식품
				map.put("table", "dietfood_detail");
				map.put("list_table", "dietfood_list");
				DecimalFormat df=new DecimalFormat("###,###");
				map.put("price", df.format(vo.getPrice()));
			}else{
				map.put("table", "goods_detail");
				map.put("list_table", "goods_list");
				map.put("price", vo.getPrice());
			} 
			map.put("title", vo.getTitle());
			map.put("poster", list_filename);
			map.put("detail_poster", detail_filename);
			dao.insertShopList_detail(map);
			 
		
		
		return "redirect: ../main/admin_main.do?no=1";
	}
	@PostMapping("admin/update_product.do")
	public String admin_update_product(MultipartHttpServletRequest request,Model model,GoodsDetailVO vo){
		String list_filename="";
		String detail_filename="";
		Iterator<String> itr=request.getFileNames();
		Map map=new HashMap();
		int i=0;
		
		while(itr.hasNext()){
			MultipartFile mpf=request.getFile(itr.next());//파일명 입력
			 String filename=mpf.getOriginalFilename();
			 String filepath="C:/upload/"+filename;
			 if(filename=="")break;//파일없으면 탈출
			 if(i==0){
				 list_filename=filename;
			 }else{
				 detail_filename+=filename+"^";
			 }
			 i++;
			 try {
				mpf.transferTo(new File(filepath));
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
			if(vo.getCno()==1){//식품
				map.put("table", "dietfood_detail");
				map.put("list_table", "dietfood_list");
				DecimalFormat df=new DecimalFormat("###,###");
				map.put("price", df.format(vo.getPrice()));
			}else{
				map.put("table", "goods_detail");
				map.put("list_table", "goods_list");
				map.put("price", vo.getPrice());
			}
			map.put("no", vo.getNo());
			map.put("title", vo.getTitle());
			map.put("poster", list_filename);
			map.put("detail_poster", detail_filename);
			dao.updateShopList_detail(map);
		
		return "redirect: ../main/admin_main.do?no=1";
	}
	
}
