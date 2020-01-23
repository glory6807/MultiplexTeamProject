package com.mtms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.PageDTO;
import com.mtms.domain.ReviewVO;
import com.mtms.service.MovieService;
import com.mtms.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewController {
	private ReviewService service;
	private MovieService movieService;
	
	@PostMapping("remove")
	public String remove(int reviewNo,@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("BoardController remove()");
		
		if(service.remove(reviewNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/review/list";
	}
	
	@PostMapping("modify")
	public String modify(ReviewVO rvo, @ModelAttribute("cri")Criteria cri,
			RedirectAttributes rttr) {
		
		log.info("review 수정 제발 되라 modify()"+rvo);
		if(service.modify(rvo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/review/list";
		//한글처리를 안해도 되는 간편한 코드?
	}
	
	@GetMapping({"get","modify"})
	public void get(@RequestParam("reviewNo") int reviewNo,@ModelAttribute("cri")
		Criteria cri,Model model)  {
		log.info("들어온건가들어온건가들어온건가들어온건가들어온건가들어온건가들어온건가들어온건가들어온건가");
		model.addAttribute("rvo", service.get(reviewNo));
		System.out.println("컨트롤러 리뷰 번호 : "+service.get(reviewNo));
	}

	
	@GetMapping("list")
	public void getList(Criteria cri,Model model) {
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}

	@GetMapping("register")
	   public void register(int movieNo, Model model) {
	      model.addAttribute("movieTitle", movieService.getMovie(movieNo));
	      model.addAttribute("movieNo", movieNo);
	   }
	
	@PostMapping("register")
	public String register(ReviewVO rvo, RedirectAttributes rttr) {
		log.info("reviewController register()");
		service.register(rvo);
		System.out.println(rvo);
		rttr.addFlashAttribute("result",rvo.getReviewNo());
		return "redirect:/review/list";
	}
}














