package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.domain.Criteria;
import com.mtms.domain.MemberVO;
import com.mtms.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService{
	private MemberMapper memberMapper;

	@Override
	public void join(MemberVO memberVO) {
		memberMapper.insert(memberVO);
	}

	@Override
	public String findId(MemberVO memberVO) {
		return memberMapper.selectId(memberVO);
	}

	@Override
	public int findPw(MemberVO memberVO) {
		return memberMapper.updatePw(memberVO);
	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) {
		return memberMapper.getMemberList();
	}

	@Override
	public MemberVO getMember(String memberId) {
		return memberMapper.getMember(memberId);
	}

	@Override
	public int removeMember(String memberId) {
		return memberMapper.deleteMember(memberId);
	}

	@Override
	public int modifyMember(MemberVO memberVO) {
		return 0;
	}
}
