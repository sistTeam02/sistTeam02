package com.sist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.WalkVO;
@Repository
public class WalkDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	//목록
	public List<WalkVO> walkAllData(){
		return getSqlSession().selectList("walkAllData");
	}
	//상세
	public WalkVO walkDetailData(int no){
		return getSqlSession().selectOne("walkDetailData", no);
	}
}
