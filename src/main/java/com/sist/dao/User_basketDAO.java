package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.sist.vo.*;
@Repository
public class User_basketDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	// 장바구니 추가
	public void basketInsert(User_basketVO vo)
	{
		getSqlSession().insert("basketInsert", vo);
	}
	// 장바구니 목록
	public List<User_basketVO> basketListData(String id)
	{
		return getSqlSession().selectList("basketListData", id);
	}
	public List<User_basketVO> basketHTListData(String id)
	{
		return getSqlSession().selectList("basketHTListData", id);
	}
	// 장바구니 개별 삭제
	public void basketDelete(int no)
	{
		getSqlSession().delete("basketDelete", no);
	}
	/*장바구니 결제테이블 삽입*/
	public void orderbasketInsert(User_order_basketVO vo){
		getSqlSession().insert("orderbasketInsert",vo);
	}
	/*결제상태 확인*/
	public List<User_order_basketVO> userPurchaseData(Map map){
		return getSqlSession().selectList("userPurchaseData",map);
	}
}
