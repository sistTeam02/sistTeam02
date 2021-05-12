package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.HometBoardReplyVO;

import java.util.*;

import javax.annotation.Resource;

@Repository
public class HometBoardReplyDAO extends SqlSessionDaoSupport{

	@Resource(name="ssf")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public List<HometBoardReplyVO> replyListData(int bno)
	{
		return getSqlSession().selectList("replyListData", bno);
	}
	// 등록
	public void replyInsert(HometBoardReplyVO vo)
	{
		getSqlSession().insert("replyInsert", vo);
	}
	
	// 수정
	public void replyUpdate(HometBoardReplyVO vo)
	{
		getSqlSession().update("replyUpdate", vo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void replyToReplyInsert(int root,HometBoardReplyVO vo)
	{
		// 1. 상위정보
		HometBoardReplyVO pvo=getSqlSession().selectOne("replyParentInfoData", root);
		getSqlSession().update("replyGroupStepIncrement", pvo);
		// 실제 추가
		vo.setGroup_id(pvo.getGroup_id());
		vo.setGroup_step(pvo.getGroup_step()+1);
		vo.setGroup_tab(pvo.getGroup_tab()+1);
		vo.setRoot(root);
		getSqlSession().insert("replyToReplyInsert", vo);
		// depth 증가
		getSqlSession().update("replyDepthIncrement", root);
	}
	// 삭제
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void replyDelete(int no)
	{
		HometBoardReplyVO vo=getSqlSession().selectOne("replyInfoData", no);
		if(vo.getDepth()==0) // 댓글이 없는 경우
		{
			getSqlSession().delete("replyDelete", no);
		}
		else // 댓글이 있는 경우
		{
			getSqlSession().update("replyMsgUpdate", no);
		}
		getSqlSession().update("depthDecrement", vo.getRoot());
	}
	
	

}
