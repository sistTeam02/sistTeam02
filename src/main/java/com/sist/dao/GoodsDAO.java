package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import java.util.*;

import javax.annotation.Resource;

import com.sist.vo.*;
@Repository
public class GoodsDAO extends SqlSessionDaoSupport {

	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<GoodsVO> goodsListData(Map map)
	{
		return getSqlSession().selectList("goodsListData", map);
	}
	
	public int goodsTotalPage()
	{
		return getSqlSession().selectOne("goodsTotalPage");
	}
	
	public GoodsDetailVO goodsDetailData(int no)
	{
		return getSqlSession().selectOne("goodsDetailData", no);
	}
	
}
