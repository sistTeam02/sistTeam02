package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class FreeBordRestController {
	@Autowired
	private FreeBoardDAO fDao;
	
	// 찾기
	@PostMapping("freeboard_find.do")
	public String freeboard_find(String fs,String ss, Model model)
	{
		FindVO vo=new FindVO();
		vo.setFs(fs);
		vo.setSs(ss);
		Map map=new HashMap();
		map.put("fs", fs);
		map.put("ss", ss);
		map.put("fsArr", vo.getFsArr());
		List<FreeBoardVO> list=fDao.freeboardFindData(map);
		int count=fDao.freeboardFindDataCount(map);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		return "board/freeboard_find";
	}
	
	
	

}
