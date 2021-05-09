package com.sist.controller;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.NoticeBoardDAO;
import com.sist.dao.ReplyDAO;
import com.sist.vo.FindVO;
import com.sist.vo.NoticeBoardVO;

@Controller
public class NoticeBoardController {
	   @Autowired
	   private NoticeBoardDAO nDao;
	   
	   
	   @GetMapping("board/nlist.do")
	   public String board_nlist(String page,Model model)
	   {
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=10;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   map.put("start", start);
		   map.put("end", end);
		   List<NoticeBoardVO> list=nDao.noticeboardListData(map);
		   int totalpage=nDao.noticeboardTotalPage();
		   
		   final int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   int allPage=totalpage;
		   if(endPage>allPage)
		   {
			   endPage=allPage;
		   }
		   
		   // JSP 전송 
		   model.addAttribute("list", list);
		   model.addAttribute("curpage", curpage);
		   model.addAttribute("allPage", allPage);
		   model.addAttribute("BLOCK", BLOCK);
		   model.addAttribute("startPage", startPage);
		   model.addAttribute("endPage", endPage);
		   model.addAttribute("main_jsp", "../board/nlist.jsp");
		   
		   return "main/main";
	   }
	   // 글쓰기
	   @GetMapping("board/ninsert.do")
	   public String board_ninsert(Model model)
	   {
		   model.addAttribute("main_jsp", "../board/ninsert.jsp");
		   return "main/main";
	   }
	   @PostMapping("board/ninsert_ok.do")
	   public String board_ninsert_ok(NoticeBoardVO vo)
	   {
		   try
		   {
		   List<MultipartFile> list=vo.getFiles();
		   if(list==null) // 업로드가 안된 상태
		   {
			   vo.setFilename("");
			   vo.setFilesize("");
			   vo.setFilecount(0);
		   }
		   else // 업로드가 된 상태 
		   {
			   String tempFile="";
			   String tempSize="";		   
			   for(MultipartFile mf:list)
			   {
				   try
				   {
					  String strFile=mf.getOriginalFilename(); 
					  File file=new File("c:\\spring-upload\\"+strFile);
					  mf.transferTo(file);// 서버에 업로드(서버 폴더에 파일 저장)
					  // 오라클에 파일명을 묶어서 저장  a.jpg,b.png,c.jpg
				      tempFile+=strFile+",";
				      tempSize+=file.length()+",";
				   }catch(Exception ex)
				   {
					   ex.printStackTrace();
				   }
				   
			   }
			   tempFile=tempFile.substring(0,tempFile.lastIndexOf(","));
			   tempSize=tempSize.substring(0,tempSize.lastIndexOf(","));
			   vo.setFilename(tempFile);
			   vo.setFilesize(tempSize);
			   vo.setFilecount(list.size());
		   }
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   //DAO연결 
		   nDao.noticeboardInsert(vo);
		   return "redirect:nlist.do";
	   }
	   @GetMapping("board/ndetail.do")
	   public String board_ndetail(int no,int page,Model model)
	   {
		   // 데이터 읽기 => DAO연결 
		   NoticeBoardVO vo=nDao.noticeboardDetailData(no);
		   List<String> fn=new ArrayList<String>();
		   List<String> fs=new ArrayList<String>();
		   String s1=vo.getFilename();
		   String s2=vo.getFilesize();
		  
		  if(vo.getFilecount()!=0)
		  {
			   StringTokenizer st=new StringTokenizer(s1,",");
			   while(st.hasMoreTokens())
			   {
				   fn.add(st.nextToken());
			   }
			   
			   st=new StringTokenizer(s2,",");
			   while(st.hasMoreTokens())
			   {
				   fs.add(st.nextToken());
			   }
			   model.addAttribute("fn", fn);
			   model.addAttribute("fs", fs);
		  }
		  
		   model.addAttribute("vo", vo);
		   model.addAttribute("page", page);
		   model.addAttribute("main_jsp", "../board/ndetail.jsp");
		   //model.addAttribute("rList", rList);
		   return "main/main";
	   }
	   @PostMapping("board/nfind.do")
	   public String board_nfind(String fs,String ss,Model model)
	   {
		   FindVO vo=new FindVO();
		   vo.setFs(fs);
		   vo.setSs(ss);
		   Map map=new HashMap();
		   map.put("fs",fs);
		   map.put("ss", ss);
		   map.put("fsArr", vo.getFsArr());
		   List<NoticeBoardVO> list=nDao.noticeboardFindData(map);
		   int count=nDao.noticeboardFindDataCount(map);
		   model.addAttribute("list", list);
		   model.addAttribute("count", count);
		   model.addAttribute("main_jsp", "../board/nfind.jsp");
		   return "main/main";
	   }
	   /*
	    *   사용자 
	    *    1)          2)                   3)
	    *   .do  ==> BoardController <==> BoardDAO <==> 오라클
	    *                | Model  4)
	    *              ViewResolver
	    *                | request 5)
	    *               JSP
	    */
	   // Error 405(get/post)
	   @GetMapping("board/nupdate.do")
	   public String board_nupdate(int no,int page,Model model)
	   {
		   // 결과값 
		   NoticeBoardVO vo=nDao.noticeboardUpdateData(no);
		   // 데이터연동 (DAO)
		   // 데이터를 JSP로 전송
		   model.addAttribute("vo", vo);
		   model.addAttribute("page", page);
		   model.addAttribute("main_jsp", "../board/nupdate.jsp");
		   return "main/main";
	   }
	   @PostMapping("board/nupdate_ok.do")
	   public String board_nupdate_ok(NoticeBoardVO vo,int page,Model model)
	   {
		   //데이터베이스 연동 
		   boolean bCheck=nDao.noticeboardUpdate(vo);
		   // update_ok.jsp => 결과값을 보내서 사용자가 볼 수 있게 만든다 
		   model.addAttribute("bCheck",bCheck);
		   model.addAttribute("no", vo.getNo());
		   model.addAttribute("page", page);
		   return "board/nupdate_ok";
	   }
	   
	   @GetMapping("board/ndelete.do")
	   public String board_ndelete(int no,int page,Model model)
	   {
		   model.addAttribute("no", no);
		   model.addAttribute("page", page);
		   return "board/ndelete";
	   }
	   
	   /*@PostMapping("board/ndelete_ok.do")
	   public String board_ndelete_ok(int no,int page,String pwd,Model model)
	   {
		   // 결과값 읽기 
		   System.out.println("pwd="+pwd+",no="+no);
		   boolean bCheck=nDao.noticeboardDelete(no, pwd);
		   System.out.println("bCheck="+bCheck);
		   // delete_ok.jsp로 결과값을 전송 => 사용자가 볼 수 있게 처리 
		   model.addAttribute("bCheck", bCheck);
		   model.addAttribute("page", page); // list.jsp => no(X) , page(O)
		   return "board/ndelete_ok";
	   }*/
	   // 다운로드 : void
	   @GetMapping("board/download.do")
	   public void board_download(String fn,HttpServletResponse response)
	   {
		   try
		   {
			   File file=new File("c:\\spring-upload\\"+fn);
			   // 파일 정보 얻기 
			   response.setHeader("Content-Disposition", "attachement;filename="
					       +URLEncoder.encode(fn, "UTF-8"));
			   response.setContentLength((int)file.length());
			   
			   BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
			   // 서버에서 파일을 읽어 온다
			   BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
			   // 다운로드하는 사람에게 파일을 보내준다 
			   byte[] buffer=new byte[1024];
			   int i=0;// 읽은 바이트 
			   while((i=bis.read(buffer, 0, 1024))!=-1) //-1 file end => EOF
			   {
				   // 다운로드하는 사람에게 보내라 
				   bos.write(buffer, 0, i);
			   }
			   bis.close();
			   bos.close();
		   }catch(Exception ex){}
	   }
	   
	   

}
