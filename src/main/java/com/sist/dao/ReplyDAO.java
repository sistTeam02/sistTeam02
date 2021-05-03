package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.vo.ReplyVO;

import java.util.*;

import javax.annotation.Resource;

@Repository
public class ReplyDAO extends SqlSessionDaoSupport{

	@Resource(name="ssf")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public List<ReplyVO> replyListData(int bno)
	{
		return getSqlSession().selectList("replyListData", bno);
	}
	//public
	

}
