package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.DietFoodVO;
import com.sist.vo.GoodsVO;
import com.sist.vo.HometMainVO;
import com.sist.vo.HometPayVO;
import com.sist.vo.KeywordVO;
import com.sist.vo.YoutubeVO;
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
	/*
	 * <select id="searchhomet" parameterType="String" resultType="HometVO">
		SELECT no, title, poster, rownum FROM hometraining_main 
		WHERE title LIKE '%'||#{search}||'%' AND <![CDATA[rownum <= 6]]>
	</select>
	 */
	public List<HometMainVO> searchHomet(String search){
		return getSqlSession().selectList("searchHomet", search);
	}
	//운동용품
	public List<GoodsVO> searchGoods(String search){
		return getSqlSession().selectList("searchGoods",search);
	}
	//다이어트 음식
	public List<DietFoodVO> searchDietfood(String search){
		return getSqlSession().selectList("searchDietfood",search);
	}
	/*
	 * <select id="searchYoutube" parameterType="String" resultType="YoutubeVO">
		SELECT no, title, poster, rownum FROM youtube_data_v2 
		WHERE title LIKE '%'||#{search}||'%' AND <![CDATA[rownum <= 6]]>
	</select>
	 */
	//유튜브 검색
	public List<YoutubeVO> searchYoutube (String search){
		return getSqlSession().selectList("searchYoutube",search);
	}
	
	//홈트만 검색
	//<select id="searchHometAll" parameterType="hashmap" resultType="HometVO">
	public List<HometMainVO> searchHometAll(Map map){
		return getSqlSession().selectList("searchHometAll", map);
	}
	//<select id="searchHometAllPage" resultType="int" parameterType="string">
	public int searchHometAllPage (String search){
		return getSqlSession().selectOne("searchHometAllPage", search);
	}
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
	//유튜브만 검색
	/*
	 * 
	<select id="searchYoutubeAll" parameterType="hashmap" resultType="YoutubeVO">
	<select id="searchYoutubeAllPage" resultType="int" parameterType="string">
	 */
	public List<YoutubeVO> searchYoutubeAll(Map map){
		return getSqlSession().selectList("searchYoutubeAll", map);
	}
	public int searchYoutubeAllPage(String search){
		return getSqlSession().selectOne("searchYoutubeAllPage",search);
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
	
	/*
	 * <select id="hometKeyword" resultType="string">
		SELECT keyword FROM 
		(SELECT keyword, rownum FROM homet_keyword ORDER BY cnt DESC )
		WHERE <![CDATA[rownum <= 10]]>
	</select>
	
	<select id="goodsKeyword" resultType="string">
		SELECT keyword FROM 
		(SELECT keyword, rownum FROM goods_keyword ORDER BY cnt DESC )
		WHERE <![CDATA[rownum <= 10]]>
	</select>
	
	<select id="foodsKeyword" resultType="string">
		SELECT keyword FROM 
		(SELECT keyword, rownum FROM foods_keyword ORDER BY cnt DESC )
		WHERE <![CDATA[rownum <= 10]]>
	</select>
	 */
	
	public List<String> hometKeyword(){
		return getSqlSession().selectList("hometKeyword");
	}
	
	public List<String> goodsKeyword(){
		return getSqlSession().selectList("goodsKeyword");
	}
	
	public List<String> foodsKeyword(){
		return getSqlSession().selectList("foodsKeyword");
	}
	/*
	 * <select id="goodsKeywordSearch" parameterType="hashmap" resultType="GoodsVO">
		SELECT no, title, poster, price, num 
		FROM (SELECT no, title, poster, price, rownum as num
		FROM (SELECT no, title, poster, price 
		FROM goods_list WHERE title LIKE '%'||#{search}||'%' AND WHERE title LIKE '%'||#{keyword}||'%'
		ORDER BY no ASC)) 
        WHERE num BETWEEN #{start} AND #{end}
	</select>
	
	<select id="foodsKeywordSearch" parameterType="hashmap" resultType="DietFoodVO">
		SELECT no, title, poster, price, num 
		FROM (SELECT no, title, poster, price, rownum as num
		FROM (SELECT no, title, poster, price 
		FROM dietfood_list WHERE title LIKE '%'||#{search}||'%' AND WHERE title LIKE '%'||#{keyword}||'%'
		ORDER BY no ASC)) 
        WHERE num BETWEEN #{start} AND #{end}
	</select>
	 */
	
	public List<GoodsVO> goodsKeywordSearch(Map map){
		return getSqlSession().selectList("goodsKeywordSearch", map);
	}
	
	public List<DietFoodVO> foodsKeywordSearch (Map map){
		return getSqlSession().selectList("foodsKeywordSearch",	map);
	}
	/*
	 * <select id="goodsKeywordPage" parameterType="hashmap" resultType="int">
		SELECT CEIL(COUNT(*)/12.0) FROM goods_list 
		WHERE title LIKE '%'||#{search}||'%' AND WHERE title LIKE '%'||#{keyword}||'%'
	</select>
	
	<select id="foodsKeywordPage" parameterType="hashmap" resultType="int">
		SELECT CEIL(COUNT(*)/12.0) FROM dietfood_list 
		WHERE title LIKE '%'||#{search}||'%' AND WHERE title LIKE '%'||#{keyword}||'%'
	</select>
	 */
	public int goodsKeywordPage(Map map){
		return getSqlSession().selectOne("goodsKeywordPage",map);
	}
	
	public int foodsKeywordPage(Map map){
		return getSqlSession().selectOne("foodsKeywordPage",map);
	}
	/*
	 * <select id="searchAutocomplete" parameterType="string" resultType="string">
		SELECT title FROM goods_list, dietfood_list, hometraining_main 
		WHERE title LIKE '%'||#{search}||'%'
	</select>
	 * 
	 */
	public List<String> searchAutocomplete(String search){
		return getSqlSession().selectList("searchAutocomplete", search);
	}
	
	/*
	 * <select id="orderList" resultType="String">
		SELECT title FROM
		(SELECT title, rownum FROM
		(SELECT title, count(*) as c FROM user_order_basket GROUP BY title)
		ORDER BY c desc)
		WHERE <![CDATA[rownum <= 10]]>
	</select>
	 */
	public List<KeywordVO> orderList(){
		return getSqlSession().selectList("orderList");
	}
	
	/*
	 * <select id="searchEmptyHomet" parameterType="String" resultType="HometMainVO">
		SELECT no, title, poster, rownum FROM hometraining_main 
		WHERE title LIKE '%'||#{search}||'%' AND <![CDATA[rownum <= 8]]>
	</select>
	<select id="searchEmptyGoods" parameterType="String" resultType="GoodsVO">
		SELECT no, title, poster, price, rownum FROM goods_list 
		WHERE title LIKE '%'||#{search}||'%' AND <![CDATA[rownum <= 8]]>
	</select>
	<select id="searchEmptyDietfood" parameterType="String" resultType="DietFoodVO">
		SELECT no, title, poster, price, rownum FROM dietfood_list 
		WHERE title LIKE '%'||#{search}||'%' AND <![CDATA[rownum <= 8]]>
	</select>
	<select id="searchEmptyYoutube" parameterType="String" resultType="YoutubeVO">
		SELECT no, title, thumbnails, rownum FROM youtube_data_v2 
		WHERE title LIKE '%'||#{search}||'%' AND <![CDATA[rownum <= 8]]>
	</select>
	 */
	
	public List<HometMainVO> searchEmptyHomet(int num){
		return getSqlSession().selectList("searchEmptyHomet", num);
	}
	public List<GoodsVO> searchEmptyGoods(int num){
		return getSqlSession().selectList("searchEmptyGoods", num);
	}
	public List<DietFoodVO> searchEmptyDietfood(int num){
		return getSqlSession().selectList("searchEmptyDietfood", num);
	}
	public List<YoutubeVO> searchEmptyYoutube(int num){
		return getSqlSession().selectList("searchEmptyYoutube", num);
	}
}
