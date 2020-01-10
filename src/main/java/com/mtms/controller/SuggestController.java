package com.mtms.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.SuggestVO;
import com.mtms.service.SuggestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/suggest/")
public class SuggestController {
	
	private SuggestService suggestService;
	
	@GetMapping("register")
	public void register() {
		// 건의사항 등록 화면으로 이동
	}
	
	@PostMapping("register")
	public String register(SuggestVO sugeestVO, RedirectAttributes rttr) {
		// 건의사항 등록
		return null;
	}
	
	@PostMapping("modify")
	public String modify(SuggestVO sugeestVO, RedirectAttributes rttr) {
		// 건의사항 수정
		return null;
	}
	
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		// 건의사항 게시글 전체 조회
	}
	
	@GetMapping({"get", "modify"})
	public void get(int suggestNo, @ModelAttribute("cri") Criteria cri, Model model) {
		// 건의사항 게시글 상세보기 화면으로 이동
	}
	
	@PostMapping("remove")
	public String remove(int suggestNo, RedirectAttributes rttr) {
		// 건의사항 게시글 삭제
		return null;
	}
	
	
	

}
