package com.sist.dao;

import javax.annotation.Resource;

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
	
	// 장바구니 개별 삭제
	
	// 장바구니 비우기
	
	// 장바구니 금액 합계
	
	// 장바구니 상품 갯수
	
	// 장바구니 수정
	
	
}
