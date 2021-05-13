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
	public List<HometBoardReplyVO> homet_replyListData(int bno)
	{
		return getSqlSession().selectList("homet_replyListData", bno);
	}
	// 등록
	public void homet_replyInsert(HometBoardReplyVO vo)
	{
		getSqlSession().insert("homet_replyInsert", vo);
	}
	
	// 수정
	public void homet_replyUpdate(HometBoardReplyVO vo)
	{
		getSqlSession().update("homet_replyUpdate", vo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void homet_replyToReplyInsert(int root,HometBoardReplyVO vo)
	{
		// 1. 상위정보
		HometBoardReplyVO pvo=getSqlSession().selectOne("homet_replyParentInfoData", root);
		getSqlSession().update("homet_replyGroupStepIncrement", pvo);
		// 실제 추가
		vo.setGroup_id(pvo.getGroup_id());
		vo.setGroup_step(pvo.getGroup_step()+1);
		vo.setGroup_tab(pvo.getGroup_tab()+1);
		vo.setRoot(root);
		getSqlSession().insert("homet_replyToReplyInsert", vo);
		// depth 증가
		getSqlSession().update("homet_replyDepthIncrement", root);
	}
	// 삭제
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void homet_replyDelete(int no)
	{
		HometBoardReplyVO vo=getSqlSession().selectOne("homet_replyInfoData", no);
		if(vo.getDepth()==0) // 댓글이 없는 경우
		{
			getSqlSession().delete("homet_replyDelete", no);
		}
		else // 댓글이 있는 경우
		{
			getSqlSession().update("homet_replyMsgUpdate", no);
		}
		getSqlSession().update("homet_depthDecrement", vo.getRoot());
	}
	
	

}
