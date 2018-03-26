package com.smuasset.dao;

import java.util.List;

import com.smuasset.dto.MemberVO;

public interface MemberDAO {
	public int loginCheck(MemberVO vo);
	public List<MemberVO> selectMember(MemberVO vo);
	public void insertMember(MemberVO vo);
	public int checkId(MemberVO vo);
}
