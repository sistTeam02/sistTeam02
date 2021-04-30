package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	// 상세보기
	public FreeBoardVO freeboardDetailData(int no)
	{
		getSqlSession().update("freeboardHitIncrement", no);
		return getSqlSession().selectOne("freeboardDetailData", no);
	}
	public FreeBoardVO freeboardUpdateData(int no)
	{
		return getSqlSession().selectOne("freeboardUpdateData", no);
	}
	//찾기
	public List<FreeBoardVO> freeboardFindData(Map map)
	{
		List<FreeBoardVO> list=null;
		try
		{
			list=getSqlSession().selectList("freeboardFindData", map);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return list;
	}
	public int freeboardFindDataCount(Map map)
	{
		return getSqlSession().selectOne("freeboardFindDataCount", map);
	}
	// 수정
	public boolean freeboardUpdate(FreeBoardVO vo)
	{
		boolean bCheck=false;
		// 비밀번호를 가지고 온다
		String db_pwd=getSqlSession().selectOne("freeboardGetPassword", vo.getNo());
		if(db_pwd.equals(vo.getPwd()))
		{
			bCheck=true;
			getSqlSession().update("freeboardUpdate", vo);
		}
		else
		{
			bCheck=false;
		}
		return bCheck;
	}
	
	// 삭제
	public boolean freeboardDelete(int no,String pwd)
	{
		boolean bCheck=false;
		String db_pwd=getSqlSession().selectOne("freeboardGetPassword", no);
		System.out.println("db_pwd="+db_pwd+",pwd="+pwd);
		if(db_pwd.equals(pwd))
		{
			bCheck=true;
			getSqlSession().delete("freeboardDelete",no);
			getSqlSession().delete("freeboardReplyDelete", no);
		}
		return bCheck;
	}
}

























