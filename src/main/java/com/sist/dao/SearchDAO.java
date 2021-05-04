package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.DietFoodVO;
import com.sist.vo.GoodsVO;
@Repository
public class SearchDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	/*
	 * <select id="searchGoods" parameterType="String" resultType="GoodsVO">
		SELECT no, title, poster, price, rownum FROM goods_list 
		WHERE title LIKE '%'||#{search}||'%' AND <![CDATA[rownum <= 8]]>
	</select>
	<select id="searchDietfood" parameterType="String" resultType="DietFoodVO">
		SELECT no, title, poster, price, rownum FROM dietfood_list 
		WHERE title LIKE '%'||#{search}||'%' AND <![CDATA[rownum <= 8]]>
	</select>


	<select id="searchGoodsAll" parameterType="hashmap" resultType="GoodsVO">
		SELECT no, title, poster, price, num 
		FROM (SELECT no, title, poster, price, rownum as num
		FROM (SELECT no, title, poster, price 
		FROM goods_list WHERE title LIKE '%'||#{search}||'%' ORDER BY no ASC)) 
        WHERE num BETWEEN #{start} AND {end};
	</select>
	<select id="searchDietfoodAll" parameterType="hashmap" resultType="DietFoodVO">
		SELECT no, title, poster, price, num 
		FROM (SELECT no, title, poster, price, rownum as num
		FROM (SELECT no, title, poster, price 
		FROM dietfood_list WHERE title LIKE '%'||#{search}||'%' ORDER BY no ASC)) 
        WHERE num BETWEEN #{start} AND {end};
	</select>
	 */
	//홈트
	
	//운동용품
	public List<GoodsVO> searchGoods(String search){
		return getSqlSession().selectList("searchGoods",search);
	}
	//다이어트 음식
	public List<DietFoodVO> searchDietfood(String search){
		return getSqlSession().selectList("searchDietfood",search);
	}
	
	//홈트만 검색
	
	//운동용품만 검색
	public List<GoodsVO> searchGoodsAll(Map map){
		return getSqlSession().selectList("searchGoodsAll", map);
	}
	public int searchGoodsAllPage(String search){
		return getSqlSession().selectOne("searchGoodsAllPage",search);
	}
	//다이어트 음식만 검색
	public List<DietFoodVO> searchDietfoodAll(Map map){
		return getSqlSession().selectList("searchDietfoodAll", map);
	}
	public int searchDietfoodAllPage(String search){
		return getSqlSession().selectOne("searchDietfoodAllPage",search);
	}
}
