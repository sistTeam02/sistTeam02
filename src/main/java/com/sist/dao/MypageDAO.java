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
	/*
	<select id="goodsJjimList" resultType="GoodsVO" parameterType="hashmap">
		SELECT gl.no,title,poster,price,id 
        FROM goods_jjim gj,goods_list gl
        WHERE gj.pno=gl.no
        AND pno=#{pno} 
        AND id =#{id};
	  	
  </select>
   <!-- 찜 수량 goodsJjimCount -->
  <select id="goodsJjimCount" resultType="string" parameterType="int">
		SELECT COUNT(*) FROM goods_jjim gj,goods_list gl
		WHERE gj.pno=gl.no
	    AND pno = #{pno}
	    AND id=#{id}
  </select>
	 */
	public List<GoodsVO> goodsJjimList(Map map){
		return getSqlSession().selectList("goodsJjimList",map);
	}
	public String goodsJjimCount(String id){
		return getSqlSession().selectOne("goodsJjimCount",id);
	}
}
