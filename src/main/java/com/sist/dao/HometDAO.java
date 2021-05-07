package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.HometDetailFreeVO;
import com.sist.vo.HometMainVO;

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
	
	// 총페이지 
    public int hometTotalPage()
    {
    	return getSqlSession().selectOne("hometTotalPage");
    }
    
    // 상세페이지
    public HometDetailFreeVO hometDetailFree(int no) {
    	return getSqlSession().selectOne("hometDetailFree", no);
    }
}
