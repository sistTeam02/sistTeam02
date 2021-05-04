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
	@Autowired
	private ReplyDAO rDao;
	

}
