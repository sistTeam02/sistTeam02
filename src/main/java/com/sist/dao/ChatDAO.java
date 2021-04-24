package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.*;
import com.sist.vo.ChatVO;
import com.sist.vo.KcalVO;

import java.util.*;
@Repository
public class ChatDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public void insertFoodData(ChatVO vo){
		getSqlSession().insert("chatInsertData",vo);
	}
	
	
}
