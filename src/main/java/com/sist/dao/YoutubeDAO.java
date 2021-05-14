package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;

import javax.annotation.Resource;

import com.sist.vo.Homet_pay_inputVO;
import com.sist.vo.User_basketVO;
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
	//유튜버 나열
	public List<YoutubeVO> listYoutuber(Map map)
	{
		return getSqlSession().selectList("listYoutuber",map);
	}
	//유뷰버 당 페이지
	public List<YoutubeVO> listByYoutuber(Map map)
	{
		return getSqlSession().selectList("listByYoutuber",map);
		//cno,start, end
	}
	//유튜버 총페이지
	public int youtuberTotalPage()
	{
		return getSqlSession().selectOne("youtuberTotalPage");
	}
	//유튜버당 총페이지
	public int totalpageByYoutuber(int cno)
	{
		return getSqlSession().selectOne("totalpageByYoutuber", cno);
	}
	//유튜버 이름 할당
	public YoutubeVO youtuberName(int cno)
	{
		return getSqlSession().selectOne("youtuberName",cno);
	}
	//유료부분 찜하기
	public void hometPayInputInsert(Homet_pay_inputVO vo)
	{
		getSqlSession().insert("hometPayInputInsert",vo);
	}
	//마이페이지에서 불러오기
	public List<Homet_pay_inputVO> mypageHometpayList(String id)
	{
		return getSqlSession().selectList("mypageHometpayList",id);
	}
	//어드민 페이지에서 불러오기
	public List<Homet_pay_inputVO> adminPageHometpayList()
	{
		return getSqlSession().selectList("adminPageHometpayList");
	}
	//관리자 승인
	public void adminHtPayOKUpdate(int no)
	{
		getSqlSession().update("adminHtPayOKUpdate",no);
	}
	//바스켓 넣기
	public void youtubeBasketInsert(User_basketVO vo)
	{
		getSqlSession().insert("youtubeBasketInsert",vo);
	}
	
	
	
}
