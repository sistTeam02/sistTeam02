package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;

@Repository
public class MypageDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public List<Chat_foodVO> mypageChatFoodListData(Map map){
		return getSqlSession().selectList("mypageChatFoodListData",map);
	}
	public int mypageChatFoodDataTotalPage(String id){
		return getSqlSession().selectOne("mypageChatFoodDataTotalPage",id);
	}
	public List<Chat_planVO> mypageChatPlanListData(Map map){
		return getSqlSession().selectList("mypageChatPlanListData",map);
	}
	public int mypageChatPlanDataTotalPage(String id){
		return getSqlSession().selectOne("mypageChatPlanDataTotalPage",id);
	}
	public MemberVO mypageUpdateAllData(String id){
		return getSqlSession().selectOne("mypageUpdateAllData",id);
	}
	public void mypageUpdate(MemberVO vo){
		 getSqlSession().update("mypageUpdate",vo);
	}
	//<select id="mypageFoodDayData" resultType="Chat_foodVO" parameterType="hashmap">
	public List<Chat_foodVO> mypageFoodDayData(Map map){
		return getSqlSession().selectList("mypageFoodDayData",map);
	}
	//<select id="mypagePlanDayData" resultType="Chat_planVO" parameterType="hashmap">
	public List<Chat_planVO> mypagePlanDayData(Map map){
		return getSqlSession().selectList("mypagePlanDayData",map);
	}
	//	<select id="chat_dbDay" resultType="String" parameterType="String">
	public List<String> chat_dbDay(String id){
		return getSqlSession().selectList("chat_dbDay",id);
	}
	//<select id="mypageGoodsJjimList" resultType="GoodsVO" parameterType="hashmap">
	public List<GoodsVO> mypageGoodsJjimList(Map map){
		return getSqlSession().selectList("mypageGoodsJjimList",map);
	}
	// <select id="mypageGoodsJjimCount" resultType="string" parameterType="int">
	public int mypageGoodsJjimCount(String id){
		return getSqlSession().selectOne("mypageGoodsJjimCount",id);
	}
}
