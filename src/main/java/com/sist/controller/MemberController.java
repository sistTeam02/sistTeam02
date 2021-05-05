package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO mDao;
	//로그인페이지 이동
	@GetMapping("member/login.do")
	public String login_page(Model model)
	{
		model.addAttribute("main_jsp","../member/login.jsp");
		return "main/main";
	}
	//로그인 동작
	@PostMapping("member/login_ok.do")
	public String member_login_ok(String id,String pwd,Model model,HttpSession session)
	{	
		String result=mDao.isLogin(id, pwd);
	
		if(!(result.equals("NOID")||result.equals("NOPWD")))
		{
			StringTokenizer st =new StringTokenizer(result,"|");
			String name=st.nextToken();
			String admin=st.nextToken();
			result = "OK";
			
			//로그인된 상태
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("admin", admin);
		
		}
		model.addAttribute("result",result);
		
		return "member/login_ok";
	}
	
	//회원가입 페이지
	@GetMapping("member/register.do")
	public String register_page(Model model)
	{
		model.addAttribute("main_jsp","../member/register.jsp");
		return "main/main";
	}
	//회원 중복 체크
	@RequestMapping("member/idCheck_result.do")
	public String registerIdCheck(String id,Model model)
	{
		int count = mDao.memberIdCount(id);
		model.addAttribute("count",count);
		return "member/idCheck_result";
	}
	
	//회원가입 완료
	@PostMapping("member/register_ok.do")
	public String registerDo(MemberVO vo)
	{
	
		//DAO연결
		mDao.registerMember(vo);
		
		return "redirect: ../member/login.do";
	}
	
	//로그아웃
	@GetMapping("member/logout.do")
	public String logout_ok(Model model,HttpSession session)
	{
		session.invalidate();
		return "redirect: ../main/main.do";
		
	}
	/*
	 * @RequestMapping("member/post_result.do")//주소 출력
	public String zipcodePrint(HttpServletRequest request,HttpServletResponse response) {
		String dong=request.getParameter("dong");
		MemberDAO dao=MemberDAO.newInstance();
		List<ZipcodeVO> list=dao.joinAddress(dong);
		
		request.setAttribute("list", list);
		return "../member/fost_find.jsp";
	}
	 */

	
}
