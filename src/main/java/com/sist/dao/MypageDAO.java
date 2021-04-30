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
	
	/*
	 * <select id="mypage_chat_food" resultType="Chat_foodVO" parameterType="Chat_foodVO">
	 SELECT id,fooddate,whenfood,foodname,foodkcal,foodgram FROM chat_food
	 WHERE id=#{id}
	</select>
	 */
	public List<Chat_foodVO> mypage_chat_food(String id){
		return getSqlSession().selectList("mypage_chat_food",id);
	}
	
}
