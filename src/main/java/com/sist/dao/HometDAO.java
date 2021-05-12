package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.HometDetailVO;
import com.sist.vo.HometMainVO;
import com.sist.vo.HometPayVO;

import java.util.*;
@Repository
public class HometDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	// 목록 출력
	public List<HometMainVO> hometListData(Map map) {
		return getSqlSession().selectList("hometListData",map);
	}
	
	// 유료 페이지 목록 출력
	public List<HometPayVO> hometPayListData(Map map) {
		return getSqlSession().selectList("hometPayListData", map);
	}
	
	// 챌린지 목록 출력
	public List<HometMainVO> hometChallengeListData(Map map) {
		return getSqlSession().selectList("hometChallengeListData", map);
	}
	
	// 총페이지 
    public int hometTotalPage()
    {
    	return getSqlSession().selectOne("hometTotalPage");
    }
    
    // 챌린지 총 페이지
    public int hometChallengeTotalPage() {
    	return getSqlSession().selectOne("hometChallengeTotalPage");
    }   
    
    // 상세 페이지
    public HometDetailVO hometDetailFree(int no) {
    	return getSqlSession().selectOne("hometDetailFree", no);
    }
    
    // 유료 상세 페이지
    public HometPayVO hometPayDetail(int no) {
    	return getSqlSession().selectOne("hometPayDetail", no);
    }
    // 챌린지 상세페이지
    public HometDetailVO hometChallengeDetail(int no) {
    	return getSqlSession().selectOne("hometChallengeDetail", no);
    } 
    
}
