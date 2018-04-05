package com.smuasset.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.smuasset.dto.CommunityVO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Inject
	SqlSession sqlSession;
	
	private static final String Namespace = "com.smuasset.mapper.communityMapper";
	@Override
	public void insertWrite(CommunityVO vo) {
		sqlSession.insert(Namespace+".insertWrite", vo);
	}
}
