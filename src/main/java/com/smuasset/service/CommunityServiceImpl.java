package com.smuasset.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.smuasset.dao.CommunityDAO;
import com.smuasset.dto.CommunityVO;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Inject
	CommunityDAO dao;
	
	@Override
	public void insertWrite(CommunityVO vo) {
		dao.insertWrite(vo);
	}

}
