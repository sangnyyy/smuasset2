package com.smuasset.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.smuasset.dao.MemberDAO;
import com.smuasset.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;
	
	@Override
	public int loginCheck(MemberVO vo) {
		return dao.loginCheck(vo);
	}

	@Override
	public List<MemberVO> selectMember(MemberVO vo) {
		return dao.selectMember(vo);
	}

	@Override
	public void insertMember(MemberVO vo) {
		dao.insertMember(vo);
	}

	@Override
	public int checkId(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.checkId(vo);
	}

}
