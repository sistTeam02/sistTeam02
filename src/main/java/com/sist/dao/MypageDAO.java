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
	
	/*	채팅 음식 데이터 출력
	 * <select id="mypage_chat_food" resultType="Chat_foodVO" parameterType="Chat_foodVO">
	 SELECT id,fooddate,whenfood,foodname,foodkcal,foodgram FROM chat_food
	 WHERE id=#{id}
	</select>
	 */
	/*public List<Chat_foodVO> mypage_chat_food(String id){
		return getSqlSession().selectList("mypage_chat_food",id);
	}*/
	
	/*	채팅 운동 데이터 출력
	 * <select id="mypage_chat_plan" resultType="Chat_PlanVO" parameterType="Chat_PlanVO">
		SELECT plandate,time,sport FROM chat_plan
	</select>
	 */
	/*public List<Chat_planVO> mypage_chat_plan(String id){
		return getSqlSession().selectList("mypage_chat_plan",id);
	}*/
	public List<Chat_foodVO> mypageChatFoodListData(Map map){
		return getSqlSession().selectList("mypageChatFoodListData",map);
	}
	public int mypageChatFoodDataTotalPage(){
		return getSqlSession().selectOne("mypageChatFoodDataTotalPage");
	}
}
