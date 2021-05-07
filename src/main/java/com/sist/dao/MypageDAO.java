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
	public int mypageChatFoodDataTotalPage(){
		return getSqlSession().selectOne("mypageChatFoodDataTotalPage");
	}
	public List<Chat_planVO> mypageChatPlanListData(Map map){
		return getSqlSession().selectList("mypageChatPlanListData",map);
	}
	public int mypageChatPlanDataTotalPage(){
		return getSqlSession().selectOne("mypageChatPlanDataTotalPage");
	}
	/*
	 * <!-- 마이페이지 전체 데이터 불러오기 -->
	<select id="mypageUpdateAllData" resultType="MemberVO" parameterType="int">
	 SELECT id,pwd,name,birth,tel,phone,email,post,nickname,add1,add2
	 FROM member WHERE id=#{id}
	</select>
	<!-- 마이페이지 수정 -->
	<update id="mypageUpdate" parameterType="MemberVO">
		UPDATE member SET pwd=#{pwd},name=#{name},tel=#{tel},phone=#{phone},email=#{email},post=#{post},
							nickname=#{nickname},add1=#{addr1},addr2=#{addr2}
		WHERE id=#{id}
	</update>
	 */
	public MemberVO mypageUpdateAllData(int id){
		return getSqlSession().selectOne("mypageUpdateAllData",id);
	}
	public void mypageUpdate(MemberVO vo){
		 getSqlSession().update("mypageUpdate",vo);
	}
	
	
}
