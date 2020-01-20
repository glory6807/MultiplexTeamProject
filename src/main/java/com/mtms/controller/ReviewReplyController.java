package com.mtms.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReplyPageDTO;
import com.mtms.domain.ReplyVO;
import com.mtms.service.ReviewReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/replies/*")
public class ReviewReplyController {
	
	private ReviewReplyService replyService;
	
	@GetMapping(value = "pages/{reviewNo}/{page}")
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("reviewNo") int reviewNo, 
			@PathVariable("page") int page) {
		  log.info("Controller - getList");
	        // 댓글의 페이지수를 받아서 10개씩 페이징할 것
	        Criteria cri = new Criteria(page,10);
	        log.info("Controller - getList - cri : " + cri);
	        // service에서 받아온 리스트의 값과 OK를 함께 넘김
//	        return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK);
	        return new ResponseEntity<>(replyService.getListPage(cri, reviewNo), HttpStatus.OK);
	}
			
	@PostMapping(value = "new",
					 consumes = "application/json",
					 produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> register(@RequestBody ReplyVO revo){
		log.info("ReplyVO : " + revo);

		int insertCount = replyService.register(revo);

		log.info("Reply INSERT COUNT " + insertCount);
		// result가 1이면(성공) : ResponseEntity로 success 와 OK 보냄
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	@GetMapping(value = "{replyNo}")
		public ResponseEntity<ReplyVO> get(@PathVariable("replyNo") int replyNo){
		//댓글을 상세보기하기위한 메소드
			return new ResponseEntity<>(replyService.get(replyNo),HttpStatus.OK);
		
	}
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH},
					   	value = "{replyNo}",
					   	produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> modify(@PathVariable("replyNo") int replyNo, @RequestBody ReplyVO revo){
		//댓글 수정하기위한 메소드
		revo.setReplyNo(replyNo);
			return replyService.modify(revo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
			

	@DeleteMapping(value = "{replyNo}", produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> remove(@PathVariable("replyNo") int replyNo){
		log.info("Controller - remove : " + replyNo);
        // 댓글 삭제가 성공되면 (1) success와 OK보냄
     return replyService.remove(replyNo) == 1 ?
           new ResponseEntity<>("success", HttpStatus.OK) :
           new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
}
