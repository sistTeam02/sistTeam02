package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.sist.vo.*;
import com.sist.dao.*;
import java.util.*;
@Repository
public class QnABoardDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	/*
	 *  <select id="qnaboardListData" resultType="qnaboardVO" parameterType="hashmap">
		 SELECT no,subject,name,regdate,hit,num
		 FROM (SELECT no,subject,name,regdate,hit,rownum as num 
		 FROM (SELECT /*+ INDEX_DESC(qnaboard fb_no_pk) /no,subject,name,regdate,hit
		 FROM qnaboard))
		 WHERE num BETWEEN #{start} AND #{end}
		</select>
		<select id="qnaboardTotalPage" resultType="int">
		 SELECT CEIL(COUNT(*)/10.0) FROM qnaboard
		</select>
	 */
	public List<QnABoardVO> qnaboardListData(Map map)
	{
		return getSqlSession().selectList("qnaboardListData", map);
	}
	public int qnaboardTotalPage()
	{
		return getSqlSession().selectOne("qnaboardTotalPage");
	}
	// 글쓰기
	public void qnaboardInsert(QnABoardVO vo)
	{
		getSqlSession().insert("qnaboardInsert", vo);
	}
	// 상세보기
		public QnABoardVO qnaboardDetailData(int no)
		{
			getSqlSession().update("qnaboardHitIncrement", no);
			return getSqlSession().selectOne("qnaboardDetailData", no);
		}
		public QnABoardVO qnaboardUpdateData(int no)
		{
			return getSqlSession().selectOne("qnaboardDetailData", no);
		}
		//찾기
		public List<QnABoardVO> qnaboardFindData(Map map)
		{
			List<QnABoardVO> list=null;
			try
			{
				list=getSqlSession().selectList("qnaboardFindData", map);
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			return list;
		}
		public int qnaboardFindDataCount(Map map)
		{
			return getSqlSession().selectOne("qnaboardFindDataCount", map);
		}
		// 수정
		public boolean qnaboardUpdate(QnABoardVO vo)
		{
			boolean bCheck=false;
			// 비밀번호를 가지고 온다
			String db_pwd=getSqlSession().selectOne("qnaboardGetPassword", vo.getNo());
			if(db_pwd.equals(vo.getPwd()))
			{
				bCheck=true;
				getSqlSession().update("qnaboardUpdate", vo);
			}
			else
			{
				bCheck=false;
			}
			return bCheck;
		}

		@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	     public boolean qnaboardDelete(int no,String pwd)
	     {
	    	 boolean bCheck=false;
	    	 // 비밀번호 읽기
	    	 String db_pwd=getSqlSession().selectOne("qnaboardGetPassword",no);
	    	 System.out.println("db_pwd="+db_pwd+",pwd="+pwd);
	    	 if(pwd.equals(db_pwd))
	    	 {
	    		 bCheck=true;
	    		 /*
	    		  *   conn.setAutoCommit(false)
	    		  */
	    		 getSqlSession().delete("qnaboardReplyDelete",no);
	    		 getSqlSession().delete("qnaboardDelete",no);
	    		 /*
	    		  *  conn.commit()  => @Around
	    		  *  => 오류 발생 => conn.rollback() => @AfterThrowing
	    		  *  => 정상 수행 => conn.setAutoCommit(true) => @After(finally)
	    		  */
	    	 }
	    	 return bCheck;
	     }

}
