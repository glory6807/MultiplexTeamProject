package com.mtms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.MemberVO;
import com.mtms.service.MemberService;
import com.mtms.service.MemberServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/member")
public class MemberController {
	
	private MemberService memberService;
	
	@GetMapping("/join")
	public void join() {
		// 회원가입 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/join")
	public String join(MemberVO memberVO, RedirectAttributes rttr) {
		// 입력 화면에서 form action /member/join
		log.info("join");
		memberService.join(memberVO);
		return "redirect:/";
	}
	
	@GetMapping("/findId")
	public void findId() {
		// 아이디 찾기 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/findId")
	public String findId(MemberVO memberVO, RedirectAttributes rttr) {
		// 아이디 찾기 화면에서 form action /member/findId
		return "redirect:/customLogin";		// 아이디 찾고 customLogin 페이지로 이동
	}
	
	@GetMapping("/findPw")
	public void findPw() {
		// 비밀번호 찾기 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/findPw")
	public String findPw(MemberVO memberVO, RedirectAttributes rttr) {
		// 비밀번호 찾기화면에서 포스트 매핑
		
		return "redirect:/customLogin";		// 비밀번호 찾고 customLogin 페이지로 이동
	}
	
	@GetMapping("/list")
	public String getMemberList(MemberVO memberVO, RedirectAttributes rttr){
		// 멤버 리스트 조회 컨트롤러 // 전체 회원 목록 조회
		
		return "redirect:/member/list";
	}
	
	@GetMapping("/get")
	public String getMember(int memberId, RedirectAttributes rttr) {
		//회원 상세보기 컨틀롤러	
		
		return "redirect:/member/get";
	}
	
	@PostMapping("/remove")
	public String removeMember(int memberId, RedirectAttributes rttr) {
		// 회원 강퇴, 삭제 컨틀ㄹ로러
		
		return "redirect:/member/list";
	}
	
}












