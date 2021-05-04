package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.DietFoodVO;
import com.sist.vo.QnABoardVO;
import com.sist.vo.QnABoard_ReplyVO;
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
	/*qna리스트*/
	public List<QnABoardVO> userQnAListData(Map map){
		return getSqlSession().selectList("userQnAListData",map);
	}
	public int userQnATotalpage(){
		return getSqlSession().selectOne("userQnATotalpage");
		
	}
	/*qna수정리스트*/
	public List<QnABoardVO> userQnAUpdateListData(Map map){
		return getSqlSession().selectList("adminQnAUpdateListData",map);
	}
	public int QnAUpdateTotalpage(){
		return getSqlSession().selectOne("QnAUpdateTotalpage");		
	}
	/*QnA답변 인서트+update*/
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void adminQnaInsertUpdate(QnABoard_ReplyVO vo){
		getSqlSession().insert("adminQnaInsert",vo);
		getSqlSession().update("QnAboard_stateUpdate",vo.getMno());
	}
	public void adminQnaUpdate(QnABoard_ReplyVO vo){
		getSqlSession().update("QnAboard_reply_update", vo);
	}
	public List<QnABoardVO> qnaSearchData(Map map){
		return getSqlSession().selectList("QnASearchData",map);		
	}
	/*품절관리*/
	public List<DietFoodVO> manageShopList(Map map){
		return getSqlSession().selectList("manageShopList",map);
	}
	/*품절상태가져오기*/
	public void stockchange(Map map){
		String stockState=getSqlSession().selectOne("IsShopStock",map);
		if(stockState.equals("Y")){
			getSqlSession().update("updateStockN",map);
		}else{
			getSqlSession().update("updateStockY",map);
		}
	}
	/*상품검색*/
	public List<DietFoodVO> findShopStock(Map map){
		return getSqlSession().selectList("findShopStock",map);
	}
	/*상품토탈페이지*/
	public int manageShopTotalpage(){
		return getSqlSession().selectOne("manageShopTotalpage");
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void insertShopList_detail(Map map){
		getSqlSession().insert("insertShopData",map);
		getSqlSession().insert("insertShopListData",map);
	}
	public DietFoodVO shop_updateBeforeData(Map map){
		return getSqlSession().selectOne("shop_updateBeforeData", map);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void updateShopList_detail(Map map){
		getSqlSession().insert("shop_updateListData",map);
		getSqlSession().insert("shop_updateDetailData",map);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void deleteShopList_detail(Map map){
		getSqlSession().insert("shop_deleteListData",map);
		getSqlSession().insert("shop_deleteDetailData",map);
	}
}
