package com.sist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.WalkVO;
import com.sist.vo.WalkReplyVO;
@Repository
public class WalkDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	//목록
	public List<WalkVO> walkAllData(){
		return getSqlSession().selectList("walkAllData");
	}
	//상세
	public WalkVO walkDetailData(int no){
		return getSqlSession().selectOne("walkDetailData", no);
	}
	public List<WalkReplyVO> walkReplyListData(int bno){
		return getSqlSession().selectList("walkReplyListData", bno);
	}
	public void walkReplyInsert(WalkReplyVO vo){
		getSqlSession().insert("walkReplyInsert",vo);
	}
	public void walkReplyUpdate(WalkReplyVO vo){
		getSqlSession().update("walkReplyUpdate",vo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void walkReplyToReplyInsert(int root, WalkReplyVO vo){

	   	 WalkReplyVO pvo=getSqlSession().selectOne("walkReplyParentInfoData",root);

	   	 getSqlSession().update("walkReplyGroupStepIncrement",pvo);
	
	   	 vo.setGroup_id(pvo.getGroup_id());
	   	 vo.setGroup_step(pvo.getGroup_step()+1);
	   	 vo.setGroup_tab(pvo.getGroup_tab()+1);
	   	 vo.setRoot(root);
	   	 getSqlSession().insert("walkReplyToReplyInsert",vo);
	 
	   	 getSqlSession().update("walkReplyDepthIncrement",root);
	}
	
	 @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	    public void walkReplyDelete(int no)
	    {
	    	WalkReplyVO vo=getSqlSession().selectOne("walkReplyInfoData", no);
	    	if(vo.getDepth()==0) // 댓글이 없는 경우
	    	{
	    		getSqlSession().delete("walkReplyDelete",no);
	    	}
	    	else // 댓글이 있는 경우 
	    	{
	    		getSqlSession().update("walkReplyMsgUpdate",no);
	    	}
	    	getSqlSession().update("walkDepthDecrement",vo.getRoot());
	    }
}
