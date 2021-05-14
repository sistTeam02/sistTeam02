package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
@Repository
public class ShopOrderDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	// 주문 정보
	public void orderInfo(ShopOrderVO ovo)
	{
		getSqlSession().insert("orderInfo", ovo);
	}
	
	// 주문 상세 정보
	public void orderInfoDetail(ShopOrderDetailVO odvo)
	{
		getSqlSession().insert("orderInfoDetail", odvo);
	}
}
