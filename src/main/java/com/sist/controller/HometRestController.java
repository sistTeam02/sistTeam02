package com.sist.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.HometDAO;
import com.sist.vo.HometDetailFreeVO;

@RestController
public class HometRestController {
	@Autowired
	private HometDAO dao;
	@PostMapping("home_training/ht_test.do")
	public String test_ht_test(int no){
		String json="";
		try {
			HometDetailFreeVO vo=dao.hometDetailFree(no);
			JSONObject obj=new JSONObject();
			/*title1, title2, UPLOADDAY, hit, comment_hit, video, video_time,*/
			obj.put("title1",vo.getTitle1());
			obj.put("hit",vo.getHit());
			json=obj.toJSONString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		/*3*/
		return json;
	}
	
}
