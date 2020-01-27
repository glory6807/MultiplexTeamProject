package com.mtms.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;
import com.mtms.domain.MyGiftVO;
import com.mtms.service.GiftService;
import com.mtms.service.MyGiftService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/gift/")
public class GiftController {
	
	private GiftService giftService;
	private MyGiftService myGiftService;
	
	//기프티콘 목록
	@GetMapping("list")	
	public void list(Model model) {
		model.addAttribute("list", giftService.getList());
		model.addAttribute("pic", giftService.giftPicList());		
	}
	
	//기프티콘 상세보기
	@GetMapping("get")	
	public void get(@RequestParam("giftNo") int giftNo, Model model) {
		model.addAttribute("gift", giftService.get(giftNo));
	}
	
	//기프티콘 등록(P)
	@PostMapping("register")	
	public String register(GiftVO gift, RedirectAttributes rttr) {
		log.info("Gift Controller register modify,,," + gift);
		if(gift.getAttachList() != null) {
			gift.getAttachList().forEach(attach -> log.warn(attach));
		}		
		giftService.register(gift);
		rttr.addFlashAttribute("result", gift.getGiftNo());	//추가적으로 새롭게 등록된 기프티콘 번호를 함께 전달
		return "redirect:/gift/list";		
	}
	
	//기프티콘 등록(G)
	@GetMapping("register")	
	public void register() {
		log.warn("Gift Controller register get,,,");
	}
	
	//기프티콘 수정(P)
	@PostMapping("modify")	
	public String modify(GiftVO gift, RedirectAttributes rttr) {
		log.info("Gift Controller modify post,," + gift);
		if(giftService.modify(gift)) {
			rttr.addAttribute("result", "success");
		}
			return "redirect:/gift/list";
	}
	
	//기프티콘 수정(G)
	@GetMapping("modify")	
	public void modify(int giftNo, Model model) {
		log.info("Gift Controller modify Get,,");
		model.addAttribute("gift", giftService.get(giftNo));
	}
	
	//기프티콘 삭제
	@PostMapping("remove")	
	public String remove(GiftVO gift, RedirectAttributes rttr) {
		log.warn("Gift Controller remove()");
		if(giftService.deleteChk(gift)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/gift/list";		
	}
	
	//기프티콘 사진 붙이기	
	@GetMapping(value = "getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<List<GiftAttachVO>> getAttachList(int giftNo) {		
		log.warn("Gift AttachList,,,," + giftNo);
		return new ResponseEntity<>(giftService.getAttachList(giftNo), HttpStatus.OK);
	}
	
	@PostMapping("paying")
	private String paying(GiftVO gift, MyGiftVO myGift, RedirectAttributes rttr) {
		// myGift에 내가 주문한 기프티콘을 insert한다. 
		
		myGiftService.myInsertSelectKey(myGift);
		rttr.addAttribute("giftNo", gift.getGiftNo());	
		rttr.addAttribute("GiftName", gift.getGiftName());	
		rttr.addAttribute("giftPrice", gift.getGiftPrice());	
		rttr.addAttribute("GiftSet", gift.getGiftSet());	
		rttr.addAttribute("memberId", myGift.getMemberId());
		
		return "redirect:/gift/pay";	
	}
	
	@GetMapping("pay")
	private void pay(@RequestParam("giftNo") int giftNo, @RequestParam("GiftName") String GiftName, @RequestParam("giftPrice") int giftPrice, @RequestParam("GiftSet") String GiftSet, Model model) {
		model.addAttribute("gift", giftService.get(giftNo));
		model.addAttribute("pic", giftService.giftPicList());
	}
	
}
