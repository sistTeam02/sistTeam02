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
import com.sist.vo.NoticeBoardVO;

@Repository
public class NoticeBoardDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<NoticeBoardVO> noticeboardListData(Map map)
	{
		return getSqlSession().selectList("noticeboardListData", map);
	}
	public int noticeboardTotalPage()
	{
		return getSqlSession().selectOne("noticeboardTotalPage");
	}
	// 글쓰기
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void noticeboardInsert(NoticeBoardVO vo)
	{
		getSqlSession().insert("noticeboardInsert", vo);
	}
	// 상세보기
		public NoticeBoardVO noticeboardDetailData(int no)
		{
			getSqlSession().update("noticeboardHitIncrement", no);
			return getSqlSession().selectOne("noticeboardDetailData", no);
		}
		public NoticeBoardVO noticeboardUpdateData(int no)
		{
			return getSqlSession().selectOne("noticeboardDetailData", no);
		}
		//찾기
		public List<NoticeBoardVO> noticeboardFindData(Map map)
		{
			List<NoticeBoardVO> list=null;
			try
			{
				list=getSqlSession().selectList("noticeboardFindData", map);
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			return list;
		}
		public int noticeboardFindDataCount(Map map)
		{
			return getSqlSession().selectOne("noticeboardFindDataCount", map);
		}

		// 수정
		@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
		public boolean noticeboardUpdate(NoticeBoardVO vo)
		{
			boolean bCheck=false;
			// 비밀번호를 가지고 온다
			String db_pwd=getSqlSession().selectOne("noticeboardGetPassword", vo.getNo());
			if(db_pwd.equals(vo.getPwd()))
			{
				bCheck=true;
				getSqlSession().update("noticeboardUpdate", vo);
			}
			else
			{
				bCheck=false;
			}
			return bCheck;
		}
		
        // 삭제
		@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	     public boolean noticeboardDelete(int no,String pwd)
	     {
	    	 boolean bCheck=false;
	    	 // 비밀번호 읽기
	    	 String db_pwd=getSqlSession().selectOne("noticeboardGetPassword",no);
	    	 System.out.println("db_pwd="+db_pwd+",pwd="+pwd);
	    	 if(pwd.equals(db_pwd))
	    	 {
	    		 bCheck=true;
	    		 /*
	    		  *   conn.setAutoCommit(false)
	    		  */
	    		 getSqlSession().delete("noticeboardDelete",no);
	    		 /*
	    		  *  conn.commit()  => @Around
	    		  *  => 오류 발생 => conn.rollback() => @AfterThrowing
	    		  *  => 정상 수행 => conn.setAutoCommit(true) => @After(finally)
	    		  */
	    	 }
	    	 return bCheck;
	    	 
	     }
		// 파일넣기
   	    public NoticeBoardVO noticeboardFileInfoData(int no)
   		{
   			return getSqlSession().selectOne("noticeboardFileInfoData", no);
   		}

}
