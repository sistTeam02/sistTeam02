package com.sist.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.sist.vo.*;
@Repository
public class User_basketDAO extends SqlSessionDaoSupport{

	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	// 장바구니 목록
	public List<User_basketVO> basketListData(String id)
	{
		User_basketDAO uDao=new User_basketDAO();
		return getSqlSession().selectList("basketListData", id);
	}
	// 장바구니 추가
	public void basketInsert(User_basketVO vo)
	{
		getSqlSession().insert("basketInsert", vo);
	}
	// 장바구니 개별 삭제
	public void basketDelete(int no)
	{
		getSqlSession().delete("basketDelete", no);
	}
	// 장바구니 비우기
	public void basketDeleteAll(String id)
	{
		getSqlSession().delete("basketDeleteAll", id);
	}
	// 장바구니 수정
	public void basketModify(User_basketVO vo)
	{
		getSqlSession().update("basketModify", vo);
	}
	// 장바구니 금액 합계
	public int basketMoney(String id)
	{
		getSqlSession().selectOne("basketMoney", id);
		return getSqlSession().selectOne("basketMoney", id);
	}
	// 장바구니 상품 갯수
	public int basketCount(int no, String id)
	{
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("no", no);
		map.put("id", id);
		return getSqlSession().selectOne("basketCount", map);
	}
	// 장바구니 수량 변경
	public void basketUpdate(User_basketVO vo)
	{
		getSqlSession().update("basketUpdate", vo);
	}
	
}
