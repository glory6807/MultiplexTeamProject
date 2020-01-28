package com.mtms.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mtms.domain.PageDTO;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.MyGiftVO;
import com.mtms.service.GiftService;
import com.mtms.service.MyGiftService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/myGift/")
public class MyGiftController {
	
	private MyGiftService myGiftService;
	private GiftService giftService;
	
	//내 기프티콘 목록조회
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("list")
	public void list(Criteria cri, @RequestParam("memberId") String memberId, Model model) {	
		model.addAttribute("mygift", myGiftService.getListWithPaging(cri, memberId));

		int total = myGiftService.getTotalCount(cri, memberId);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//내 기프티콘 상세보기
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("get")	
	public void get(@RequestParam("myGiftNo") int myGiftNo, @RequestParam("memberId") String memberId, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("mygift", myGiftService.get(myGiftNo, memberId));
		model.addAttribute("cri", cri);
		model.addAttribute("pic", giftService.giftPicList());
	}
	
	//내 기프티콘 기간연장(P)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("extend")	
	public String extend(MyGiftVO myGift, @RequestParam("memberId") String memberId, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(myGiftService.extend(myGift, memberId)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("myGiftNo",myGift.getMyGiftNo());
		rttr.addAttribute("memberId",myGift.getMemberId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		
		return "redirect:/myGift/list";	
	}
	
	//내 기프티콘 환불
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("refund")	
	public String refund(MyGiftVO myGift, @RequestParam("memberId") String memberId, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(myGiftService.refund(myGift, memberId)) {
			rttr.addAttribute("result", "success");
		}
		rttr.addAttribute("myGiftNo",myGift.getMyGiftNo());
		rttr.addAttribute("memberId",myGift.getMemberId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		
		return "redirect:/myGift/list";	
	} 

	//기프티콘 사진 붙이기	
	@GetMapping(value = "getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<List<GiftAttachVO>> getAttachList(int giftNo) {		
		return new ResponseEntity<>(giftService.getAttachList(giftNo), HttpStatus.OK);
	}
	
}
