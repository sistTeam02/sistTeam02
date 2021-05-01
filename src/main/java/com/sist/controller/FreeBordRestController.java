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
	@PostMapping("board/freeboard_find.do")
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
	 @PostMapping("board/freeabord_update_ok.do")
	   public String board_update_ok(FreeBoardVO vo,int page)
	   {
		   String result="";
		   // 비밀번호가 O(상세보기 이동) , X(자바스크립트 history.back())
		   boolean bCheck=fDao.freeboardUpdate(vo);
		   // 결과값을 가지고 올때 DAO를 연결 
		   if(bCheck==true)
		   {
			   result="<script>location.href=\"../board/detail.do?no="+vo.getNo()+"&page="+page+"\";</script>";
		   }
		   else
		   {
			   result="<script>alert(\"비밀번호가 틀립니다!!\");history.back();</script>";
		   }
		   return result;
	   }
	 /*
	  * <c:choose>
 <c:when test="${bCheck==true }">
  <c:redirect url="list.do?page=${page }"/>
 </c:when>
 <c:otherwise>
 <script>
  alert("비밀번호가 틀립니다!!");
  history.back();
 </script>
 </c:otherwise>
</c:choose>
	  */
	 /*@PostMapping("board/freeboard_delete_ok.do")
	 public String freeboard_delete(int no, int page, String pwd)
	 {
		 
	 }*/
	
	

}
