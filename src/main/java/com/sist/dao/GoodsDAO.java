package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import com.sist.vo.*;
import com.sist.controller.*;
@Repository
public class GoodsDAO extends SqlSessionDaoSupport {

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	// 상품 리스트
	public List<GoodsVO> goodsListData(Map map)
	{
		return getSqlSession().selectList("goodsListData", map);
	}
	// 상품 총페이지
	public int goodsTotalPage()
	{
		return getSqlSession().selectOne("goodsTotalPage");
	}
	// 상품 수량
	public int goodsCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("goodsCount");
	}
	// 상품 상세페이지
	public GoodsDetailVO goodsDetailData(int no)
	{
		return getSqlSession().selectOne("goodsDetailData", no);
	}
	
	private static GoodsDAO instance = new GoodsDAO();

	public static GoodsDAO getInstance() {
		return instance;
	}
	// 상품 찜 확인
	public int goodsJjimCheck(Map<String, Object> map)
	{
		int result=0;
		try 
		{
			result=(Integer) getSqlSession().selectOne("goodsJjimCheck", map);
		}catch (Exception ex) {
			System.out.println("goodsJjimCheck:"+ex);
			ex.printStackTrace();
		}
		return result;
	}
		
	// 상품 찜 추가
	public void goodsJjimUpdate(Map<String, Object> map)
	{
		try 
		{
			getSqlSession().insert("goodsJjimUpdate", map);
		} catch (Exception ex) {
			System.out.println("goodsJjimUpdate:"+ex);
			ex.printStackTrace();
		}
	}
	
	// 상품 찜 삭제
	public void goodsJjimDelete(Map<String, Object> map)
	{
		try 
		{
			getSqlSession().insert("goodsJjimDelete", map);
		} catch (Exception ex) {
			System.out.println("goodsJjimDelete:"+ex);
			ex.printStackTrace();
		}
	}
	// 찜 수
	public int goodsJjimCount(int no)
	{
		int count = 0;
		try {
			count = (Integer) getSqlSession().selectOne("goodsJjimCount", no);
		} catch (Exception ex) {
			System.out.println("goodsJjimCount:" + ex);
			ex.printStackTrace();
		}
		return count;
	}
	
	// 리뷰 목록
	public List<ShopReplyVO> shopReplyListData(int pno)  // 상품번호 별
	{
		return getSqlSession().selectList("shopReplyListData", pno);
	}
	// 리뷰 추가
	public void shopReplyInsert(ShopReplyVO svo)  // shopVo
	{
		getSqlSession().insert("shopReplyInsert",svo);
	}
	// 리뷰 수정
	public void shopReplyUpdate(ShopReplyVO svo)
	{
		getSqlSession().update("shopReplyUpdate",svo);
	}
	/*// 대댓글
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void shopReplyToReplyInsert(int root, ShopReplyVO svo)
	{	
		 // 상위 정보
	   	 ShopReplyVO pvo=getSqlSession().selectOne("shopReplyParentInfoData",root);
		 // parent
	   	 getSqlSession().update("shopReplyGroupStepIncrement",pvo);
		 // 실제 추가
	   	 svo.setGroup_id(pvo.getGroup_id());
	   	 svo.setGroup_step(pvo.getGroup_step()+1);
	   	 svo.setGroup_tab(pvo.getGroup_tab()+1);
	   	 svo.setRoot(root);
	   	 getSqlSession().insert("shopReplyToReplyInsert",svo);
	   	 // depth 증가
	   	 getSqlSession().update("shopReplyDepthIncrement",root);
	}*/
	// 리뷰 삭제
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void shopReplyDelete(int no)
	{
	 	ShopReplyVO svo=getSqlSession().selectOne("shopReplyInfoData", no);
	 	// 댓글 없음
	 	if(svo.getDepth()==0) 
	  	{
	  		getSqlSession().delete("shopReplyDelete",no);
	  	}
	 	// 댓글 존재
	  	/*else 
	   	{
	   		getSqlSession().update("shopReplyMsgUpdate",no);
	   	}
	   	getSqlSession().update("shopDepthDecrement",svo.getRoot());*/
	}
	
}
