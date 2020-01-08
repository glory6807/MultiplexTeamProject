package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.MemberVO;

public interface MemberMapper {
	// 회원 가입 매퍼
	public void insert(MemberVO memberVO);
	// 회원 아이디 찾기
	public String selectId(MemberVO memberVO);
	// 회원 비밀번호 찾기 -> 비밀번호 재설정
	public int updatePw(MemberVO memberVO);
	// 회원 목록 조회 하기
	public List<MemberVO> getMemberList();
	// 회원 상세 보기
	public MemberVO getMember(int memberId);
	// 회원 삭제 하기
	public int deleteMember(int memberId);
}
