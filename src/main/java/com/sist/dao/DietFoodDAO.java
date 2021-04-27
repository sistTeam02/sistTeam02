package com.sist.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.vo.*;

@Repository
public class DietFoodDAO extends SqlSessionDaoSupport {

	@Resource(name="ssf")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<DietFoodVO> dfoodListData(Map map)
	{
		return getSqlSession().selectList("dfoodListData", map);
	}
	
	public int dfoodTotalPage()
	{
		return getSqlSession().selectOne("dfoodTotalPage");
	}
	
	public DietFoodDetailVO dfoodDetailData(int no)
	{
		return getSqlSession().selectOne("dfoodDetailData", no);
	}
	
}
