package com.sist.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.parser.Parser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sist.dao.Chat_foodDAO;
import com.sist.dao.Chat_planDAO;
import com.sist.dao.KcalDAO;
import com.sist.vo.Chat_foodVO;
import com.sist.vo.Chat_planVO;
import com.sist.vo.Chat_recipeVO;
import com.sist.vo.KcalVO;

@RestController
public class ChatRestController {
	@Autowired
	private Chat_planDAO pdao;
	@Autowired
	private Chat_foodDAO fdao;
	@PostMapping("chat/sport_plan.do")
	public String chat_sport_insert(String memo){
		String result="success!!";
		try{
			JSONParser jp=new JSONParser();
			JSONObject obj=(JSONObject)jp.parse(memo);
			System.out.println("id:"+obj.get("id"));
			System.out.println("date:"+obj.get("date"));
			System.out.println("time:"+obj.get("time"));
			System.out.println("sport:"+obj.get("sport"));
			Chat_planVO vo=new Chat_planVO();
			vo.setId((String) obj.get("id"));
			vo.setPlandate((String) obj.get("date"));
			vo.setTime((String) obj.get("time"));
			vo.setSport((String) obj.get("sport"));
			//pdao.chat_planInsertData(vo);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
	@PostMapping("chat/chat_total.do")
	public String chat_total_data(String date,String id){
		Chat_planVO vo=new Chat_planVO();
		Chat_foodVO fvo=new Chat_foodVO();
		vo.setId(id);
		vo.setPlandate(date);
		String json="";
		List<Chat_planVO> pList=pdao.chat_planData(vo);
		fvo.setFooddate(date);
		fvo.setId(id);
		List<Chat_foodVO> fList=fdao.chat_foodData(fvo);
		JSONArray arr=new JSONArray();
		for(Chat_planVO pvo:pList){
			JSONObject obj=new JSONObject();
			obj.put("plandate",pvo.getPlandate() );
			obj.put("time",pvo.getTime() );
			obj.put("sport",pvo.getSport() );
			arr.add(obj);
		}
		/*for(Chat_foodVO fovo:fList){ 사진 처리한후에 하자
			JSONObject obj=new JSONObject();
			obj.put("fooddate",fovo.getFooddate() );
			obj.put("whenfood",fovo.getWhenfood() );
			obj.put("foodname",fovo.getFoodname() );
			obj.put("foodkcal",fovo.getFoodkcal() );
			arr.add(obj);
		}*/
		json=arr.toJSONString();
		return json;
	}
	@PostMapping("chat/chat_dbday.do")
	public String chat_dbday(String id,String month){
		String dList="";
		List<String> list=pdao.chat_dbDay(id);
		for(int i=0; i<list.size(); i++){
			String db_day=list.get(i);
			int m=Integer.parseInt(month);
			int db_m=Integer.parseInt(db_day.substring(5,7));
			if(m==db_m){
				db_day=db_day.substring(db_day.lastIndexOf(".")+1,db_day.length());
				dList+=db_day+"^";
			}
		}
		dList=dList.substring(0,dList.length());
		
		return dList;
	}
	@PostMapping("chat/image_upload.do") /*긁어서 뭔소리인지모름*/
	public String chat_imageUpload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
       Iterator<String> itr =  multipartRequest.getFileNames();
       String filePath = "C:/upload"; //설정파일로 뺀다.
       while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
                  
           MultipartFile mpf = multipartRequest.getFile(itr.next());
    
           String originalFilename = mpf.getOriginalFilename(); //파일명 아이디or 날짜 추가해서 파일명 변경해야됨 ============================
    
           String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
    
           try {
               //파일 저장
               mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
               
               System.out.println("originalFilename => "+originalFilename);
               System.out.println("fileFullPath => "+fileFullPath);
    
           } catch (Exception e) {
               System.out.println("postTempFile_ERROR======>"+fileFullPath);
               e.printStackTrace();
           }                
      } 
       return "success";
	}
	@PostMapping("chat/chat_recipeList.do")
	public String chat_listdata(int page){
		String json="";
		try {

			int rowSize=9;
			int start=1+(page-1)*rowSize;
			int end=(page*rowSize);
			Map map=new HashMap();
			map.put("start", start);
			map.put("end", end);
			List<Chat_recipeVO> list=fdao.chat_recipeList(map);
			int totalpage=fdao.chat_recipeTotalPage();
			JSONArray arr=new JSONArray();
			for(Chat_recipeVO vo:list){
				JSONObject obj=new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("title", vo.getTitle());
				obj.put("poster", vo.getPoster());
				obj.put("page", page);
				obj.put("totalpage", totalpage);
				arr.add(obj);
				
			}
		json=arr.toJSONString();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return json;
	}
}
