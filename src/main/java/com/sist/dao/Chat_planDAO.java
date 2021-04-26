package com.sist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.Chat_planVO;

@Repository
public class Chat_planDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public void chat_planInsertData(Chat_planVO vo){
		getSqlSession().insert("chat_planInsert",vo);
	}
	public List<Chat_planVO> chat_planData(Chat_planVO vo){
		return getSqlSession().selectList("chat_planData",vo);
	}
}
