package com.sist.dao;



import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

import java.util.*;

@Repository
public class MemberDAO extends SqlSessionDaoSupport{
	@Autowired
	@Qualifier("ssf")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public String isLogin(String id, String pwd)
	{
		String result="";
		int count=getSqlSession().selectOne("memberIdCount",id);
		if(count==0)
		{
			result="NOID"; //id 없음
		}
		else//id 오케이
		{
			MemberVO vo=getSqlSession().selectOne("memberPasswordCheck",id);
			String db_pwd=vo.getPwd();
			String name=vo.getName();
			
			if(db_pwd.equals(pwd))
			{
				result=name; //비밀번호ok 로그인
			}
			else
			{
				result="NOPWD"; 
			}
		}
		return result;
			
	}
	
	//아이디 중복체크
	public int memberIdCount(String id)
	{
		int count=getSqlSession().selectOne("memberIdCount",id);
		
		return count;
	}
	//주소 불러오기
	public List<ZipcodeVO> joinAddress(String dong)
	{
		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
	
		
		return list;
	}
	//회원가입
	public void registerMember(MemberVO vo)
	{
		getSqlSession().insert("memberJoin",vo);
	}
}
