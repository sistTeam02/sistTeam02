package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.*;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.*;
import com.sist.vo.*;
@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO mDao;
	
	@GetMapping("member/login.do")
	public String login_page(Model model)
	{
		model.addAttribute("main_jsp","../member/login.jsp");
		return "main/main";
	}
	@GetMapping("member/register.do")
	public String register_page(Model model)
	{
		model.addAttribute("main_jsp","../member/register.jsp");
		return "main/main";
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
