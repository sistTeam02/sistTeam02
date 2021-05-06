package com.sist.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsDetailVO;

@RestController
public class ShopRestController {

	@Autowired
	private GoodsDAO gDao;
	@GetMapping("shop/detail_json.do")
	public String shop_detail_json(){
		String json="";
		int no=1;
		GoodsDetailVO gvo=gDao.goodsDetailData(no);
		JSONArray arr=new JSONArray(); //[  디테일이라 리스트 없이 한번 해보겠습니다.  ]
		JSONObject obj=new JSONObject(); //vo랑 같은 역할 {  }생성
		obj.put("no", gvo.getNo());    //{no:값} 대입
		obj.put("title", gvo.getTitle());//{no:값,tilte:값} 대입
		json=obj.toJSONString();    //json으로 형변환
		return json;
	}
}
