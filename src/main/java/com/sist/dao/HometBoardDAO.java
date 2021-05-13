package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.FreeBoardVO;
import com.sist.vo.HometBoardVO;

import java.util.*;
@Repository
public class HometBoardDAO extends SqlSessionDaoSupport{

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
	public List<HometBoardVO> homet_freeboardListData(Map map)
	{
		return getSqlSession().selectList("homet_boardListData", map);
	}
	public int homet_freeboardTotalPage()
	{
		return getSqlSession().selectOne("homet_boardTotalPage");
	}
	// 글쓰기
	public void homet_freeboardInsert(HometBoardVO vo)
	{
		getSqlSession().insert("homet_boardInsert", vo);
	}
	// 상세보기
		public HometBoardVO homet_freeboardDetailData(int no)
		{
			getSqlSession().update("homet_boardHitIncrement", no);
			return getSqlSession().selectOne("homet_boardDetailData", no);
		}
		public HometBoardVO homet_freeboardUpdateData(int no)
		{
			return getSqlSession().selectOne("homet_boardDetailData", no);
		}
		
		
		// 수정
		public boolean homet_freeboardUpdate(HometBoardVO vo)
		{
			boolean bCheck=false;
			// 비밀번호를 가지고 온다
			String db_pwd=getSqlSession().selectOne("homet_boardGetPassword", vo.getNo());
			if(db_pwd.equals(vo.getPwd()))
			{
				bCheck=true;
				getSqlSession().update("homet_boardUpdate", vo);
			}
			else
			{
				bCheck=false;
			}
			return bCheck;
		}

		@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	     public boolean homet_freeboardDelete(int no,String pwd)
	     {
	    	 boolean bCheck=false;
	    	 // 비밀번호 읽기
	    	 String db_pwd=getSqlSession().selectOne("homet_boardGetPassword",no);
	    	 System.out.println("db_pwd="+db_pwd+",pwd="+pwd);
	    	 if(pwd.equals(db_pwd))
	    	 {
	    		 bCheck=true;
	    		 /*
	    		  *   conn.setAutoCommit(false)
	    		  */
	    		 getSqlSession().delete("homet_replyDelete",no);
	    		 getSqlSession().delete("homet_boardDelete",no);
	    		 /*
	    		  *  conn.commit()  => @Around
	    		  *  => 오류 발생 => conn.rollback() => @AfterThrowing
	    		  *  => 정상 수행 => conn.setAutoCommit(true) => @After(finally)
	    		  */
	    	 }
	    	 return bCheck;
	     }

}


























