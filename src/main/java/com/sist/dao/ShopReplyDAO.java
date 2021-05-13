package com.sist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.ShopReplyVO;

@Repository
public class ShopReplyDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	// 리뷰 목록
	public List<ShopReplyVO> shopReplyListData(int pno) // 상품번호 별
	{
		return getSqlSession().selectList("shopReplyListData", pno);
	}
	// 리뷰 추가
	public void shopReplyInsert(ShopReplyVO svo) // shopVo
	{
		getSqlSession().insert("shopReplyInsert",svo);
		System.out.println("확인");
	}
	// 리뷰 수정
	public void shopReplyUpdate(ShopReplyVO svo)
	{
		getSqlSession().update("shopReplyUpdate",svo);
	}
	// 리뷰 삭제
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void shopReplyDelete(ShopReplyVO svo)
	{
	  	getSqlSession().delete("shopReplyDelete",svo);
	}
	
}
