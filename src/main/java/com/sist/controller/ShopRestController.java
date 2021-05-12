package com.sist.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import com.sist.vo.*;
// VueJs로 값을 전송
@RestController
public class ShopRestController {

	@Autowired
	private GoodsDAO gDao;
	
	@GetMapping("shop/detail_json.do")
	public String shop_detail_json(int no){
		String json="";
//		no=1;
//		GoodsDetailVO gvo=gDao.goodsDetailData(no);
//		JSONArray arr=new JSONArray(); //[  디테일이라 리스트 없이 한번 해보겠습니다.  ]
//		JSONObject obj=new JSONObject(); //vo랑 같은 역할 {  }생성
//		obj.put("no", gvo.getNo());    //{no:값} 대입
//		obj.put("title", gvo.getTitle());//{no:값,tilte:값} 대입
//		json=obj.toJSONString();    //json으로 형변환
		try
		{
			// DAO에서 값을 읽어온다
			Map map=new HashMap();
			
			List<GoodsVO> glist=gDao.goodsListData(map);
			// [{},{},{}] => [] => List,  {} => VO
			JSONArray arr=new JSONArray();
			for(GoodsVO gvo:glist)
			{
				JSONObject obj=new JSONObject();
				obj.put("no", gvo.getNo());    //{no:값} 대입
				obj.put("title", gvo.getTitle());//{no:값,tilte:값} 대입
				obj.put("poster", gvo.getPoster());
				obj.put("price", gvo.getPrice());
				// 배열에 첨부
				arr.add(obj);
			}
			json=arr.toJSONString();    //json으로 형변환
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return json;
	}
	
	public interface Action {
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	}

	public class ActionForward {
		private boolean redirect;
		private String path;

		public boolean isRedirect() {
			return redirect;
		}

		public void setRedirect(boolean redirect) {
			this.redirect = redirect;
		}

		public String getPath() {
			return path;
		}

		public void setPath(String path) {
			this.path = path;
		}
	}

}


