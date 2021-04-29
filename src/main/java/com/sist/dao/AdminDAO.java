package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.User_order_basketVO;

@Repository
public class AdminDAO extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public List<User_order_basketVO> basketList(Map map){
		return getSqlSession().selectList("userBasketList",map);
	}
	public int basketListTotalPage(){
		return getSqlSession().selectOne("userBasketTotalpage");
	}
	public void order_basketUpdate(Map map){
		getSqlSession().update("order_basketUpdate",map);
	}
}
