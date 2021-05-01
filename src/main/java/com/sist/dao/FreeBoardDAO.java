package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.FreeBoardVO;

import java.util.*;
@Repository
public class FreeBoardDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	/*
	 *  <select id="freeboardListData" resultType="FreeBoardVO" parameterType="hashmap">
		 SELECT no,subject,name,regdate,hit,num
		 FROM (SELECT no,subject,name,regdate,hit,rownum as num 
		 FROM (SELECT /*+ INDEX_DESC(freeboard fb_no_pk) /no,subject,name,regdate,hit
		 FROM freeboard))
		 WHERE num BETWEEN #{start} AND #{end}
		</select>
		<select id="freeboardTotalPage" resultType="int">
		 SELECT CEIL(COUNT(*)/10.0) FROM freeboard
		</select>
	 */
	public List<FreeBoardVO> freeboardListData(Map map)
	{
		return getSqlSession().selectList("freeboardListData", map);
	}
	public int freeboardTotalPage()
	{
		return getSqlSession().selectOne("freeboardTotalPage");
	}
	// 글쓰기
	public void freeboardInsert(FreeBoardVO vo)
	{
		getSqlSession().insert("freeboardInsert", vo);
	}

}

























