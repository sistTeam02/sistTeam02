package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.*;
import com.sist.vo.Chat_foodVO;
import com.sist.vo.Chat_planVO;
import com.sist.vo.Chat_recipeVO;
import com.sist.vo.KcalVO;

import java.util.*;
@Repository
public class Chat_foodDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public List<Chat_foodVO> chat_foodData(Chat_foodVO vo){
		
		return getSqlSession().selectList("chat_foodData",vo);
	}
	public List<Chat_recipeVO> chat_recipeList(Map map){
		return getSqlSession().selectList("chat_recipeList",map);
	}
	public int chat_recipeTotalPage(){
		return getSqlSession().selectOne("chat_recipeTotalPage");
	}
	public List<KcalVO> chat_kcalData(String keyword){
		return getSqlSession().selectList("chat_kcalData", keyword);
	}
	public void chat_foodInsertData(Chat_foodVO vo){
		getSqlSession().insert("chat_foodInsert", vo);
	}
}
