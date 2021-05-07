package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;

import javax.annotation.Resource;

import com.sist.vo.YoutubeVO;;

@Repository
public class YoutubeDAO extends SqlSessionDaoSupport{

	@Resource(name="ssf")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	//유튜브 리스트
	public List<YoutubeVO> youtubeListData(Map map)
	{
		return getSqlSession().selectList("youtubeListData",map);
	}
	//총 페이지 데이터 가져오기
	public int youtubeTotalPage()
	{
		return getSqlSession().selectOne("youtubeTotalPage");
	}
	//유튜브 디테일 페이지
	public YoutubeVO detailYoutubeData(int no)
	{
		return getSqlSession().selectOne("detailYoutubeData",no);
	}
}
