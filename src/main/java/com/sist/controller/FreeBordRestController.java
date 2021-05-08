package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class FreeBordRestController {
	@Autowired
	private FreeBoardDAO fDao;
	@Autowired
	private ReplyDAO rDao;
	@Autowired
    private NoticeBoardDAO nDao;
	   
	   ////////////////////////  공지사항  ////////////////////////////////////
	   @RequestMapping(value="board/ndelete_ok.do")
	   public String board_ndelete_ok(int no,String pwd)
	   {
		   String msg="";
		   // 데이터베이스에 저장된 파일정보를 받는다 
	       NoticeBoardVO vo=nDao.noticeboardFileInfoData(no);
	       boolean bCheck=nDao.noticeboardDelete(no, pwd);
	       if(bCheck==true)
	       {
	    	   // 파일 지우기 => list.do이동
	    	   msg="<script>location.href=\"nlist.do\";</script>";
	    	   try
	    	   {
	    		   if(vo.getFilecount()!=0)// 파일이 있는 경우에만 삭제
	    		   {
	    			   StringTokenizer st=new StringTokenizer(vo.getFilename(),",");
	    			   while(st.hasMoreTokens())
	    			   {
	    				   File file=new File("c:\\spring-upload\\"+st.nextToken());
	    				   file.delete();
	    			   }
	    			   
	    		   }
	    	   }catch(Exception ex){}
	       }
	       else
	       {
	    	   // 스트립트 => 비밀번호가 틀립니다..
	    	   msg="<script>"
	    		  +"alert(\"비밀번호가 틀립니다!!\");"
	    		  +"history.back();"
	    		  +"</script>";
	       }
		   return msg;
	   }
	

}
