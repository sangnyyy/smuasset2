package com.smuasset.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.smuasset.dto.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	private static final String Namespace = "com.smuasset.mapper.memberMapper";
	
	@Override
	public int loginCheck(MemberVO vo) {
		return sqlSession.selectOne(Namespace+".loginCheck", vo);
	}

	@Override
	public List<MemberVO> selectMember(MemberVO vo) {
		return sqlSession.selectList(Namespace+".selectMember", vo);
	}

	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert(Namespace+".insertMember", vo);
	}

	@Override
	public int checkId(MemberVO vo) {
		return sqlSession.selectOne(Namespace+".checkId", vo);
	}

	@Override
	public int checkNick(MemberVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".checkNick", vo);
	}

}
