package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.DietFoodVO;
import com.sist.vo.GoodsVO;
import com.sist.vo.KeywordVO;
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
	
	/*
	 * <insert id="searchNewKeywordInsert" parameterType="String">
		INSERT INTO search_rank (
			SELECT NVL(MAX(no)+1,1) FROM search_rank, 
			#{keyword},
			1
		)
	</insert>
	
	<update id="searchKeywordUpdate" parameterType="String">
		UPDATE search_rank SET cnt=cnt+1 
		WHERE keyword=#{keyword}
	</update>
	
	<select id="searchKeywordIsExist" parameterType="String" resultType="int">
		SELECT COUNT(*) FROM search_rank 
		WHERE keyword=#{keyword}
	</select>
	 */
	public void searchInsert(String keyword){
		int result=getSqlSession().selectOne("searchKeywordIsExist", keyword);
		if(result==1)
			getSqlSession().update("searchKeywordUpdate", keyword);
		else
			getSqlSession().insert("searchNewKeywordInsert", keyword);
	}
	/*
	 * <select id="searchRank" resultType="com.sist.vo.KeywordVO">
		SELECT no, keyword, cnt, rownum FROM search_rank 
		ORDER BY cnt DESC 
		WHERE <![CDATA[rownum <= 10]]>
		</select>
	 */
	public List<KeywordVO> keywordList(){
		return getSqlSession().selectList("searchRank");
	}
}
