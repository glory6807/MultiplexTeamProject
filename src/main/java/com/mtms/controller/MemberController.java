package com.mtms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mtms.domain.MemberVO;
import com.mtms.service.MemberServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/member")
public class MemberController {
	
	private MemberServiceImpl memberService;
	
	@GetMapping("/join")
	public void join() {
		// 회원가입 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/join")
	public String join(MemberVO memberVO, Model model) {
		// 입력 화면에서 form action /member/join
		return "redirect:/";
	}
	
	@GetMapping("/findId")
	public void findId() {
		// 아이디 찾기 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/findId")
	public String findId(MemberVO memberVO, Model model) {
		// 아이디 찾기 화면에서 form action /member/findId
		return "redirect:/customLogin";		// 아이디 찾고 customLogin 페이지로 이동
	}
	
	@GetMapping("/findPw")
	public void findPw() {
		// 비밀번호 찾기 화면 들어가기 위한 컨트롤러
	}
	
	@PostMapping("/findPw")
	public String findPw(MemberVO memberVO, Model model) {
		// 비밀번호 찾기화면에서 포스트 매핑
		
		return "redirect:/customLogin";		// 비밀번호 찾고 customLogin 페이지로 이동
	}
}












